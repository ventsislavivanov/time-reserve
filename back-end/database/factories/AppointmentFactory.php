<?php

namespace Database\Factories;

use App\AppointmentStatus;
use App\Models\Appointment;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Appointment>
 */
class AppointmentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            //
        ];
    }

	public function pending()
	{
		return $this->state(fn () => ['status' => AppointmentStatus::Pending->name]);
	}

	public function confirmed()
	{
		return $this->state(fn () => ['status' => AppointmentStatus::Confirmed->name]);
	}
}
