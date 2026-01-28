<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterClientRequest;
use App\Http\Resources\User\UserAuthResource;
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
			'user' => new UserAuthResource($result['user']),
		]);
	}

	public function logout(Request $request)
	{
		$request->user()->currentAccessToken()->delete();
		return response()->json(['message' => 'Logged out']);
	}

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

}