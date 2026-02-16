<?php

namespace App\Http\Resources\Worker;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class WorkerResource extends JsonResource
{
    public function toArray(Request $request): array
    {
		return [
			'id' => $this->id,
			'name' => $this->name,
			'job_position' => [
				'id' => $this->jobPosition?->id,
				'name' => $this->jobPosition?->name,
			],
			'services' => $this->services->map(fn($service) => [
				'id' => $service->id,
				'name' => $service->name,
				'description' => $service->description ?? null,
				'duration' => $service->duration,
				'price' => $service->price,
				'category' => [
					'id' => $service->category->id,
					'name' => $service->category->name,
				],
			]),
		];
    }
}
