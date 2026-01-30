<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
	public function run()
	{
		DB::table('categories')->insert([
			[
				'name' => 'Фризьорски услуги',
				'created_at' => now(),
				'updated_at' => now(),
			],
			[
				'name' => 'Маникюр',
				'created_at' => now(),
				'updated_at' => now(),
			],
			[
				'name' => 'Козметика',
				'created_at' => now(),
				'updated_at' => now(),
			],
		]);
	}
}
