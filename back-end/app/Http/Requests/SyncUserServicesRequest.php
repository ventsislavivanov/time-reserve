<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'SyncUserServicesRequest',
	required: ['service_ids'],
	properties: [
		new OA\Property(
			property: 'service_ids',
			type: 'array',
			items: new OA\Items(type: 'integer', example: 1),
			example: [1, 2, 3]
		),
	]
)]
class SyncUserServicesRequest extends FormRequest
{
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    public function rules(): array
    {
        return [
			'service_ids' => 'required|array',
			'service_ids.*' => 'exists:services,id',
        ];
    }
}
