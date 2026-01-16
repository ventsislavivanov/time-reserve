<?php

namespace App\Services;

use App\Models\Appointment;

class BookingService
{
	/**
	 * Проверка дали козметикът е свободен в даден интервал
	 */
	public function checkAvailability(int $workerId, string $start, string $end): bool
	{
		return !Appointment::where('worker_id', $workerId)
			->whereIn('status', ['pending', 'approved'])
			->where(function ($q) use ($start, $end) {
				$q->whereBetween('start_time', [$start, $end])
					->orWhereBetween('end_time', [$start, $end]);
			})
			->exists();
	}

	/**
	 * Създаване на нов час (Pending)
	 */
	public function bookAppointment(int $userId, int $workerId, int $serviceId, string $start, string $end): Appointment
	{
		if (!$this->checkAvailability($workerId, $start, $end)) {
			throw new \Exception('Worker is busy during this time.');
		}

		return Appointment::create([
			'user_id' => $userId,
			'worker_id' => $workerId,
			'service_id' => $serviceId,
			'start_time' => $start,
			'end_time' => $end,
			'status' => 'pending',
		]);
	}

	/**
	 * Одобряване на час
	 */
	public function approveAppointment(Appointment $appointment): Appointment
	{
		$appointment->status = 'approved';
		$appointment->save();

		return $appointment;
	}

	/**
	 * Отказ на час
	 */
	public function rejectAppointment(Appointment $appointment): Appointment
	{
		$appointment->status = 'rejected';
		$appointment->save();

		return $appointment;
	}

	/**
	 * Връща всички часове за даден козметик
	 */
	public function getAppointmentsForWorker(int $workerId)
	{
		return Appointment::where('worker_id', $workerId)
			->orderBy('starts_at')
			->get();
	}
}
