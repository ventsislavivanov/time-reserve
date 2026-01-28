<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateUserRequest;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterClientRequest;
use App\Http\Requests\SyncUserServicesRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Models\User;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{
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
		$user = User::where('email', $request->email)->first();

		if (! $user || ! Hash::check($request->password, $user->password)) {
			return response()->json(['message' => 'Invalid credentials'], 401);
		}

		if ($request->remember) {
			$user->setRememberToken(Str::random(60));
			$user->save();
		}

		if (! $user->canLogin()) {
			return response()->json([
				'message' => 'Account is not active or email not verified.'
			], 403);
		}

		if ($request->guard === 'client' && ! $user->isClient()) {
			return response()->json(['message' => 'Access denied'], 403);
		}

		if ($request->guard === 'staff' && ! $user->isStaff()) {
			return response()->json(['message' => 'Access denied'], 403);
		}

		return response()->json([
			'token' => $user->createToken('react')->plainTextToken,
			'user' => [
				'id' => $user->id,
				'name' => $user->name,
				'email' => $user->email,
				'role' => $user->role,
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

		$query = User::query();

		if ($request->has('role') && $request->role != '') {
			$query->where('role', $request->role);
		}

		if ($request->has('gender') && $request->gender != '') {
			$query->where('gender', $request->gender);
		}

		if ($request->has('search') && $request->search != '') {
			$search = $request->search;
			$query->where(function($q) use ($search) {
				$q->where('name', 'like', "%$search%")
					->orWhere('email', 'like', "%$search%")
					->orWhere('phone', 'like', "%$search%");
			});
		}

		$perPage = $request->query('limit', 10);
		$users = $query->paginate($perPage);

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