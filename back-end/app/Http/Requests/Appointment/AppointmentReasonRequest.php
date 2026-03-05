<?php

namespace App\Http\Requests\Appointment;

use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'AppointmentReasonRequest',
	properties: [
		new OA\Property(
			property: 'reason',
			type: 'string',
			maxLength: 500,
			example: 'Cannot make it anymore',
			nullable: true
		),
	]
)]
class AppointmentReasonRequest extends FormRequest
{
	public function authorize(): bool
	{
		return auth()->user()?->isAdmin() || auth()->user()?->isWorker() ?? false;
	}

	public function rules(): array
    {
        return [
			'reason' => 'nullable|string|max:500',
        ];
    }
}
