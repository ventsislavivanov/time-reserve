<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'UpdateUserRequest',
	required: ['name', 'email', 'phone', 'birth_date', 'gender'],
	properties: [
		new OA\Property(property: 'name', type: 'string', maxLength: 255, example: 'John Doe'),
		new OA\Property(property: 'email', type: 'string', format: 'email', example: 'john@example.com'),
		new OA\Property(property: 'phone', type: 'string', example: '+359888123456'),
		new OA\Property(property: 'birth_date', type: 'string', format: 'date', example: '1990-01-15'),
		new OA\Property(property: 'gender', type: 'string', enum: ['male', 'female', 'other'], example: 'male'),
		new OA\Property(property: 'password', type: 'string', format: 'password', minLength: 6, example: 'password', nullable: true),
		new OA\Property(property: 'job_position_id', type: 'integer', example: 1, nullable: true),
	]
)]
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
			'password' => 'nullable|min:6',
			'job_position_id' => 'nullable|exists:job_positions,id',
		];
    }
}
