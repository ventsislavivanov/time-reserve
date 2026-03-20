<?php

namespace App\Jobs;

use App\Models\Appointment;
use App\Notifications\AppointmentExpiredNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SendAppointmentExpiredNotificationJob implements ShouldQueue
{
	use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

	public function __construct(public Appointment $appointment) {}

	public function handle(): void
	{
		$this->appointment->client->notify(
			new AppointmentExpiredNotification($this->appointment)
		);
	}
}