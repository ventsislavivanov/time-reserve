<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class RegisterClientRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
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
			'email' => 'required|email|unique:users',
			'password' => 'required|min:6',
			'phone' => 'required|string|min:6|max:14',
			'birth_date' => 'required|date',
			'gender' => 'required|in:male,female,other',
        ];
    }
}
