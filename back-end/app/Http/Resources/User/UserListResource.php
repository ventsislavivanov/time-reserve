<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'UserListResource',
	allOf: [
		new OA\Schema(
			properties: [
				new OA\Property(property: 'id', type: 'integer', example: 1),
				new OA\Property(property: 'name', type: 'string', example: 'John Doe'),
				new OA\Property(property: 'email', type: 'string', format: 'email', example: 'john@example.com'),
				new OA\Property(property: 'phone', type: 'string', example: '+359888123456'),
				new OA\Property(property: 'gender', type: 'string', enum: ['male', 'female', 'other'], example: 'male'),
				new OA\Property(property: 'birth_date', type: 'string', format: 'date', example: '1990-01-15'),
				new OA\Property(property: 'role', type: 'string', enum: ['admin', 'worker', 'client'], example: 'worker'),
				new OA\Property(property: 'is_active', type: 'boolean', example: true),
				new OA\Property(property: 'is_approved', type: 'boolean', example: true),
				new OA\Property(property: 'email_verified', type: 'boolean', example: true),
				new OA\Property(property: 'job_pos	ition_id', type: 'integer', example: 1, nullable: true),
			]
		),
		new OA\Schema(ref: '#/components/schemas/Timestamps'),
	]
)]
class UserListResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
		return [
			'id'           => $this->id,
			'name'         => $this->name,
			'email'        => $this->email,
			'phone'        => $this->phone,
			'birth_date'   => $this->birth_date,
			'role'         => $this->role,
			'gender'       => $this->gender,
			'status'       => $this->status,
			'is_active'    => $this->is_active,
			'is_approved'  => $this->is_approved,
			'verified'     => $this->isVerified,
			'job_position_id' => $this->job_position_id,
			'job_position'    => $this->whenLoaded('jobPosition'),
			'created_at'   => $this->created_at?->format('Y-m-d'),
			'updated_at'   => $this->updated_at?->format('Y-m-d'),
		];
    }
}
