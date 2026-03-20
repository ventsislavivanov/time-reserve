<?php

namespace App\Notifications;

use App\Models\Appointment;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class AppointmentExpiredNotification extends Notification
{
	use Queueable;

	public function __construct(public Appointment $appointment) {}

	public function via(object $notifiable): array
	{
		return ['mail'];
	}

	public function toMail(object $notifiable): MailMessage
	{
		$appointment = $this->appointment;
		$date = $appointment->starts_at->format('d M Y');
		$time = $appointment->starts_at->format('H:i') . ' - ' . $appointment->ends_at->format('H:i');
		$service = $appointment->service->name;
		$worker = $appointment->worker->name;

		return (new MailMessage)
			->subject('Your appointment was not confirmed')
			->greeting("Hello {$notifiable->name},")
			->line("Unfortunately, your appointment was not confirmed in time.")
			->line("**Service:** {$service}")
			->line("**Worker:** {$worker}")
			->line("**Date:** {$date}")
			->line("**Time:** {$time}")
			->action('Book a new appointment', url('/workers'))
			->line('We apologize for the inconvenience. Please book a new appointment with another available worker.');
	}
}