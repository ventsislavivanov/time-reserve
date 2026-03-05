<?php

namespace App\Http\Resources\Appointment;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;


#[OA\Schema(
	schema: 'AppointmentCollection',
	properties: [
		new OA\Property(
			property: 'data',
			type: 'array',
			items: new OA\Items(ref: '#/components/schemas/AppointmentResource')
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
)]class AppointmentCollection extends ResourceCollection
{

	public $collects = AppointmentResource::class;

    public function toArray(Request $request): array
    {
		return [
			'data' => $this->collection,
		];
    }
}
