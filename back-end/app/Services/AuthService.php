<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class AuthService
{
	public function login(
		string $email,
		string $password,
		string $guard,
		bool $remember = false
	): array
	{
		$user = User::where('email', $email)->first();

		if (!$user || ! Hash::check($password, $user->password)) {
			throw ValidationException::withMessages([
				'email' => ['Invalid credentials.'],
			]);
		}

		if (! $user->canLogin()) {
			throw ValidationException::withMessages([
				'account' => ['Account is not active or email not verified.'],
			]);
		}

		if ($guard === 'client' && ! $user->isClient()) {
			throw ValidationException::withMessages([
				'guard' => ['Access denied.'],
			]);
		}

		if ($guard === 'staff' && ! $user->isStaff()) {
			throw ValidationException::withMessages([
				'guard' => ['Access denied.'],
			]);
		}

		if ($remember) {
			$user->setRememberToken(Str::random(60));
			$user->save();
		}

		return [
			'token' => $user->createToken('react')->plainTextToken,
			'user'  => $user,
		];
	}
}
