<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{
	public function registerClient(Request $request)
	{
		$request->validate([
			'name'		 => 'required|string|max:255',
			'email'		 => 'required|email|unique:users',
			'password'	 => 'required|min:6',
			'phone' 	 => 'required|string|min:6|max:14',
			'birth_date' => 'required|date',
			'gender'	 => 'required|in:male,female,other',
		]);

		$user = User::create([
			'name'			=> $request->name,
			'email'			=> $request->email,
			'password'		=> Hash::make($request->password),
			'phone'			=> $request->phone,
			'birth_date'	=> $request->birth_date,
			'gender'		=> $request->gender,
			'is_approved'	=> false,
		]);

		$user->sendEmailVerificationNotification();

		return response()->json([
			'message' => 'Please check your email for a confirmation link.'
		]);
	}

	public function createUser(Request $request)
	{
		$request->validate([
			'name'       => 'required|string|max:255',
			'email'      => 'required|email|unique:users',
			'password'   => 'required|min:6',
			'phone'      => 'required|string',
			'birth_date' => 'required|date',
			'gender'     => 'required|in:male,female',
			'role'       => 'required|in:admin,worker',
			'job_position_id' => 'nullable|exists:job_positions,id',
		]);

		$user = User::create([
			'name'        		=> $request->name,
			'email'       		=> $request->email,
			'password'    		=> Hash::make($request->password),
			'phone'       		=> $request->phone,
			'birth_date'  		=> $request->birth_date,
			'gender'      		=> $request->gender,
			'role'        		=> $request->role,
			'job_position_id'   => $request->job_position_id,
			'email_verified_at' => now(),
			'is_approved' 		=> true,
		]);

		return response()->json([
			'message' => 'User created successfully',
			'user'    => $user
		], 201);
	}

	public function updateUser(Request $request, User $user)
	{

		$request->validate([
			'name'       => 'required|string|max:255',
			'email'      => 'required|email|unique:users,email,' . $user->id,
			'phone'      => 'required|string',
			'birth_date' => 'required|date',
			'gender'     => 'required|in:male,female,other',
			'role'       => 'required|in:admin,worker,client',
			'password'   => 'nullable|min:6',
			'job_position_id' => 'nullable|exists:job_positions,id',
		]);

		$user->fill([
			'name' => $request->name,
			'email' => $request->email,
			'phone' => $request->phone,
			'birth_date' => $request->birth_date,
			'gender' => $request->gender,
			'role' => $request->role,
			'job_position_id' => $request->job_position_id,
		]);

		if ($request->filled('password')) {
			$user->password = Hash::make($request->password);
		}

		$user->save();

		return response()->json([
			'message' => 'User updated successfully',
			'user'    => $user
		]);
	}

	public function login(Request $request)
	{
		$request->validate([
			'email' => 'required|email',
			'password' => 'required',
			'guard' => 'required|in:client,staff',
			'remember' => 'boolean'
		]);

		$user = User::where('email', $request->email)->first();

		if (! $user || ! Hash::check($request->password, $user->password)) {
			return response()->json(['message' => 'Invalid credentials'], 401);
		}

		if ($request->remember) {
			$user->setRememberToken(Str::random(60));
			$user->save();
		}

		if (!$user->is_approved) {
			return response()->json(['message' => 'Please confirm your email before login.'], 403);
		}

		if ($request->guard === 'client' && !$user->isClient()) {
			return response()->json(['message' => 'Access denied'], 403);
		}

		if ($request->guard === 'staff' && !in_array($user->role, ['admin', 'worker'])) {
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

	public function verifyEmail(Request $request, $id, $hash)
	{
		$user = User::findOrFail($id);

		if (!hash_equals((string) $hash, sha1($user->getEmailForVerification()))) {
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
		if (auth()->id() == $user->id) {
			return response()->json(['message' => 'Cannot deactivate own account.'], 400);
		}

		$user->is_active = !$user->is_active;
		$user->save();

		return response()->json([
			'message' => $user->is_active ? 'User is active.' : 'User is blocked.',
			'user' => $user
		]);
	}

	public function getUserServices(User $user)
	{
		return response()->json($user->services);
	}

	public function syncUserServices(Request $request, User $user)
	{
		$request->validate([
			'service_ids' => 'required|array',
			'service_ids.*' => 'exists:services,id',
		]);

		$user->services()->sync($request->service_ids);

		return response()->json(['message' => 'Services synced successfully']);
	}

}