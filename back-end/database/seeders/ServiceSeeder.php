<?php

namespace Database\Seeders;

use App\Models\Service;
use Illuminate\Database\Seeder;

class ServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Service::create([
            'name' => 'Мъжко подстригване',
            'duration_minutes' => 30,
            'description' => 'Класическо мъжко подстригване.',
            'is_active' => true,
        ]);

        Service::create([
            'name' => 'Дамско подстригване',
            'duration_minutes' => 60,
            'description' => 'Подстригване, измиване и сешоар.',
            'is_active' => true,
        ]);

        Service::create([
            'name' => 'Маникюр с гел лак',
            'duration_minutes' => 90,
            'description' => 'Професионален маникюр с дълготраен гел лак.',
            'is_active' => true,
        ]);

        Service::create([
            'name' => 'Почистване на лице',
            'duration_minutes' => 60,
            'description' => 'Дълбоко почистване на кожата на лицето.',
            'is_active' => true,
        ]);
    }
}
