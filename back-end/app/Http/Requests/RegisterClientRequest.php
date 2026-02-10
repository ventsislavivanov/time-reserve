<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'RegisterClientRequest',
	required: ['name', 'email', 'password', 'password_confirmation', 'phone', 'birth_date', 'gender'],
	properties: [
		new OA\Property(property: 'name', type: 'string', maxLength: 255, example: 'John Doe'),
		new OA\Property(property: 'email', type: 'string', format: 'email', example: 'john@example.com'),
		new OA\Property(property: 'password', type: 'string', format: 'password', minLength: 6, example: 'password'),
		new OA\Property(property: 'phone', type: 'string', maxLength: 14, minLength: 6, example: '+359888123456'),
		new OA\Property(property: 'birth_date', type: 'string', format: 'date', example: '1990-01-15'),
		new OA\Property(property: 'gender', type: 'string', enum: ['male', 'female', 'other'], example: 'male'),
	]
)]
class RegisterClientRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
			'name' => 'required|string|max:255',
			'email' => 'required|email|unique:users',
			'password' => 'required|min:6',
			'phone' => 'required|string|min:6|max:14',
			'birth_date' => 'required|date',
			'gender' => 'required|in:male,female,other',
        ];
    }
}
