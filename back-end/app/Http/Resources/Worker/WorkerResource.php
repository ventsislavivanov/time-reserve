<?php

namespace App\Http\Resources\Worker;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

#[OA\Schema(
    schema: 'WorkerResource',
    properties: [
        new OA\Property(property: 'id', type: 'integer', example: 1),
        new OA\Property(property: 'name', type: 'string', example: 'Jane Doe'),
        new OA\Property(property: 'job_position_id', type: 'integer', example: 2),
        new OA\Property(
            property: 'job_position',
            properties: [
                new OA\Property(property: 'id', type: 'integer', example: 2),
                new OA\Property(property: 'name', type: 'string', example: 'Senior Stylist')
            ],
            type: 'object'
        ),
        new OA\Property(
            property: 'services',
            type: 'array',
            items: new OA\Items(ref: '#/components/schemas/ServiceResource')
        ),
    ]
)]

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
