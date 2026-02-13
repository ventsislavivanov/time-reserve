<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BusinessHoursSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
		DB::table('business_hours')->insert([
			['day_of_week' => 0, 'start_time' => '10:00', 'end_time' => '18:00', 'is_working' => true],
			['day_of_week' => 1, 'start_time' => '10:00', 'end_time' => '18:00', 'is_working' => true],
			['day_of_week' => 2, 'start_time' => '10:00', 'end_time' => '18:00', 'is_working' => true],
			['day_of_week' => 3, 'start_time' => '10:00', 'end_time' => '18:00', 'is_working' => true],
			['day_of_week' => 4, 'start_time' => '10:00', 'end_time' => '18:00', 'is_working' => true],
			['day_of_week' => 5, 'start_time' => '10:00', 'end_time' => '14:00', 'is_working' => true],
			['day_of_week' => 6, 'start_time' => '10:00', 'end_time' => '18:00', 'is_working' => false],
		]);
    }
}
