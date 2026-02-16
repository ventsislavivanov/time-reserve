<?php

namespace App\Http\Resources\Availability;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TimeSlotResource extends JsonResource
{
	public function toArray(Request $request): array
	{
		return [
			'start' => $this['start']->toIso8601String(),
			'end' => $this['end']->toIso8601String(),
			'time' => $this['formatted'], // "10:00"
		];
	}
}