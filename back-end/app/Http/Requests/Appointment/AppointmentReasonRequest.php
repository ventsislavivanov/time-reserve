<?php

namespace App\Http\Requests\Appointment;

use App\AppointmentStatus;
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
		return auth()->user()?->isAdmin()
			|| auth()->user()?->isWorker()
			|| auth()->user()?->isClient()
			?? false;
	}

	public function rules(): array
    {
		$appointment = $this->route('appointment');

        return [
			'reason' => $appointment->status === AppointmentStatus::Confirmed
				? ['required', 'string', 'max:500']
				: ['nullable', 'string', 'max:500']
        ];
    }
}
