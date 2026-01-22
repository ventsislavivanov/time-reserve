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
			'phone' => 'required|string|min:6|max:14',
			'birth_date' => 'required|date',
			'gender' => 'required|in:male,female,other',
		]);

		$user = User::create([
			'name' => $request->name,
			'email' => $request->email,
			'password' => Hash::make($request->password),
			'phone'      => $request->phone,
			'birth_date' => $request->birth_date,
			'gender'     => $request->gender,
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

		if (!$user->is_approved) {
			return response()->json(['message' => 'Our profile is not approved yet.'], 403);
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

	public function createUser(Request $request)
	{
		$request->validate([
			'name'       => 'required|string|max:255',
			'email'      => 'required|email|unique:users',
			'password'   => 'required|min:6',
			'phone'      => 'required|string',
			'birth_date' => 'required|date',
			'gender'     => 'required|in:male,female,other',
			'role'       => 'required|in:admin,worker,client',
			'is_approved'=> 'boolean'
		]);

		$user = User::create([
			'name'        => $request->name,
			'email'       => $request->email,
			'password'    => Hash::make($request->password),
			'phone'       => $request->phone,
			'birth_date'  => $request->birth_date,
			'gender'      => $request->gender,
			'role'        => $request->role,
			'is_approved' => $request->is_approved ?? false,
		]);

		return response()->json([
			'message' => 'User created successfully',
			'user'    => $user
		], 201);
	}
}