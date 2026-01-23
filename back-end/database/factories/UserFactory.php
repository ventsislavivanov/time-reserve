<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;

/**
 * @extends Factory<User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
		return [
			'name' => fake()->name(),
			'email' => fake()->unique()->safeEmail(),
			'email_verified_at' => now(),
			'password' => Hash::make('password'),
			'phone' => fake()->phoneNumber(),
			'gender' => fake()->randomElement(['male', 'female', 'other']),
			'birth_date' => fake()->date('Y-m-d', '2005-01-01'),
			'role' => 'client',
			'is_approved' => true,
			'is_active' => true,
		];
    }
}
