<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class CreateUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
			'name'       => 'required|string|max:255',
			'email'      => 'required|email|unique:users',
			'password'   => 'required|min:6',
			'phone'      => 'required|string',
			'birth_date' => 'required|date',
			'gender'     => 'required|in:male,female',
			'role'       => 'required|in:admin,worker',
			'job_position_id' => 'nullable|exists:job_positions,id',
        ];
    }
}
