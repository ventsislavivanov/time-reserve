<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\Response;

class UserPolicy
{
    public function viewAny(User $user): bool
    {
		return $user->isAdmin();
    }

	public function create(User $user): bool
	{
		return $user->isAdmin();
	}

	public function update(User $user, User $targetUser): Response
	{
		if (!$user->isAdmin()) {
			return Response::deny('Only admins can change status.');
		}

		if ($user->id === $targetUser->id) {
			return Response::deny('You cannot edit your own user.');
		}

		return Response::allow();
	}

	public function toggleActive(User $user, User $targetUser): Response
	{
		if (!$user->isAdmin()) {
			return Response::deny('Only admins can change status.');
		}

		if ($user->id === $targetUser->id) {
			return Response::deny('You cannot deactivate your own account.');
		}

		return Response::allow();
	}

	public function syncServices(User $user, User $targetUser): bool
	{
		if (!$user->isAdmin()) {
			return false;
		}

		return $targetUser-isWorker();
	}

	public function updateRole(User $user): bool
	{
		return $user->isAdmin();
	}
}
