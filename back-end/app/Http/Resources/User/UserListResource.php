<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

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
