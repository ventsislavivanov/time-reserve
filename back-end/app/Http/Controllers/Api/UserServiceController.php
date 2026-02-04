<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\SyncUserServicesRequest;
use App\Models\User;

class UserServiceController extends Controller
{
	public function index(User $user)
	{
		return response()->json($user->services);
	}

	public function syncServices(SyncUserServicesRequest $request, User $user)
	{
		$this->authorize('syncServices', $user);

		$user->services()->sync($request->service_ids);

		return response()->json($user->fresh()->services);
	}
}
