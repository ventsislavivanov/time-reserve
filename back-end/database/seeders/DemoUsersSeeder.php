<?php

namespace Database\Seeders;

use App\Models\JobPosition;
use App\Models\Service;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

/**
 * Extra workers and fake clients so the admin and worker views have something to show.
 * Development data only, see DatabaseSeeder. Password for every account: "password".
 */
class DemoUsersSeeder extends Seeder
{
	public function run(): void
	{
		fake()->seed(20260101);

		$this->worker('Maria', 'maria@test.com', 'Маникюрист', ['%маникюр%']);
		$this->worker('Elena', 'elena@test.com', 'Козметик', ['%лице%', '%мезотерапия%']);

		User::factory()->count(12)->create();
	}

	private function worker(string $name, string $email, string $position, array $servicePatterns): void
	{
		$worker = User::create([
			'name' => $name,
			'email' => $email,
			'password' => Hash::make('password'),
			'role' => 'worker',
			'is_approved' => true,
			'phone' => '+359888' . fake()->numerify('######'),
			'gender' => 'female',
			'job_position_id' => JobPosition::where('name', $position)->value('id'),
			'email_verified_at' => now(),
		]);

		$serviceIds = Service::where(function ($query) use ($servicePatterns) {
			foreach ($servicePatterns as $pattern) {
				$query->orWhere('name', 'ilike', $pattern);
			}
		})->pluck('id');

		$worker->services()->attach($serviceIds);
	}
}
