<?php

namespace App\Http\Resources\Worker;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;

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
