<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;

class UserController extends Controller
{
	public function toggleActive(User $user)
	{
		$this->authorize('toggleActive', $user);

		$user->update([
			'is_active' => ! $user->is_active,
		]);

		return response()->json([
			'message' => $user->is_active ? 'User is active.' : 'User is blocked.',
		]);
	}
}
