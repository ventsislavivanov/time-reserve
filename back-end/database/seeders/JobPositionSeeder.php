<?php

namespace Database\Seeders;

use App\Models\Job;
use Illuminate\Database\Seeder;

class JobPositionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Job::create([
            'name' => 'Фризьор',
            'description' => 'Специалист по подстригване и оформяне на прически.',
        ]);

        Job::create([
            'name' => 'Маникюрист',
            'description' => 'Специалист по грижа за ръцете и ноктите.',
        ]);

        Job::create([
            'name' => 'Козметик',
            'description' => 'Специалист по грижа за кожата и лицето.',
        ]);
    }
}
