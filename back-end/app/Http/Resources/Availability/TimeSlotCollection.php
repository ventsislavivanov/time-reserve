<?php

namespace App\Http\Resources\Availability;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;

class TimeSlotCollection extends ResourceCollection
{
	public $collects = TimeSlotResource::class;

	#[OA\Schema(
		schema: 'TimeSlotCollection',
		properties: [
			new OA\Property(property: 'date', type: 'string', format: 'date', example: '2026-03-15'),
			new OA\Property(property: 'worker_id', type: 'integer', example: 1),
			new OA\Property(property: 'service_id', type: 'integer', example: 5),
			new OA\Property(
				property: 'slots',
				type: 'array',
				items: new OA\Items(ref: '#/components/schemas/TimeSlot')
			),
		]
	)]
	public function toArray(Request $request): array
    {
		return [
			'date' => $request->date,
			'worker_id' => $request->worker_id,
			'service_id' => $request->service_id,
			'slots' => $this->collection,
		];
    }
}
