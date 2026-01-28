<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateUserRequest;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterClientRequest;
use App\Http\Requests\SyncUserServicesRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Models\User;
use App\Services\AuthService;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\Request;

class AuthController extends Controller
{

	public function __construct(
		// auto-resolve
		protected AuthService $authService
	) {}

	public function registerClient(RegisterClientRequest  $request)
	{
		$user = User::create([
			...$request->validated(),
			'is_approved' => false,
		]);

		$user->sendEmailVerificationNotification();

		return response()->json([
			'message' => 'Please check your email for a confirmation link.'
		]);
	}

	public function createUser(CreateUserRequest $request)
	{
		$this->authorize('create', User::class);

		$user = User::create([
			...$request->validated(),
			'email_verified_at' => now(),
			'is_approved' 		=> true,
		]);

		return response()->json([
			'message' => 'User created successfully',
			'user'    => $user
		], 201);
	}

	public function updateUser(UpdateUserRequest $request, User $user)
	{
		$this->authorize('update', $user);

		$data = $request->validated();

		if (empty($data['password'])) {
			unset($data['password']);
		}

		$user->update($data);

		return response()->json([
			'message' => 'User updated successfully',
			'user'    => $user
		]);
	}

	public function login(LoginRequest $request)
	{
		$result = $this->authService->login(
			email: $request->email,
			password: $request->password,
			guard: $request->guard,
			remember: $request->remember ?? false
		);

		return response()->json([
			'token' => $result['token'],
			'user' => [
				'id'    => $result['user']->id,
				'name'  => $result['user']->name,
				'email' => $result['user']->email,
				'role'  => $result['user']->role,
			]
		]);
	}

	public function logout(Request $request)
	{
		$request->user()->currentAccessToken()->delete();
		return response()->json(['message' => 'Logged out']);
	}

	public function verifyEmail(Request $request, $id, $hash)
	{
		$user = User::findOrFail($id);

		if (! hash_equals((string) $hash, sha1($user->getEmailForVerification()))) {
			return response()->json(['message' => 'Невалиден линк за верификация.'], 403);
		}

		if ($user->hasVerifiedEmail()) {
			return redirect('http://localhost:5173/login?verified=1');
		}

		if ($user->markEmailAsVerified()) {
			event(new Verified($user));
		}

		return redirect('http://localhost:5173/login?verified=1&email=' . urlencode($user->email));
	}

	public function getAllUsers(Request $request) {
		$this->authorize('viewAny', User::class);

		$users = User::query()
			->role($request->query('role'))
			->gender($request->query('gender'))
			->search($request->query('search'))
			->paginate($request->query('limit', 10));

		return response()->json($users);
	}

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

	public function getUserServices(User $user)
	{
		return response()->json($user->services);
	}

	public function syncUserServices(SyncUserServicesRequest $request, User $user)
	{
		$user->services()->sync($request->service_ids);

		return response()->json(['message' => 'Services synced successfully']);
	}

}