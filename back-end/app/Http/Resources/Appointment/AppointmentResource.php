<?php

namespace App\Http\Resources\Appointment;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

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
			'cancel_reason' => $this->cancel_reason,
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
			'created_at' => $this->created_at?->format('Y-m-d'),
		];
	}
}