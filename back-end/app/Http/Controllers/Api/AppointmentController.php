<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Appointment\AppointmentReasonRequest;
use App\Http\Requests\Appointment\AppointmentStoreRequest;
use App\Http\Resources\Appointment\AppointmentCollection;
use App\Http\Resources\Appointment\AppointmentResource;
use App\Models\Appointment;
use App\Models\Service;
use App\Services\AvailabilityService;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;

class AppointmentController extends Controller
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

	#[OA\Patch(
		path: '/api/appointments/{appointment}/cancel',
		operationId: 'appointmentsCancel',
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

		$appointment->changeStatus('cancelled', $request->reason);

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/appointments/{appointment}/confirm',
		operationId: 'appointmentsConfirm',
		summary: 'Confirm an appointment',
		security: [['sanctum' => []]],
		tags: ['Appointments']
	)]
	#[OA\Parameter(name: 'appointment', in: 'path', required: true, schema: new OA\Schema(type: 'integer', example: 1))]
	#[OA\Response(
		response: 200,
		description: 'Appointment confirm',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]
	#[OA\Response(response: 422, description: 'Cannot confirm appointment in current status')]
	public function confirm(AppointmentReasonRequest $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('confirm', $appointment);

		$appointment->changeStatus('confirmed');

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/reject',
		operationId: 'appointmentsReject',
		summary: 'Reject an appointment',
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
		description: 'Appointment rejected',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]
	#[OA\Response(response: 422, description: 'Cannot reject appointment in current status')]
	public function reject(AppointmentReasonRequest $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('reject', $appointment);

		$appointment->changeStatus('rejected', $request->reason);

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/decline',
		operationId: 'appointmentsDecline',
		summary: 'Decline an appointment',
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
		description: 'Appointment declined',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]
	#[OA\Response(response: 422, description: 'Cannot decline appointment in current status')]
	public function decline(AppointmentReasonRequest $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('decline', $appointment);

		$appointment->changeStatus('declined', $request->reason);

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/complete',
		operationId: 'appointmentsComplete',
		summary: 'Complete an appointment',
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
		description: 'Appointment completed',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]
	#[OA\Response(response: 422, description: 'Cannot complete appointment in current status')]
	public function complete(AppointmentReasonRequest $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('complete', $appointment);

		$appointment->changeStatus('completed', $request->reason);

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/no-show',
		operationId: 'appointmentsNoShow',
		summary: 'Mark appointment as no-show',
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
		description: 'Appointment marked as no-show',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]
	#[OA\Response(response: 422, description: 'Cannot mark as no-show in current status')]
	public function markNoShow(AppointmentReasonRequest $request, Appointment $appointment): AppointmentResource
	{
		$this->authorize('noShow', $appointment);

		$appointment->changeStatus('no_show', $request->reason);

		return new AppointmentResource($appointment);
	}

	#[OA\Get(
		path: '/api/staff/appointments',
		operationId: 'appointmentsStaffIndex',
		description: 'Returns a paginated list of all appointments. Accessible by admin and worker roles.',
		summary: 'Get all appointments (staff)',
		security: [['sanctum' => []]],
		tags: ['Appointments']
	)]
	#[OA\Parameter(name: 'page', in: 'query', required: false, schema: new OA\Schema(type: 'integer', example: 1))]
	#[OA\Parameter(
		name: 'status',
		in: 'query',
		required: false,
		schema: new OA\Schema(
			type: 'string',
			enum: ['pending', 'confirmed', 'cancelled', 'rejected', 'declined', 'no_show', 'completed'],
			example: 'pending'
		)
	)]
	#[OA\Parameter(name: 'worker_id', in: 'query', required: false, schema: new OA\Schema(type: 'integer', example: 2))]
	#[OA\Parameter(name: 'date', in: 'query', required: false, schema: new OA\Schema(type: 'string', format: 'date', example: '2026-03-15'))]
	#[OA\Response(
		response: 200,
		description: 'Paginated list of appointments',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentCollection')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
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