<?php

namespace App\Console\Commands;

use App\Models\Appointment;
use Carbon\Carbon;
use Illuminate\Console\Command;

class MarkNoShowAppointments extends Command
{
    protected $signature = 'appointments:mark-no-show';
    protected $description = 'Mark appointments as no-show if client did not arrive 2 hours after start time';

    public function handle()
    {
		$twoHoursAgo = Carbon::now()->subHours(2);

		$appointments = Appointment::where('status', 'confirmed')
			->where('ends_at', '<=', $twoHoursAgo)
			->get();

		$count = 0;

		foreach ($appointments as $appointment) {
			$appointment->update(['status' => 'no_show']);
			$count++;
		}

		$this->info("Marked {$count} appointments as no-show");
    }
}
