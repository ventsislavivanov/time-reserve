<?php

namespace App\Console\Commands;

use App\AppointmentStatus;
use App\Models\Appointment;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class MarkNoShowAppointments extends Command
{
    protected $signature = 'appointments:mark-no-show';
    protected $description = 'Mark appointments as no-show if client did not arrive 2 hours after appointment end time';

    public function handle()
    {
		$twoHoursAgo = Carbon::now()->subHours(2);

		$appointments = Appointment::where('status', AppointmentStatus::Confirmed->value)
			->where('ends_at', '<=', $twoHoursAgo)
			->get();

		$count = 0;

		/** @var Appointment $appointment */
		foreach ($appointments as $appointment) {
			try {
				$appointment->ensureCanBeNoShow();
				$appointment->update(['status' => AppointmentStatus::NoShow->value]);
				$count++;
			} catch (\DomainException $e) {
				Log::warning("Cannot mark appointment {$appointment->id} as no-show: {$e->getMessage()}");
				continue;
			}
		}

		$this->info("Marked {$count} appointments as no-show");
    }
}
