<?php

namespace App\Http\Resources\Service;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'ServiceResource',
	allOf: [
		new OA\Schema(
			properties: [
				new OA\Property(property: 'id', type: 'integer', example: 1),
				new OA\Property(property: 'name', type: 'string', example: 'Haircut'),
				new OA\Property(property: 'description', type: 'string', example: 'Basic haircut service', nullable: true),
				new OA\Property(property: 'category_id', type: 'integer', example: 1),
				new OA\Property(property: 'duration', type: 'integer', example: 30),
				new OA\Property(property: 'price', type: 'number', format: 'float', example: 25.00),
				new OA\Property(property: 'is_active', type: 'boolean', example: true),
				new OA\Property(property: 'preparation_time', type: 'integer', example: 5),
				new OA\Property(property: 'cleanup_time', type: 'integer', example: 5),
			]
		),
		new OA\Schema(ref: '#/components/schemas/Timestamps'),
	]
)]
class ServiceResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
			'id'              => $this->id,
			'name'            => $this->name,
			'description'     => $this->description,
			'created_at'      => $this->created_at?->format('Y-m-d H:i:s'),
			'updated_at'      => $this->updated_at?->format('Y-m-d H:i:s'),
		];
    }
}
