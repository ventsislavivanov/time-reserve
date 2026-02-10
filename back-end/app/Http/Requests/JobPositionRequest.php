<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'JobPositionRequest',
	required: ['name'],
	properties: [
		new OA\Property(property: 'name', type: 'string', maxLength: 255, example: 'Hair Stylist'),
		new OA\Property(property: 'description', type: 'string', example: 'Responsible for hair styling and cutting', nullable: true),
	]
)]
class JobPositionRequest extends FormRequest
{
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    public function rules(): array
    {
        return [
			'name' => 'required|string|max:255',
			'description' => 'nullable|string',
        ];
    }
}
