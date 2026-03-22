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
	protected $description = 'Mark pending appointments as timed out when the confirmation window expires and notify clients';

	public function handle(): void
	{
        $count = 0;

        Appointment::where('status', AppointmentStatus::Pending)
            ->orderBy('id')
            ->chunkById(200, function ($appointments) use (&$count) {
                /* @var Appointment $appointment */
                foreach ($appointments as $index => $appointment) {
                    try {
                        $appointment->ensureCanBeExpired();

                        $appointment->update(['status' => AppointmentStatus::Expired]);
                        $count++;

                        SendAppointmentExpiredNotificationJob::dispatch($appointment)
                            // This delay for testing purposes in mailtrap
                            ->delay(now()->addSeconds($index * 2));
                    } catch (\DomainException $e) {
                        Log::warning("Cannot mark appointment {$appointment->id} as expired: {$e->getMessage()}");
                        continue;
                    }
                }
            });

        $this->info("Marked {$count} appointments as expired.");
    }
}
