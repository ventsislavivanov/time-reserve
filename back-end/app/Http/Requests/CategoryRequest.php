<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'CategoryRequest',
	required: ['name'],
	properties: [
		new OA\Property(property: 'name', type: 'string', maxLength: 255, example: 'Haircut'),
	]
)]
class CategoryRequest extends FormRequest
{
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    public function rules(): array
    {
        return [
			'name' => 'required|string|max:255',
        ];
    }
}
