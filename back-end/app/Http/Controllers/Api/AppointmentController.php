<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateAppointmentRequest;
use App\Http\Requests\RejectAppointmentRequest;
use App\Http\Resources\Appointment\AppointmentCollection;
use App\Http\Resources\Appointment\AppointmentResource;
use App\Models\Appointment;
use App\Models\Service;
use App\Services\AvailabilityService;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class AppointmentController extends Controller
{
	public function __construct(
		protected AvailabilityService $availabilityService
	) {}

	/**
	 * All customer hours
	 */
	public function index(): AppointmentCollection
	{
		$appointments = Appointment::where('client_id', auth()->id())
			->with([
				'service:id,name,duration,price',
				'worker:id,name'
			])
			->select(['id', 'service_id', 'worker_id', 'client_id', 'starts_at', 'ends_at', 'status', 'notes', 'cancelled_by'])
			->orderBy('starts_at', 'desc')
			->paginate(10);

		return new AppointmentCollection($appointments);
	}

	/**
	 * Booking an appointment
	 */
	public function store(CreateAppointmentRequest $request): JsonResponse|AppointmentResource
	{
		$this->authorize('create', Appointment::class);

		$service = Service::findOrFail($request->service_id);
		$startsAt = Carbon::parse($request->starts_at);
		$endsAt = $startsAt->copy()->addMinutes(
			$service->duration + $service->preparation_time + $service->cleanup_time
		);

		// Check if the slot is free
		if (!$this->availabilityService->isSlotAvailable($request->worker_id, $startsAt, $endsAt)) {
			return response()->json([
				'message' => 'This time slot is no longer available'
			], 422);
		}

		$appointment = Appointment::create([
			'client_id' => auth()->id(),
			'worker_id' => $request->worker_id,
			'service_id' => $request->service_id,
			'starts_at' => $startsAt,
			'ends_at' => $endsAt,
			'notes' => $request->notes,
			'status' => 'pending',
		]);

		return new AppointmentResource($appointment->load(['service', 'worker']));
	}

	public function cancel(Request $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('cancel', $appointment);

		$appointment->changeStatus('cancelled', $request->reason);

		return new AppointmentResource($appointment);
	}

	public function confirm(Request $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('confirm', $appointment);

		$appointment->changeStatus('confirmed');

		return new AppointmentResource($appointment);
	}

	public function reject(RejectAppointmentRequest $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('reject', $appointment);

		$appointment->changeStatus('rejected', $request->reason);

		return new AppointmentResource($appointment);
	}

	/**
	 * Admin/Worker declines CONFIRMED appointment
	 * Reason: illness, emergency, force majeure
	 */
	public function decline(Request $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('decline', $appointment);

		$appointment->changeStatus('declined', $request->reason);

		return new AppointmentResource($appointment);
	}

	public function complete(Request $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('complete', $appointment);

		$appointment->changeStatus('completed', $request->reason);

		return new AppointmentResource($appointment);
	}

	public function markNoShow(Request $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('noShow', $appointment);

		$appointment->changeStatus('no_show', $request->reason);

		return new AppointmentResource($appointment);
	}

	public function staffIndex(Request $request): AppointmentCollection
	{
		$this->authorize('viewAny', Appointment::class);

		$user = auth()->user();

		$appointments = Appointment::with([
			'service:id,name,duration,price',
			'worker:id,name',
			'client:id,name',
			'changedBy:id,name' // Eager load changed_by relation
		])
			->when($user->isWorker(), fn($q) => $q->where('worker_id', $user->id))
			->when($request->status, fn($q) => $q->where('status', $request->status))
			->when($request->worker_id && $user->isAdmin(), fn($q) => $q->where('worker_id', $request->worker_id))
			->orderBy('starts_at', 'desc')
			->paginate(20);

		return new AppointmentCollection($appointments);
	}
}