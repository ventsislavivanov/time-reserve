<?php

namespace App\Http\Controllers\Api\Appointment;

use App\AppointmentStatus;
use App\Http\Controllers\Controller;
use App\Http\Requests\Appointment\AppointmentReasonRequest;
use App\Http\Resources\Appointment\AppointmentCollection;
use App\Http\Resources\Appointment\AppointmentResource;
use App\Models\Appointment;
use App\Notifications\AppointmentConfirmedNotification;
use App\Notifications\AppointmentDeclinedNotification;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;

class StaffAppointmentController extends Controller
{
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
			enum: ['pending', 'cancelled', 'declined', 'confirmed', 'in_progress', 'completed', 'no_show', 'expired'],
			example: 'pending'
		)
	)]
	#[OA\Parameter(name: 'worker_id', in: 'query', required: false, schema: new OA\Schema(type: 'integer', example: 2))]
	#[OA\Parameter(name: 'date', in: 'query', required: false, schema: new OA\Schema(type: 'string', format: 'date', example: '2026-03-15'))]
	#[OA\Parameter(name: 'id', in: 'query', required: false, schema: new OA\Schema(type: 'integer', example: 12))]
	#[OA\Parameter(name: 'client', in: 'query', required: false, description: 'Part of the client name', schema: new OA\Schema(type: 'string', example: 'eva'))]
	#[OA\Parameter(name: 'date_from', in: 'query', required: false, description: 'Appointment date from', schema: new OA\Schema(type: 'string', format: 'date'))]
	#[OA\Parameter(name: 'date_to', in: 'query', required: false, description: 'Appointment date to', schema: new OA\Schema(type: 'string', format: 'date'))]
	#[OA\Parameter(name: 'created_from', in: 'query', required: false, schema: new OA\Schema(type: 'string', format: 'date'))]
	#[OA\Parameter(name: 'created_to', in: 'query', required: false, schema: new OA\Schema(type: 'string', format: 'date'))]
	#[OA\Parameter(name: 'updated_by', in: 'query', required: false, description: 'User id of the last change, or "system"', schema: new OA\Schema(type: 'string', example: 'system'))]
	#[OA\Response(
		response: 200,
		description: 'Paginated list of appointments',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentCollection')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	public function index(Request $request): AppointmentCollection
	{
		$this->authorize('staffView', Appointment::class);

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
			->when($request->id, fn($q) => $q->where('id', (int) $request->id))
			->when($request->client, fn($q) => $q->whereHas(
				'client',
				fn($c) => $c->whereRaw('LOWER(name) LIKE ?', ['%' . mb_strtolower($request->client) . '%'])
			))
			->when($request->date_from, fn($q) => $q->whereDate('starts_at', '>=', $request->date_from))
			->when($request->date_to, fn($q) => $q->whereDate('starts_at', '<=', $request->date_to))
			->when($request->created_from, fn($q) => $q->whereDate('created_at', '>=', $request->created_from))
			->when($request->created_to, fn($q) => $q->whereDate('created_at', '<=', $request->created_to))
			->when($request->updated_by === 'system', fn($q) => $q->whereNull('changed_by'))
			->when($request->updated_by && $request->updated_by !== 'system', fn($q) => $q->where('changed_by', (int) $request->updated_by))
			->orderBy('starts_at', 'desc')
			->paginate(20);

		return new AppointmentCollection($appointments);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/decline',
		operationId: 'appointmentDecline',
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
		$this->authorize('manage', $appointment);

		$appointment->ensureCanBeDeclined();

		$appointment->changeStatus(AppointmentStatus::Declined, $request->reason);

        $appointment->client->notify(
            new AppointmentDeclinedNotification($appointment)
        );

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/confirm',
		operationId: 'appointmentConfirm',
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
	public function confirm(Appointment $appointment): AppointmentResource
	{
		$this->authorize('manage', $appointment);

		$appointment->ensureCanBeConfirmed();

		$appointment->changeStatus(AppointmentStatus::Confirmed);

        $appointment->client->notify(
            new AppointmentConfirmedNotification($appointment)
        );

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/start',
		operationId: 'appointmentStart',
		description: 'Used by staff to start the appointment and mark it as in_progress.',
		summary: 'Mark appointment as in progress',
		security: [['sanctum' => []]],
		tags: ['Staff Appointments']
	)]
	#[OA\Parameter(
		name: 'appointment',
		in: 'path',
		required: true,
		schema: new OA\Schema(type: 'integer', example: 12)
	)]
	#[OA\Response(
		response: 200,
		description: 'Appointment started',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]

	public function start(Appointment $appointment)
	{
		$this->authorize('manage', $appointment);

		$appointment->ensureCanBeStarted();

		$appointment->changeStatus(AppointmentStatus::InProgress);

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/complete',
		operationId: 'appointmentComplete',
		summary: 'Complete an appointment',
		security: [['sanctum' => []]],
		tags: ['Appointments']
	)]
	#[OA\Parameter(name: 'appointment', in: 'path', required: true, schema: new OA\Schema(type: 'integer', example: 1))]
	#[OA\Response(
		response: 200,
		description: 'Appointment completed',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]
	#[OA\Response(response: 422, description: 'Cannot complete appointment in current status')]
	public function complete(Appointment $appointment): AppointmentResource
	{
		$this->authorize('manage', $appointment);

		$appointment->ensureCanBeCompleted();

		$appointment->changeStatus(AppointmentStatus::Completed);

		return new AppointmentResource($appointment);
	}

	#[OA\Patch(
		path: '/api/staff/appointments/{appointment}/no-show',
		operationId: 'appointmentNoShow',
		summary: 'Mark appointment as no-show',
		security: [['sanctum' => []]],
		tags: ['Appointments']
	)]
	#[OA\Parameter(name: 'appointment', in: 'path', required: true, schema: new OA\Schema(type: 'integer', example: 1))]
	#[OA\Response(
		response: 200,
		description: 'Appointment marked as no-show',
		content: new OA\JsonContent(ref: '#/components/schemas/AppointmentResource')
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Appointment not found')]
	#[OA\Response(response: 422, description: 'Cannot mark as no-show in current status')]
	public function markNoShow(Appointment $appointment): AppointmentResource
	{
		$this->authorize('manage', $appointment);

		$appointment->ensureCanBeNoShow();

		$appointment->changeStatus(AppointmentStatus::NoShow);

		return new AppointmentResource($appointment);
	}
}
