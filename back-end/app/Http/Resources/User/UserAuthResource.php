<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'UserAuth',
	properties: [
		new OA\Property(property: 'id', type: 'integer', example: 1),
		new OA\Property(property: 'name', type: 'string', example: 'John Doe'),
		new OA\Property(property: 'email', type: 'string', example: 'john@example.com'),
		new OA\Property(property: 'role', type: 'string', example: 'admin'),
		new OA\Property(property: 'status', type: 'string', example: 'active'),
	],
	type: 'object'
)]
class UserAuthResource extends JsonResource
{
    public function toArray(Request $request): array
    {
		return [
			'id' => $this->id,
			'name' => $this->name,
			'email' => $this->email,
			'role' => $this->role,
			'status' => $this->status,
		];
    }
}
