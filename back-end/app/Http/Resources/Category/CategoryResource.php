<?php

namespace App\Http\Resources\Category;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'CategoryResource',
	allOf: [
		new OA\Schema(
			properties: [
				new OA\Property(property: 'id', type: 'integer', example: 1),
				new OA\Property(property: 'name', type: 'string', example: 'Haircut'),
				new OA\Property(property: 'description', type: 'string', example: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
			]
		),
		new OA\Schema(ref: '#/components/schemas/Timestamps'),
	]
)]
class CategoryResource extends JsonResource
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
