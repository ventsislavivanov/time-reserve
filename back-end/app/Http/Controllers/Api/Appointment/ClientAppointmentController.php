<?php

namespace App\Http\Controllers\Api\Appointment;

use App\AppointmentStatus;
use App\Http\Controllers\Controller;
use App\Http\Requests\Appointment\AppointmentReasonRequest;
use App\Http\Requests\Appointment\AppointmentStoreRequest;
use App\Http\Resources\Appointment\AppointmentCollection;
use App\Http\Resources\Appointment\AppointmentHistoryCollection;
use App\Http\Resources\Appointment\AppointmentResource;
use App\Models\Appointment;
use App\Models\Service;
use App\Services\AvailabilityService;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;

class ClientAppointmentController extends Controller
{
	public function __construct(
		protected AvailabilityService $availabilityService
	) {}

	#[OA\Get(
		path: '/api/appointments',
		operationId: 'appointmentsIndex',
		description: 'Returns a paginated list of appointments for the authenticated client, ordered by date descending.',
		summary: 'Get client appointments',
		security: [['sanctum' => []]],
		tags: ['Appointments']
	)]
	#[OA\Parameter(name: 'page', in: 'query', required: false, schema: new OA\Schema(type: 'integer', example: 1))]
	#[OA\Response(
		response: 200,
		description: 'Paginated list of appointments',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentCollection')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	public function index(): AppointmentCollection
	{
        $perPage = request('per_page', 10);

		$appointments = Appointment::where('client_id', auth()->id())
			->with([
				'service:id,name,duration,price',
				'worker:id,name'
			])
			->select(['id', 'service_id', 'worker_id', 'client_id', 'starts_at', 'ends_at', 'status', 'notes'])
			->orderBy('starts_at', 'desc')
			->paginate($perPage);

		return new AppointmentCollection($appointments);
	}

	#[OA\Post(
		path: '/api/appointments',
		operationId: 'appointmentsStore',
		description: 'Books a new appointment for the authenticated client.',
		summary: 'Create a new appointment',
		security: [['sanctum' => []]],
		tags: ['Appointments']
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentStoreRequest')
	)]
	#[OA\Response(
		response: 201,
		description: 'Appointment created',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function store(AppointmentStoreRequest $request): JsonResponse|AppointmentResource
	{
		$this->authorize('store', Appointment::class);

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

	#[OA\Patch(
		path: '/api/appointments/{appointment}/cancel',
		operationId: 'appointmentCancel',
		description: 'Allows the authenticated client to cancel their own appointment.',
		summary: 'Cancel an appointment',
		security: [['sanctum' => []]],
		tags: ['Appointments']
	)]
	#[OA\Parameter(name: 'appointment', in: 'path', required: true, schema: new OA\Schema(type: 'integer', example: 1))]
	#[OA\RequestBody(
		required: false,
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentReasonRequest')
	)]
	#[OA\Response(
		response: 200,
		description: 'Appointment cancelled',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]
	#[OA\Response(response: 422, description: 'Cannot cancel appointment in current status')]
	public function cancel(AppointmentReasonRequest $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('cancel', $appointment);

		$appointment->ensureCanBeCancelled();

		$appointment->changeStatus(AppointmentStatus::Cancelled, $request->reason);

		return new AppointmentResource($appointment);
	}

	#[OA\Get(
		path: '/api/appointments/{appointment}/history',
		operationId: 'appointmentHistory',
		description: 'Returns the full status change history for a specific appointment. Accessible by the appointment owner, assigned worker, or admin.',
		summary: 'Get appointment history timeline',
		security: [['sanctum' => []]],
		tags: ['Appointments']
	)]
	#[OA\Parameter(
		name: 'appointment',
		in: 'path',
		required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(
		response: 200,
		description: 'Appointment history timeline',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentHistoryCollection')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]

	public function history(Appointment $appointment): AppointmentHistoryCollection
	{
		$this->authorize('view', $appointment);

		$history = $appointment->history()
			->with('user:id,name')
			->orderBy('created_at')
			->get();

		return new AppointmentHistoryCollection($history);
	}
}
