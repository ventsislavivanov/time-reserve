<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\AvailabilityService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class AvailabilityController extends Controller
{
	public function __construct(
		protected AvailabilityService $availabilityService
	) {}

	/**
	 * Returns free hours for worker/service/date
	 */
	public function getSlots(Request $request): JsonResponse
	{
		$request->validate([
			'worker_id' => 'required|exists:users,id',
			'service_id' => 'required|exists:services,id',
			'date' => 'required|date|after_or_equal:today',
		]);

		$slots = $this->availabilityService->getAvailableSlots(
			$request->worker_id,
			$request->service_id,
			$request->date
		);

		return response()->json($slots);
	}
}