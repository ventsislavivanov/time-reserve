<?php

namespace Database\Seeders;

use App\Models\JobPosition;
use App\Models\Service;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'admin',
            'email' => 'admin@test.com',
            'password' => Hash::make('password'),
            'role' => 'admin',
            'is_approved' => true,
            'email_verified_at' => now(),
        ]);

        $hairdresser = JobPosition::where('name', 'Фризьор')->first();
        $workerAn = User::create([
            'name' => 'An',
            'email' => 'an@test.com',
            'password' => Hash::make('password'),
            'role' => 'worker',
            'is_approved' => true,
            'phone' => '+380991234567',
            'gender' => 'female',
            'job_position_id' => $hairdresser ? $hairdresser->id : null,
            'email_verified_at' => now(),
        ]);

        $haircutServices = Service::where('name', 'like', '%подстригване%')->pluck('id');
        $workerAn->services()->attach($haircutServices);

        User::create([
            'name' => 'Eva',
            'email' => 'eva@test.com',
            'password' => Hash::make('password'),
            'role' => 'client',
            'is_approved' => true,
            'phone' => '+380991234567',
            'gender' => 'female',
            'email_verified_at' => now(),
        ]);
    }
}
