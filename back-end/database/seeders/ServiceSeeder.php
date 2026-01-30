<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
		DB::table('services')->insert([
			[
				'name' => 'Мъжко подстригване',
				'description' => 'Класическо мъжко подстригване.',
				'duration' => 30,
				'price' => 20.00,
				'category_id' => 1,
				'preparation_time' => 5,
				'cleanup_time' => 5,
				'is_active' => true,
				'image' => null,
				'created_at' => now(),
				'updated_at' => now(),
			],
			[
				'name' => 'Дамско подстригване',
				'description' => 'Подстригване,
				измиване и сешоар.',
				'duration' => 60,
				'price' => 45.00,
				'category_id' => 1,
				'preparation_time' => 10,
				'cleanup_time' => 10,
				'is_active' => true,
				'image' => null,
				'created_at' => now(),
				'updated_at' => now(),
			],
			[
				'name' => 'Маникюр с гел лак',
				'description' => 'Професионален маникюр с дълготраен гел лак.',
				'duration' => 90,
				'price' => 35.00,
				'category_id' => 2,
				'preparation_time' => 5,
				'cleanup_time' => 10,
				'is_active' => true,
				'image' => null,
				'created_at' => now(),
				'updated_at' => now(),
			],
			[
				'name' => 'Почистване на лице',
				'description' => 'Дълбоко почистване на кожата на лицето.',
				'duration' => 60,
				'price' => 50.00,
				'category_id' => 3,
				'preparation_time' => 10,
				'cleanup_time' => 10,
				'is_active' => true,
				'image' => null,
				'created_at' => now(),
				'updated_at' => now(),
			],
			[
				'name' => 'Мезотерапия',
				'description' => 'Подмладяваща мезотерапия за лице.',
				'duration' => 45,
				'price' => 80.00,
				'category_id' => 3,
				'preparation_time' => 10,
				'cleanup_time' => 10,
				'is_active' => true,
				'image' => null,
				'created_at' => now(),
				'updated_at' => now(),
			],
		]);
    }
}
