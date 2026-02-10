<?php

namespace App\Http\Resources\Service;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'ServiceCollection',
	properties: [
		new OA\Property(
			property: 'data',
			type: 'array',
			items: new OA\Items(ref: '#/components/schemas/ServiceResource')
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
class ServiceCollection extends ResourceCollection
{
	public $collects = ServiceResource::class;

    public function toArray(Request $request): array
    {
		return [
			'data' => $this->collection,
		];
    }
}
