<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateAppointmentRequest extends FormRequest
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
			'starts_at' => 'required|date|after:now',
			'notes' => 'nullable|string|max:1000',
		];
	}
}