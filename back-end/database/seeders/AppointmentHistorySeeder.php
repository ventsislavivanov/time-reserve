<?php

namespace Database\Seeders;

use App\Models\Appointment;
use App\Models\AppointmentHistory;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Collection;

/**
 * Appointments with a realistic status history (every transition is a row in appointment_history).
 *
 *  - Personal history: a fixed set of appointments for the client eva@test.com
 *    (every status, past and upcoming) with workers An and Maria.
 *  - Admin / staff history: ~45 random appointments across all workers and clients,
 *    where some confirmations and declines were done by the admin.
 *
 * History is written explicitly (model events are off), so the data is the same whether this seeder
 * runs from DatabaseSeeder (WithoutModelEvents) or on its own. Development data only.
 */
class AppointmentHistorySeeder extends Seeder
{
	/** Status chains. Every step is a valid transition of App\AppointmentStatus. */
	private const CHAINS = [
		'pending'     => ['pending'],
		'confirmed'   => ['pending', 'confirmed'],
		'completed'   => ['pending', 'confirmed', 'in_progress', 'completed'],
		'no_show'     => ['pending', 'confirmed', 'no_show'],
		'cancelled'   => ['pending', 'confirmed', 'cancelled'],
		'declined'    => ['pending', 'declined'],
		'expired'     => ['pending', 'expired'],
		'timed_out'   => ['pending', 'timed_out'],
	];

	private const DECLINE_REASONS = [
		'Служителят не е на разположение в този час',
		'Часът се застъпва с друга резервация',
		'Услугата не е възможна за избрания ден',
	];

	private const CANCEL_REASONS = [
		'Промяна в плановете',
		'Болест',
		'Намерих по-удобен час',
	];

	/** @var array<int, array<int, array{0: Carbon, 1: Carbon}>> busy slots per worker id */
	private array $busy = [];

	private User $admin;

	public function run(): void
	{
		$this->admin = User::where('email', 'admin@test.com')->firstOrFail();
		$eva = User::where('email', 'eva@test.com')->firstOrFail();

		$workers = User::where('role', 'worker')->with('services')->get()
			->filter(fn (User $worker) => $worker->services->isNotEmpty())->values();
		$clients = User::where('role', 'client')->get();

		if ($workers->isEmpty() || $clients->isEmpty()) {
			return;
		}

		fake()->seed(20260102);

		Appointment::withoutEvents(function () use ($eva, $workers, $clients) {
			$this->seedPersonalHistory($eva, $workers);
			// Eva keeps exactly her scripted history, the random ones go to the other clients.
			$this->seedAdminHistory($workers, $clients->reject(fn (User $client) => $client->id === $eva->id));
		});

		$this->syncClientCounters($clients);
	}

	// ───── Personal history (client eva@test.com) ─────

	private function seedPersonalHistory(User $eva, Collection $workers): void
	{
		$plan = [
			// [days from today, final status, worker]
			[-45, 'completed', 'an@test.com'],
			[-32, 'completed', 'an@test.com'],
			[-28, 'completed', 'maria@test.com'],
			[-21, 'cancelled', 'an@test.com'],
			[-14, 'declined',  'an@test.com'],
			[-9,  'no_show',   'an@test.com'],
			[-6,  'completed', 'an@test.com'],
			[-3,  'expired',   'maria@test.com'],
			[2,   'confirmed', 'an@test.com'],
			[5,   'pending',   'an@test.com'],
			[8,   'pending',   'maria@test.com'],
			[11,  'confirmed', 'maria@test.com'],
		];

		foreach ($plan as [$days, $status, $workerEmail]) {
			$worker = $workers->firstWhere('email', $workerEmail) ?? $workers->first();
			$this->createAppointment($eva, $worker, $days, $status);
		}
	}

	// ───── Admin / staff history ─────

	private function seedAdminHistory(Collection $workers, Collection $clients): void
	{
		for ($i = 0; $i < 45; $i++) {
			$future = fake()->boolean(25);
			$days = $future ? fake()->numberBetween(1, 14) : -fake()->numberBetween(1, 60);

			$status = $future
				? fake()->randomElement(['pending', 'pending', 'pending', 'confirmed', 'confirmed', 'confirmed', 'cancelled'])
				: fake()->randomElement([
					'completed', 'completed', 'completed', 'completed', 'completed', 'completed',
					'cancelled', 'declined', 'no_show', 'expired', 'timed_out',
				]);

			$this->createAppointment(
				fake()->randomElement($clients->all()),
				fake()->randomElement($workers->all()),
				$days,
				$status,
			);
		}
	}

	// ───── Building one appointment with its history ─────

