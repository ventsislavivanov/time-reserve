<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\AvailabilitySlotsRequest;
use App\Http\Resources\Availability\TimeSlotCollection;
use App\Services\AvailabilityService;

class AvailabilityController extends Controller
{
	public function __construct(
		protected AvailabilityService $availabilityService
	) {}

	/**
	 * Returns free hours for worker/service/date
	 */
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