<?php

namespace App\Observers;

use App\AppointmentStatus;
use App\Models\Appointment;

class AppointmentObserver
{
	public function creating(Appointment $appointment)
	{
		if (!$appointment->changed_by) {
			$appointment->changed_by = auth()->id();
		}
	}

	public function created(Appointment $appointment): void
	{
		$appointment->history()->create([
			'old_status' => null,
			'new_status' => $appointment->status,
			'changed_by' => $appointment->changed_by,
			'reason'     => $appointment->reason,
		]);
	}

	public function updating(Appointment $appointment): void
	{
		if ($appointment->isDirty('status')) {
			$appointment->changed_by = auth()->id();
		}
	}

	public function updated(Appointment $appointment): void
	{
		if (!$appointment->wasChanged('status')) {
			return;
		}

		$appointment->history()->create([
			'old_status' => $appointment->getOriginal('status'),
			'new_status' => $appointment->status,
			'changed_by' => $appointment->changed_by,
			'reason'     => $appointment->reason,
		]);

		$client = $appointment->client;
		if (!$client) return;

		switch ($appointment->status) {
			case AppointmentStatus::NoShow->value:
				$client->increment('no_show_count');
				$client->increment('no_show_total_count');

				if ($client->no_show_count >= 3) {
					$client->update(['can_book_appointments' => false]);

					// email/notification
					// event(new ClientBlocked($client))
				}
				break;

			case AppointmentStatus::Completed->value:
				$client->update(['no_show_count' => 0]);
				$client->increment('completed_count');
				break;

			case AppointmentStatus::Cancelled->value:
				if ($appointment->changed_by === $client->id) {
					$client->increment('cancelled_count');
				}
				break;
		}
	}
}
