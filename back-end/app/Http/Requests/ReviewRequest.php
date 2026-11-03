<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'ReviewRequest',
	required: ['rating', 'comment'],
	properties: [
		new OA\Property(property: 'rating', type: 'integer', maximum: 5, minimum: 1, example: 5),
		new OA\Property(property: 'comment', type: 'string', maxLength: 1000, minLength: 3, example: 'Great service!'),
	]
)]
class ReviewRequest extends FormRequest
{
	public function authorize(): bool
	{
		return auth()->check();
	}

	public function rules(): array
	{
		return [
			'rating' => 'required|integer|between:1,5',
			'comment' => 'required|string|min:3|max:1000',
		];
	}
}
