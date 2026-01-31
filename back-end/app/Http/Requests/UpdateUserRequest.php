<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    /**
     * Get the validations rules that apply to the request.
     *
     * @return array<string, ValidationRule|array|string>
     */
    public function rules(): array
    {
		$userId = $this->route('user')->id;

		return [
			'name'  => 'required|string|max:255',
			'email' => 'required|email|unique:users,email,' . $userId,
			'phone' => 'required|string',
			'birth_date' => 'required|date',
			'gender' => 'required|in:male,female,other',
			'role' => 'required|in:admin,worker,client',
			'password' => 'nullable|min:6',
			'job_position_id' => 'nullable|exists:job_positions,id',
		];
    }
}
