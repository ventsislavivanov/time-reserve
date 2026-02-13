<?php

namespace App\Policies;

use App\Models\Appointment;
use App\Models\User;

class AppointmentPolicy
{
	public function viewAny(User $user): bool
	{
		return $user->isAdmin() || $user->isWorker();
	}

	public function update(User $user, Appointment $appointment): bool
	{
		return $user->isAdmin() || $user->isWorker();
	}

	public function cancel(User $user, Appointment $appointment): bool
	{
		return $user->isAdmin() || $appointment->client_id === $user->id;
	}

	public function reject(User $user, Appointment $appointment): bool
	{
		return $user->isAdmin() || $appointment->worker_id === $user->id;
	}

	public function decline(User $user, Appointment $appointment): bool
	{
		return $user->isAdmin() || $appointment->worker_id === $user->id;
	}
}