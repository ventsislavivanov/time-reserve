<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'UserCollection',
	properties: [
		new OA\Property(
			property: 'data',
			type: 'array',
			items: new OA\Items(ref: '#/components/schemas/UserResource')
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
class UserCollection extends ResourceCollection
{
	public $collects = UserResource::class;

	public function toArray(Request $request): array
	{
		return [
			'data' => $this->collection,
		];
	}
}