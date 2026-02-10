<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'CreateUserRequest',
	required: ['name', 'email', 'password', 'phone', 'birth_date', 'gender', 'role'],
	properties: [
		new OA\Property(property: 'name', type: 'string', maxLength: 255, example: 'John Doe'),
		new OA\Property(property: 'email', type: 'string', format: 'email', example: 'john@example.com'),
		new OA\Property(property: 'password', type: 'string', format: 'password', minLength: 6, example: 'password'),
		new OA\Property(property: 'phone', type: 'string', example: '+359888123456'),
		new OA\Property(property: 'birth_date', type: 'string', format: 'date', example: '1990-01-15'),
		new OA\Property(property: 'gender', type: 'string', enum: ['male', 'female'], example: 'male'),
		new OA\Property(property: 'role', type: 'string', enum: ['admin', 'worker', 'client'], example: 'worker'),
		new OA\Property(property: 'job_position_id', type: 'integer', example: 1, nullable: true),
	]
)]
class CreateUserRequest extends FormRequest
{
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    public function rules(): array
    {
        return [
			'name'       => 'required|string|max:255',
			'email'      => 'required|email|unique:users',
			'password'   => 'required|min:6',
			'phone'      => 'required|string',
			'birth_date' => 'required|date',
			'gender'     => 'required|in:male,female',
			'role'       => 'required|in:admin,worker,client',
			'job_position_id' => 'nullable|exists:job_positions,id',
        ];
    }
}
