<?php

namespace App\Http\Resources\Category;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'CategoryCollection',
	properties: [
		new OA\Property(
			property: 'data',
			type: 'array',
			items: new OA\Items(ref: '#/components/schemas/CategoryResource')
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
class CategoryCollection extends ResourceCollection
{
	public $collects = CategoryResource::class;

    public function toArray(Request $request): array
    {
		return [
			'data' => $this->collection,
		];
    }
}
