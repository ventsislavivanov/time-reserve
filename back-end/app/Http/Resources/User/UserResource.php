<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
		return [
			'id'              => $this->id,
			'name'            => $this->name,
			'email'           => $this->email,
			'phone'           => $this->phone,
			'gender'          => $this->gender,
			'birth_date'      => $this->birth_date?->toDateString(),
			'role'            => $this->role,
			'is_active'       => $this->is_active,
			'is_approved'     => $this->is_approved,
			'email_verified'  => $this->email_verified_at !== null,
			'job_position_id' => $this->job_position_id,
//			'services'        => ServiceResource::collection(
//				$this->whenLoaded('services')
//			),
		];
    }
}
