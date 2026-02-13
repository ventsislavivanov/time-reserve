<?php

namespace App\Services;

use App\Models\Appointment;
use App\Models\BusinessHours;
use App\Models\Service;
use Carbon\Carbon;
use Illuminate\Support\Collection;

class AvailabilityService
{
	/**
	 * Generates free slots for a worker on a specific date
	 */
	public function getAvailableSlots(int $workerId, int $serviceId, string $date): Collection
	{
		$service = Service::findOrFail($serviceId);
		$dateCarbon = Carbon::parse($date);
		$dayOfWeek = $dateCarbon->dayOfWeekIso - 1; // 0=Monday, 6=Sunday

		// Take the working hours for the day
		$businessHours = BusinessHours::forDay($dayOfWeek)->first();

		if (!$businessHours || !$businessHours->is_working) {
			return collect(); // Day off
		}

		// Generate all possible slots
		$allSlots = $this->generateTimeSlots(
			$dateCarbon->copy()->setTimeFromTimeString($businessHours->start_time),
			$dateCarbon->copy()->setTimeFromTimeString($businessHours->end_time),
			$service->duration + $service->preparation_time + $service->cleanup_time
		);

		// Take the busy hours
		$bookedAppointments = Appointment::forWorker($workerId)
			->forDate($date)
			->active()
			->get(['starts_at', 'ends_at']);

		// Filter available hours
		return $allSlots->filter(function ($slot) use ($bookedAppointments, $service) {
			$slotStart = $slot['start'];
			$slotEnd = $slotStart->copy()->addMinutes($service->duration + $service->preparation_time + $service->cleanup_time);

			foreach ($bookedAppointments as $appointment) {
				// Check for overlap
				if ($slotStart->lt($appointment->ends_at) && $slotEnd->gt($appointment->starts_at)) {
					return false;
				}
			}

			return true;
		})->values();
	}

	/**
	 * Generates slots every 15 minutes
	 */
	private function generateTimeSlots(Carbon $start, Carbon $end, int $serviceDuration): Collection
	{
		$slots = collect();
		$current = $start->copy();
		$slotInterval = 15; // minutes between slots

		while ($current->copy()->addMinutes($serviceDuration)->lte($end)) {
			$slots->push([
				'start' => $current->copy(),
				'end' => $current->copy()->addMinutes($serviceDuration),
				'formatted' => $current->format('H:i'),
			]);

			$current->addMinutes($slotInterval);
		}

		return $slots;
	}

	/**
	 * Checks whether a slot is free
	 */
	public function isSlotAvailable(int $workerId, Carbon $startsAt, Carbon $endsAt): bool
	{
		return !Appointment::forWorker($workerId)
			->active()
			->where(function ($query) use ($startsAt, $endsAt) {
				$query->where(function ($q) use ($startsAt, $endsAt) {
					$q->where('starts_at', '<', $endsAt)
						->where('ends_at', '>', $startsAt);
				});
			})
			->exists();
	}
}