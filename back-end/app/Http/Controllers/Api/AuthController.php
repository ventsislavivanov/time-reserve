<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
	public function register(Request $request)
	{
		$request->validate([
			'name' => 'required|string|max:255',
			'email' => 'required|email|unique:users',
			'password' => 'required|min:6',
		]);

		$user = User::create([
			'name' => $request->name,
			'email' => $request->email,
			'password' => Hash::make($request->password),
		]);

		return response()->json([
			'token' => $user->createToken('react')->plainTextToken
		]);
	}

	public function login(Request $request)
	{
		$request->validate([
			'email' => 'required|email',
			'password' => 'required',
			'guard' => 'required|in:client,staff',
		]);

		$user = User::where('email', $request->email)->first();

		if (! $user || ! Hash::check($request->password, $user->password)) {
			return response()->json(['message' => 'Invalid credentials'], 401);
		}

		if ($request->guard === 'client' && !$user->isClient()) {
			return response()->json(['message' => 'Access denied'], 403);
		}

		if ($request->guard === 'staff' && !in_array($user->role, ['admin', 'cosmetician'])) {
			return response()->json(['message' => 'Access denied'], 403);
		}

		return response()->json([
			'token' => $user->createToken('react')->plainTextToken,
			'user' => [
				'id' => $user->id,
				'name' => $user->name,
				'email' => $user->email,
				'role' => $user->role,
			],

			'fullUser' => $user,
		]);
	}

	public function logout(Request $request)
	{
		$request->user()->currentAccessToken()->delete();
		return response()->json(['message' => 'Logged out']);
	}
}