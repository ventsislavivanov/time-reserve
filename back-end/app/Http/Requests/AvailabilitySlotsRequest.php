<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

class AvailabilitySlotsRequest extends FormRequest
{
	public function authorize(): bool
	{
		return true;
	}


	#[OA\Schema(
		schema: 'AvailabilitySlotsRequest',
		required: ['worker_id', 'service_id', 'date'],
		properties: [
			new OA\Property(property: 'worker_id', description: 'Must exist in users table', type: 'integer', example: 1),
			new OA\Property(property: 'service_id', description: 'Must exist in services table', type: 'integer', example: 5),
			new OA\Property(
				property: 'date',
				description: 'Must be today or later, max 6 months ahead',
				type: 'string',
				format: 'date',
				example: '2026-03-15'
			),
		]
	)]
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