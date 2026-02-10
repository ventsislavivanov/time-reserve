<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'UpdateUserRoleRequest',
	required: ['role'],
	properties: [
		new OA\Property(property: 'role', type: 'string', enum: ['admin', 'worker', 'client'], example: 'worker'),
	]
)]
class UpdateUserRoleRequest extends FormRequest
{
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    public function rules(): array
    {
        return [
			'role' => 'required|in:admin,worker,client',
        ];
    }
}
