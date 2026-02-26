<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\AvailabilitySlotsRequest;
use App\Http\Resources\Availability\TimeSlotCollection;
use App\Services\AvailabilityService;
use OpenApi\Attributes as OA;

class AvailabilityController extends Controller
{
	public function __construct(
		protected AvailabilityService $availabilityService
	) {}

	#[OA\Get(
		path: '/api/slots',
		operationId: 'getSlots',
		description: 'Returns free time slots for a given worker, service and date.',
		summary: 'Get available time slots',
		tags: ['Availability']
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/AvailabilitySlotsRequest')
	)]
	#[OA\Response(
		response: 200,
		description: 'Available time slots',
		content: new OA\JsonContent(ref: '#/components/schemas/TimeSlotCollection')
	)]
	#[OA\Response(
		response: 422,
		description: 'Validation error',
		content: new OA\JsonContent(
			properties: [
				new OA\Property(property: 'message', type: 'string', example: 'The given data was invalid.'),
				new OA\Property(
					property: 'errors',
					type: 'object',
					example: [
						'worker_id'  => ['The selected worker id is invalid.'],
						'service_id' => ['The selected service id is invalid.'],
						'date'       => ['You can only book up to 6 months in advance'],
					]
				),
			]
		)
	)]
	public function getSlots(AvailabilitySlotsRequest $request): TimeSlotCollection
	{
		$slots = $this->availabilityService->getAvailableSlots(
			$request->worker_id,
			$request->service_id,
			$request->date
		);

		return new TimeSlotCollection($slots);
	}
}