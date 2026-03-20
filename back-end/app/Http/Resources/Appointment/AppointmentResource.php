<?php

namespace App\Http\Resources\Appointment;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'AppointmentResource',
	allOf: [
		new OA\Schema(
			properties: [
				new OA\Property(property: 'id', type: 'integer', example: 1),
				new OA\Property(property: 'date', type: 'string', format: 'date', example: '2026-03-20'),
				new OA\Property(property: 'time', type: 'string', example: '10:00 - 10:30'),
				new OA\Property(
					property: 'status',
					type: 'string',
					enum: ['pending', 'cancelled', 'declined', 'confirmed', 'in_progress', 'completed', 'no_show', 'expired'],
					example: 'pending'
				),
				new OA\Property(property: 'notes', type: 'string', example: 'Please use organic products', nullable: true),
				new OA\Property(property: 'reason', type: 'string', example: 'Cannot make it anymore', nullable: true),
				new OA\Property(
					property: 'service',
					properties: [
						new OA\Property(property: 'id', type: 'integer', example: 3),
						new OA\Property(property: 'name', type: 'string', example: 'Haircut'),
						new OA\Property(property: 'duration', type: 'integer', example: 30),
						new OA\Property(property: 'price', type: 'number', format: 'float', example: 25.00),
					],
					type: 'object'
				),
				new OA\Property(
					property: 'worker',
					properties: [
						new OA\Property(property: 'id', type: 'integer', example: 2),
						new OA\Property(property: 'name', type: 'string', example: 'Jane Smith'),
					],
					type: 'object'
				),
				new OA\Property(
					property: 'client',
					properties: [
						new OA\Property(property: 'id', type: 'integer', example: 5),
						new OA\Property(property: 'name', type: 'string', example: 'John Doe'),
					],
					type: 'object',
					nullable: true
				),
				new OA\Property(
					property: 'changed_by',
					properties: [
						new OA\Property(property: 'id', type: 'integer', example: 2),
						new OA\Property(property: 'name', type: 'string', example: 'Jane Smith'),
						new OA\Property(property: 'type', type: 'string', enum: ['user', 'system'], example: 'user'),
					],
					type: 'object',
					nullable: true
				),
			]
		),
		new OA\Schema(ref: '#/components/schemas/Timestamps'),
	]
)]
class AppointmentResource extends JsonResource
{
	public function toArray(Request $request): array
	{
		return [
			'id' => $this->id,
			'date' => $this->starts_at->format('Y-m-d'),
			'time' => $this->starts_at->format('H:i') . ' - ' . $this->ends_at->format('H:i'),
			'status' => $this->status,
			'notes' => $this->notes,
			'reason' => $this->reason,
			'service' => [
				'id' => $this->service->id,
				'name' => $this->service->name,
				'duration' => $this->service->duration,
				'price' => $this->service->price,
			],
			'worker' => [
				'id' => $this->worker->id,
				'name' => $this->worker->name,
			],
			'client' => $this->when($this->client, [
				'id' => $this->client?->id,
				'name' => $this->client?->name,
			]),
			'changed_by' => $this->when($this->changed_by, [
				'id' => $this->changedBy?->id,
				'name' => $this->changedBy?->name,
				'type' => $this->changed_by ? 'user' : 'system'
			]),
			'created_at' => $this->created_at?->format('Y-m-d H:i:s'),
			'updated_at' => $this->updated_at?->format('Y-m-d H:i:s'),
		];
	}
}