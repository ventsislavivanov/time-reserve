<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AvailabilitySlotsRequest extends FormRequest
{
	public function authorize(): bool
	{
		return true;
	}

	public function rules(): array
	{
		return [
			'worker_id' => 'required|exists:users,id',
			'service_id' => 'required|exists:services,id',
			'date' => 'required|date|after_or_equal:today|before:+6 months', //Max 6 mounths ahead
		];
	}

	public function messages(): array
	{
		return [
			'date.before' => 'You can only book up to 6 months in advance',
		];
	}
}