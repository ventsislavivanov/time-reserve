<?php

namespace App\Http\Requests\Appointment;

use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'AppointmentStoreRequest',
	required: ['service_id', 'worker_id', 'starts_at'],
	properties: [
		new OA\Property(property: 'service_id', type: 'integer', example: 3),
		new OA\Property(property: 'worker_id', type: 'integer', example: 2),
//		new OA\Property(property: 'starts_at', type: 'string', format: 'date-time', example: '2026-03-20T10:00:00'),
		new OA\Property(property: 'notes', type: 'string', maxLength: 1000, example: 'Please use organic products', nullable: true),
	]
)]
class AppointmentStoreRequest extends FormRequest
{
	public function authorize(): bool
	{
		return auth()->check();
	}

	public function rules(): array
	{
		return [
			'service_id' => 'required|exists:services,id',
			'worker_id' => 'required|exists:users,id',
//			'starts_at' => 'required|date|after:now',
			'notes' => 'nullable|string|max:1000',
		];
	}
}