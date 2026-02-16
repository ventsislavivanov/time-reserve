<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RejectAppointmentRequest extends FormRequest
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
