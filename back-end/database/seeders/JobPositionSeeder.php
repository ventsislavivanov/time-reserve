<?php

namespace Database\Seeders;

use App\Models\JobPosition;
use Illuminate\Database\Seeder;

class JobPositionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        JobPosition::create([
            'name' => 'Фризьор',
            'description' => 'Специалист по подстригване и оформяне на прически.',
        ]);

        JobPosition::create([
            'name' => 'Маникюрист',
            'description' => 'Специалист по грижа за ръцете и ноктите.',
        ]);

        JobPosition::create([
            'name' => 'Козметик',
            'description' => 'Специалист по грижа за кожата и лицето.',
        ]);
    }
}
