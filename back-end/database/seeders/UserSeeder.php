<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
		DB::table('users')->insert([
			[
				'name' => 'admin',
				'email' => 'admin@test.com',
				'password' => bcrypt('password'),
				'role' => 'admin',
				'is_approved' => true,
				'phone' => null,
				'gender' => null,
				'birth_date' => null,
			],
			[
				'name' => 'An',
				'email' => 'an@test.com',
				'password' => bcrypt('password'),
				'role' => 'worker',
				'is_approved' => true,
				'phone' => '+380991234567',
				'gender' => 'female',
				'birth_date' => null,
			],
			[
				'name' => 'Eva',
				'email' => 'eva@test.com',
				'password' => bcrypt('password'),
				'role' => 'client',
				'is_approved' => true,
				'phone' => '+380991234567',
				'gender' => 'female',
				'birth_date' => null,
			]
		]);
    }
}
