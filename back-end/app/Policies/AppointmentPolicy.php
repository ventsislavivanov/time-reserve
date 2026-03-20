<?php

namespace App\Policies;

use App\Models\Appointment;
use App\Models\User;

class AppointmentPolicy
{

	public function view(User $user, Appointment $appointment): Bool
	{
		return !$user->isAdmin() &&
			$appointment->worker_id !== $user->id &&
			$appointment->client_id !== $user->id;
	}

	public function store(User $user): Bool
	{
		return $user->isAllowedToBook();
	}

	public function cancel(User $user, Appointment $appointment): bool
	{
		return $user->isClient() && $appointment->client_id === $user->id;
	}

	public function manage(User $user, Appointment $appointment): bool
	{
		return $user->isAdmin() || $appointment->worker_id === $user->id;
	}
}