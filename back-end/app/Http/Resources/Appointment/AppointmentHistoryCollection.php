<?php

namespace App\Http\Resources\Appointment;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'AppointmentHistoryCollection',
	properties: [
		new OA\Property(
			property: 'data',
			type: 'array',
			items: new OA\Items(ref: '#/components/schemas/AppointmentHistoryResource')
		)
	],
	type: 'object'
)]
class AppointmentHistoryCollection extends ResourceCollection
{
	public $collects = AppointmentHistoryResource::class;

	public function toArray(Request $request): array
	{
		return [
			'data' => $this->collection,
		];
	}
}
