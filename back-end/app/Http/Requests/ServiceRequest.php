<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class ServiceRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
		return auth()->user()?->isAdmin() ?? false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array|string>
     */
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
