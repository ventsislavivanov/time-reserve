<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'LoginRequest',
	required: ['email', 'password', 'guard'],
	properties: [
		new OA\Property(property: 'email', type: 'string', example: 'john@doe.com'),
		new OA\Property(property: 'password', type: 'string', example: 'password'),
		new OA\Property(property: 'guard', type: 'string', example: 'staff'),
		new OA\Property(property: 'remember', type: 'boolean', example: 'false'),
	]
)]
class LoginRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
			'email' => 'required|email',
			'password' => 'required',
			'guard' => 'required|in:client,staff',
			'remember' => 'boolean'
        ];
    }
}
