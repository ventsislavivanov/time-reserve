<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'ServiceRequest',
	required: ['name', 'category_id', 'duration', 'price', 'preparation_time', 'cleanup_time'],
	properties: [
		new OA\Property(property: 'name', type: 'string', maxLength: 255, example: 'Haircut'),
		new OA\Property(property: 'description', type: 'string', maxLength: 5000, example: 'Basic haircut service', nullable: true),
		new OA\Property(property: 'category_id', type: 'integer', example: 1),
		new OA\Property(property: 'duration', type: 'integer', minimum: 5, example: 30),
		new OA\Property(property: 'price', type: 'number', format: 'float', minimum: 0.01, example: 25.00),
		new OA\Property(property: 'is_active', type: 'boolean', example: true),
		new OA\Property(property: 'preparation_time', type: 'integer', minimum: 0, example: 5),
		new OA\Property(property: 'cleanup_time', type: 'integer', minimum: 0, example: 5),
	]
)]
class ServiceRequest extends FormRequest
{
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    public function rules(): array
    {
        return [
			'name' => 'required|string|max:255',
			'description' => 'nullable|string|max:5000',
			'category_id' => 'required|exists:categories,id',
			'duration' => 'required|integer|min:5',
			'price' => 'required|numeric|min:0.01',
			'is_active' => 'sometimes|boolean',
			'preparation_time' => 'required|integer|min:0',
			'cleanup_time' => 'required|integer|min:0',
        ];
    }
}
