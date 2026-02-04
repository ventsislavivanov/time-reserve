<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateUserRoleRequest;
use App\Http\Resources\User\UserResource;
use App\Models\User;

class UserManagementController extends Controller
{
	public function toggleActive(User $user)
	{
		$this->authorize('toggleActive', $user);

		$user->update([
			'is_active' => ! $user->is_active,
		]);

		return new UserResource($user);
	}

	public function updateRole(UpdateUserRoleRequest $request, User $user)
	{
		$this->authorize('updateRole', $user);

		$user->update([
			'role' => $request->role,
		]);

		return new UserResource($user);
	}
}
