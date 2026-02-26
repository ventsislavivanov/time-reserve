<?php

namespace App\Http\Resources\Availability;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

class TimeSlotResource extends JsonResource
{
	#[OA\Schema(
		schema: 'TimeSlot',
		properties: [
			new OA\Property(property: 'start', type: 'string', format: 'date-time', example: '2026-03-15T09:00:00+00:00'),
			new OA\Property(property: 'end', type: 'string', format: 'date-time', example: '2026-03-15T09:30:00+00:00'),
			new OA\Property(property: 'time', type: 'string', example: '09:00'),
		]
	)]
	public function toArray(Request $request): array
	{
		return [
			'start' => $this['start']->toIso8601String(),
			'end' => $this['end']->toIso8601String(),
			'time' => $this['formatted'], // "10:00"
		];
	}
}