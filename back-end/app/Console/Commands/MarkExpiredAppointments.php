<?php

namespace App\Console\Commands;

use App\AppointmentStatus;
use App\Jobs\SendAppointmentExpiredNotificationJob;
use App\Models\Appointment;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class MarkExpiredAppointments extends Command
{
	protected $signature = 'appointments:mark-expired';
	protected $description = 'Mark pending appointments as expired after 24 hours and notify clients';

	public function handle(): void
	{
		$appointments = Appointment::with('client')
			->where('status', AppointmentStatus::Pending->name)
			->where('created_at', '<', now()->subHours(24))
			->get();

		/* @var Appointment $appointment */
		foreach ($appointments as $index => $appointment) {
			try {
				$appointment->ensureCanBeExpired();

				$appointment->update(['status' => AppointmentStatus::Expired->name]);
				SendAppointmentExpiredNotificationJob::dispatch($appointment)
					// This delay for testing purposes in mailtrap
					->delay(now()->addSeconds($index * 2));
			}
			catch (\DomainException $e) {
				Log::warning("Cannot mark appointment {$appointment->id} as expired: {$e->getMessage()}");
				continue;
			}
		}

		$this->info("Marked {$appointments->count()} appointments as expired.");
	}
}