	private function createAppointment(User $client, User $worker, int $days, string $finalStatus): void
	{
		$future = $days > 0;
		$service = fake()->randomElement($worker->services->all());
		$start = $this->slot($worker, now()->addDays($days), $service->duration, $future);
		$end = $start->copy()->addMinutes($service->duration);

		// Created at least a day before the appointment, never in the future.
		$createdAt = $future
			? now()->subDays(fake()->numberBetween(1, 3))->subMinutes(fake()->numberBetween(5, 600))
			: $start->copy()->subDays(fake()->numberBetween(1, 5))->setTime(fake()->numberBetween(9, 20), fake()->numberBetween(0, 59));

		$events = [];
		$time = $createdAt->copy();
		$lastReason = null;

		foreach (self::CHAINS[$finalStatus] as $index => $status) {
			$actor = null;
			$reason = null;

			switch ($status) {
				case 'pending':
					$actor = $client;
					break;
				case 'confirmed':
				case 'declined':
					$actor = fake()->boolean(25) ? $this->admin : $worker;
					$time = $this->between($time, $start->copy()->subHour());
					$reason = $status === 'declined' ? fake()->randomElement(self::DECLINE_REASONS) : null;
					break;
				case 'in_progress':
					$actor = $worker;
					$time = $start->copy();
					break;
				case 'completed':
					$actor = $worker;
					$time = $end->copy();
					break;
				case 'no_show':
					$actor = $worker;
					$time = $start->copy()->addMinutes(15);
					break;
				case 'cancelled':
					$actor = $client;
					$time = $this->between($time, $start->copy()->subHour());
					$reason = fake()->randomElement(self::CANCEL_REASONS);
					break;
				case 'expired':
					$time = $start->copy();
					break;
				case 'timed_out':
					$time = $start->copy()->subHour();
					break;
			}

			// A "future" appointment has not reached its later steps yet; clamp to now.
			if ($time->gt(now())) {
				$time = now()->subMinutes(fake()->numberBetween(1, 30));
			}

			$events[] = [
				'old_status' => $index === 0 ? null : self::CHAINS[$finalStatus][$index - 1],
				'new_status' => $status,
				'changed_by' => $actor?->id,
				'reason' => $reason,
				'at' => $time->copy(),
			];
			$lastReason = $reason;
		}

		$last = end($events);

		$appointment = new Appointment([
			'service_id' => $service->id,
			'worker_id' => $worker->id,
			'client_id' => $client->id,
			'starts_at' => $start,
			'ends_at' => $end,
			'status' => $finalStatus,
			'changed_by' => $last['changed_by'],
			'notes' => fake()->boolean(20) ? fake()->randomElement(['Първо посещение', 'Моля, без парфюм', 'Закъснявам 5 минути']) : null,
			'reason' => $lastReason,
		]);
		$appointment->created_at = $createdAt;
		$appointment->updated_at = $last['at'];
		$appointment->save();

		foreach ($events as $event) {
			$row = new AppointmentHistory([
				'appointment_id' => $appointment->id,
				'old_status' => $event['old_status'],
				'new_status' => $event['new_status'],
				'changed_by' => $event['changed_by'],
				'reason' => $event['reason'],
			]);
			$row->created_at = $event['at'];
			$row->updated_at = $event['at'];
			$row->save();
		}
	}

	private function between(Carbon $from, Carbon $to): Carbon
	{
		if ($to->lte($from)) {
			return $from->copy()->addMinutes(5);
		}

		return $from->copy()->addSeconds(fake()->numberBetween(60, max(61, $from->diffInSeconds($to))));
	}

	/**
	 * A free slot on a Monday to Thursday between 10:00 and 17:30, so it is inside business hours
	 * regardless of how the days are numbered. Past appointments move back, upcoming ones forward.
	 */
	private function slot(User $worker, Carbon $day, int $duration, bool $future): Carbon
	{
		$day = $day->copy()->startOfDay();

		while ($day->dayOfWeekIso > 4) {
			$future ? $day->addDay() : $day->subDay();
		}

		for ($try = 0; $try < 40; $try++) {
			$start = $day->copy()->setTime(fake()->numberBetween(10, 16), fake()->randomElement([0, 30]));
			$end = $start->copy()->addMinutes($duration);

			if ($end->gt($day->copy()->setTime(17, 30))) {
				continue;
			}
			if ($future ? $start->lte(now()->addHour()) : $start->gte(now())) {
				continue;
			}
			if ($this->overlaps($worker->id, $start, $end)) {
				continue;
			}

			$this->busy[$worker->id][] = [$start, $end];

			return $start;
		}

		return $this->slot($worker, $day->copy()->{$future ? 'addDay' : 'subDay'}(), $duration, $future);
	}

	private function overlaps(int $workerId, Carbon $start, Carbon $end): bool
	{
		foreach ($this->busy[$workerId] ?? [] as [$busyStart, $busyEnd]) {
			if ($start->lt($busyEnd) && $end->gt($busyStart)) {
				return true;
			}
		}

		return false;
	}

	/** The counters the AppointmentObserver keeps up to date in real use. */
	private function syncClientCounters(Collection $clients): void
	{
		foreach ($clients as $client) {
			$appointments = Appointment::where('client_id', $client->id)->orderBy('starts_at')->get();

			$noShowStreak = 0;
			foreach ($appointments as $appointment) {
				$status = $appointment->status->value;
				if ($status === 'completed') {
					$noShowStreak = 0;
				} elseif ($status === 'no_show') {
					$noShowStreak++;
				}
			}

			$client->forceFill([
				'completed_count' => $appointments->filter(fn ($a) => $a->status->value === 'completed')->count(),
				'cancelled_count' => $appointments->filter(fn ($a) => $a->status->value === 'cancelled')->count(),
				'no_show_total_count' => $appointments->filter(fn ($a) => $a->status->value === 'no_show')->count(),
				'no_show_count' => $noShowStreak,
				// Three no-shows in a row block booking, like the observer does.
				'can_book_appointments' => $noShowStreak < 3,
			])->save();
		}
	}
}
