<?php

namespace App\Http\Resources\Appointment;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'AppointmentHistoryResource',
	properties: [
		new OA\Property(property: 'id', type: 'integer', example: 12),
		new OA\Property(property: 'old_status', type: 'string', example: 'pending', nullable: true),
		new OA\Property(property: 'new_status', type: 'string', example: 'confirmed'),
		new OA\Property(property: 'reason', type: 'string', example: 'Client confirmed', nullable: true),
		new OA\Property(
			property: 'changed_by',
			properties: [
				new OA\Property(property: 'id', type: 'integer', example: 5),
				new OA\Property(property: 'name', type: 'string', example: 'John Doe'),
				new OA\Property(property: 'type', type: 'string', enum: ['user', 'system'], example: 'user'),
			],
			type: 'object',
			nullable: true
		),
		new OA\Property(property: 'created_at', type: 'string', format: 'date-time', example: '2026-03-20 10:00:00'),
	],
	type: 'object'
)]
class AppointmentHistoryResource extends JsonResource
{
	public function toArray(Request $request): array
	{
		return [
			'id'         => $this->id,
			'old_status' => $this->old_status,
			'new_status' => $this->new_status,
			'reason'     => $this->reason,

			'changed_by' => $this->when($this->user, [
				'id'   => $this->user?->id,
				'name' => $this->user?->name,
				'type' => $this->changed_by ? 'user' : 'system',
			]),

			'created_at' => $this->created_at?->format('Y-m-d H:i:s'),
		];
	}
}
