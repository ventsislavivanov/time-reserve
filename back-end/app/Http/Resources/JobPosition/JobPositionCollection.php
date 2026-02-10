<?php

namespace App\Http\Resources\JobPosition;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'JobPositionCollection',
	properties: [
		new OA\Property(
			property: 'data',
			type: 'array',
			items: new OA\Items(ref: '#/components/schemas/JobPositionResource')
		),
		new OA\Property(
			property: 'links',
			ref: '#/components/schemas/PaginationLinks'
		),
		new OA\Property(
			property: 'meta',
			ref: '#/components/schemas/PaginationMeta'
		),
	],
	type: 'object'
)]
class JobPositionCollection extends ResourceCollection
{
    public $collects = JobPositionResource::class;

    public function toArray(Request $request): array
    {
		return [
			'data' => $this->collection,
		];
    }
}
