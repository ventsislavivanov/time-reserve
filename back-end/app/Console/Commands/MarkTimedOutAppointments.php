<?php

namespace App\Console\Commands;

use App\AppointmentStatus;
use App\Jobs\SendAppointmentTimedOutNotificationJob;
use App\Models\Appointment;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class MarkTimedOutAppointments extends Command
{
    protected $signature = 'appointments:mark-timed-out';
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
                        $appointment->ensureCanBeTimedOut();

                        $appointment->update(['status' => AppointmentStatus::TimedOut]);
                        $count++;

                        SendAppointmentTimedOutNotificationJob::dispatch($appointment)
                            ->delay(now()->addSeconds($index * 2));

                    } catch (\DomainException $e) {
                        Log::info("Skipping appointment {$appointment->id}: {$e->getMessage()}");
                        continue;
                    }
                }
            });

        $this->info("Timed out {$count} appointments.");
    }

}
