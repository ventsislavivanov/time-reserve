<?php

namespace App\Policies;

use App\Models\Appointment;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class AppointmentPolicy
{
	public function viewAny(User $user): Response
	{
		if (!$user->isAdmin() && !$user->isWorker()) {
			return Response::deny('You are not authorized to view appointments');
		}
		if (!$user->can_book_appointments) {
			return Response::deny('You are not allowed to view any appointments');
		}

		return Response::allow();
	}

	public function create(User $user): Response
	{
		if (!$user->isAllowedToBook()) {
			return Response::deny('You are not allowed to book appointments');
		}

		return Response::allow();
	}

	public function cancel(User $user, Appointment $appointment): Response
	{
		if (!$user->isClient() || $appointment->client_id !== $user->id) {
			return Response::deny('You are not authorized to cancel this appointment.');
		}

		if ($appointment->isCancelled()) {
			return Response::deny('Appointment is already cancelled');
		}

		$hoursBeforeAppointment = now()->diffInHours($appointment->starts_at, false);

		if ($hoursBeforeAppointment < 24) {
			return Response::deny('You cannot cancel appointments less than 24 hours in advance. Please contact with our staff for more information.');
		}

		return Response::allow();
	}


	public function confirm(User $user, Appointment $appointment): Response
	{
		if (!$appointment->isPending()) {
			return Response::deny('Only pending appointments can be confirmed');
		}

		return Response::allow();
	}

	public function reject(User $user, Appointment $appointment): Response
	{
		if (!$user->isAdmin() && $appointment->worker_id !== $user->id) {
			return Response::deny('You are not authorized to reject this appointment.');
		}

		if (!$appointment->isPending()) {
			return Response::deny('Only pending appointments can be rejected');
		}

		return Response::allow();
	}

	public function decline(User $user, Appointment $appointment): Response
	{
		if (!$user->isAdmin() && $appointment->worker_id !== $user->id) {
			return Response::deny('You are not authorized to decline this appointment.');
		}

		if (!$appointment->isConfirmed()) {
			return Response::deny('Only confirmed appointments can be declined.');
		}

		if ($appointment->starts_at->isPast()) {
			return Response::deny('Cannot decline appointments that have already started.');
		}

		return Response::allow();
	}

	public function complete(User $user, Appointment $appointment): Response
	{
		if ($appointment->worker_id !== $user->id) {
			return Response::deny('You are not authorized to complete this appointment.');
		}

		if (!$appointment->isConfirmed()) {
			return Response::deny('Only confirmed appointments can be completed');
		}

		return Response::allow();
	}

	public function noShow(User $user, Appointment $appointment): Response
	{
		if (!$user->isAdmin() && $appointment->worker_id !== $user->id) {
			return Response::deny('You are not authorized to mark this appointment as no-show.');
		}

		if (!$appointment->isConfirmed()) {
			return Response::deny('Only confirmed appointments can be marked as no-show');
		}

		if ($appointment->ends_at->isFuture()) {
			return Response::deny('Cannot mark future appointment as no-show');
		}

		return Response::allow();
	}

//	public function expire(User $user, Appointment $appointment): Response
//	{
//		if ($appointment->ends_at->isFuture()) {
//			return Response::deny('Cannot mark future appointment as expired');
//		}
//
//		return Response::allow();
//	}
}