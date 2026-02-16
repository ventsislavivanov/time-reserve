<?php

namespace App\Observers;

use App\Models\Appointment;

class AppointmentObserver
{
	public function creating(Appointment $appointment)
	{
		if (!$appointment->changed_by) {
			$appointment->changed_by = auth()->id();
		}
	}

	public function updating(Appointment $appointment): void
	{
		if ($appointment->isDirty('status')) {
			$appointment->changed_by = auth()->id();
		}
	}

	public function updated(Appointment $appointment): void
	{
		if (!$appointment->isDirty('status')) {
			return;
		}

		$client = $appointment->client;
		if (!$client) return;

		switch ($appointment->status) {
			case 'no_show':
				$client->increment('no_show_count');
				$client->increment('no_show_total_count');

				if ($client->no_show_count >= 3) {
					$client->update(['can_book_appointments' => false]);

					// email/notification
					// event(new ClientBlocked($client))
				}
				break;

			case 'completed':
				$client->update(['no_show_count' => 0]);
				$client->increment('completed_count');
				break;

			case 'cancelled':
				if ($appointment->changed_by === $client->id) {
					$client->increment('cancelled_count');
				}
				break;
		}
	}
}