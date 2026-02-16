<?php

namespace App\Http\Resources\Availability;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class TimeSlotCollection extends ResourceCollection
{
	public $collects = TimeSlotResource::class;

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
