<?php

namespace App\Http\Resources\Worker;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;


#[OA\Schema(
    schema: 'WorkerCollection',
    properties: [
        new OA\Property(
            property: 'data',
            type: 'array',
            items: new OA\Items(ref: '#/components/schemas/WorkerResource')
        )
    ],
    type: 'object'
)]
class WorkerCollection extends ResourceCollection
{
	public $collects = WorkerResource::class;

    public function toArray(Request $request): array
    {
		return [
			'data' => $this->collection,
		];
    }
}
