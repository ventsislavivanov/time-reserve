<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Resources\User\UserListResource;
use App\Http\Resources\User\UserResource;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
	public function index(Request $request)
	{
		$this->authorize('viewAny', User::class);

		$users = User::query()
			->role($request->query('role'))
			->gender($request->query('gender'))
			->search($request->query('search'))
			->paginate($request->query('limit', 10));

		return UserListResource::collection($users);
	}

	public function store(CreateUserRequest $request)
	{
		$this->authorize('create', User::class);

		$user = User::create([
			...$request->validated(),
			'email_verified_at' => now(),
			'is_approved' 		=> true,
		]);

		return new UserResource($user);
	}

	public function update(UpdateUserRequest $request, User $user)
	{
		$this->authorize('update', $user);

		$data = array_filter(
			$request->validated(),
			fn ($v) => !is_null($v)
		);

		$user->update($data);

		return new UserResource($user);
	}
}
