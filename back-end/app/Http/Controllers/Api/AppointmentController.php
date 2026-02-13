<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateAppointmentRequest;
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
	public function index(Request $request): JsonResponse
	{
		$appointments = Appointment::where('client_id', auth()->id())
			->with(['service', 'worker'])
			->orderBy('starts_at', 'desc')
			->paginate(10);

		return response()->json($appointments);
	}

	/**
	 * Booking an appointment
	 */
	public function store(CreateAppointmentRequest $request): JsonResponse
	{
		$client = auth()->user();
		if (!$client->canBookAppointments()) {
			return response()->json([
				'message' => 'You are not allowed to book appointments'
			], 403);
		}

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

		return response()->json($appointment->load(['service', 'worker']), 201);
	}

	public function cancel(Appointment $appointment): JsonResponse
	{
		$this->authorize('cancel', $appointment);

		if ($appointment->isCancelled()) {
			return response()->json(['message' => 'Already cancelled'], 400);
		}

		$appointment->update(['status' => 'cancelled']);

		return response()->json($appointment);
	}

	public function confirm(Appointment $appointment): JsonResponse
	{
		$this->authorize('update', $appointment);

		if (!$appointment->isPending()) {
			return response()->json(['message' => 'Only pending appointments can be confirmed'], 400);
		}

		$appointment->update(['status' => 'confirmed']);

		return response()->json($appointment);
	}

	public function reject(Appointment $appointment): JsonResponse
	{
		$this->authorize('reject', $appointment);

		if (!$appointment->isPending()) {
			return response()->json(['message' => 'Only pending appointments can be rejected'], 400);
		}

		$appointment->update([
			'status' => 'rejected',
			'cancelled_by' => auth()->user()->id
		]);

		return response()->json($appointment);
	}

	/**
	 * Admin/Worker declines CONFIRMED appointment
	 * Reason: illness, emergency, force majeure
	 */
	public function decline(Appointment $appointment): JsonResponse
	{
		$this->authorize('decline', $appointment);

		if (!$appointment->isConfirmed()) {
			return response()->json(['message' => 'Only confirmed appointments can be declined'], 400);
		}

		$appointment->update([
			'status' => 'declined',
			'cancelled_by' => auth()->user()->id
		]);

		return response()->json($appointment);
	}

	public function complete(Appointment $appointment): JsonResponse
	{
		$this->authorize('update', $appointment);

		if (!$appointment->isConfirmed()) {
			return response()->json(['message' => 'Only confirmed appointments can be completed'], 400);
		}

		$appointment->update(['status' => 'completed']);

		return response()->json($appointment);
	}

	public function staffIndex(Request $request): JsonResponse
	{
		$this->authorize('viewAny', Appointment::class);

		$user = auth()->user();

		$appointments = Appointment::with(['service', 'worker', 'client'])
			->when($user->isWorker(), fn($q) => $q->where('worker_id', $user->id))
			->when($request->status, fn($q) => $q->where('status', $request->status))
			->when($request->worker_id && $user->isAdmin(), fn($q) => $q->where('worker_id', $request->worker_id))
			->orderBy('starts_at', 'desc')
			->paginate(20);

		return response()->json($appointments);
	}
}