<?php

namespace App\Http\Resources\Review;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'ReviewResource',
	properties: [
		new OA\Property(property: 'id', type: 'integer', example: 1),
		new OA\Property(property: 'service_id', type: 'integer', example: 3),
		new OA\Property(property: 'user_id', type: 'integer', example: 7),
		new OA\Property(property: 'author_name', type: 'string', example: 'John Doe'),
		new OA\Property(property: 'rating', type: 'integer', example: 5),
		new OA\Property(property: 'comment', type: 'string', example: 'Great service!'),
		new OA\Property(property: 'created_at', type: 'string', example: '2026-11-03 12:00:00'),
		new OA\Property(property: 'updated_at', type: 'string', example: '2026-11-03 12:00:00'),
	]
)]
class ReviewResource extends JsonResource
{
	public function toArray(Request $request): array
	{
		return [
			'id'          => $this->id,
			'service_id'  => $this->service_id,
			'user_id'     => $this->user_id,
			'author_name' => $this->user?->name,
			'rating'      => $this->rating,
			'comment'     => $this->comment,
			'created_at'  => $this->created_at?->format('Y-m-d H:i:s'),
			'updated_at'  => $this->updated_at?->format('Y-m-d H:i:s'),
		];
	}
}
