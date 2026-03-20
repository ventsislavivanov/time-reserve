<?php

namespace App\Models;

use App\AppointmentStatus;
use DomainException;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @mixin IdeHelperAppointment
 */
class Appointment extends Model
{

	protected $fillable = [
		'service_id',
		'worker_id',
		'client_id',
		'starts_at',
		'ends_at',
		'status',
		'changed_by',
		'notes',
		'reason',
	];

	protected $casts = [
		'starts_at' => 'datetime',
		'ends_at' => 'datetime',
		'status' => AppointmentStatus::class,
	];

	// ───── Relationships ─────

	public function service(): BelongsTo
	{
		return $this->belongsTo(Service::class);
	}

	public function worker(): BelongsTo
	{
		return $this->belongsTo(User::class, 'worker_id');
	}

	public function client(): BelongsTo
	{
		return $this->belongsTo(User::class, 'client_id');
	}

	public function changedBy(): BelongsTo
	{
		return $this->belongsTo(User::class, 'changed_by');
	}

	/**
	 * @return HasMany<AppointmentHistory>
	 */
	public function history(): HasMany
	{
		return $this->hasMany(AppointmentHistory::class);
	}

	// ───── Scopes ─────

	public function scopeForWorker($query, int $workerId)
	{
		return $query->where('worker_id', $workerId);
	}

	public function scopeForDate($query, string $date)
	{
		return $query->whereDate('starts_at', $date);
	}

	public function scopeActive($query)
	{
		return $query->whereIn('status', ['pending', 'confirmed']);
	}

	public function scopePending($query)
	{
		return $query->where('status', 'pending');
	}

	public function scopeConfirmed($query)
	{
		return $query->where('status', 'confirmed');
	}

	// ───── Helpers ─────

	public function changeStatus(AppointmentStatus $newStatus, ?string $reason = null): self
	{
		$current = $this->status;

		if (!$current->canTransitionTo($newStatus)) {
			throw new DomainException("Invalid status transition: {$current->value} → {$newStatus->value}");
		}

		$this->update([
			'status' => $newStatus->value,
			'reason' => $reason,
			'changed_by' => auth()->id(),
		]);

		return $this;
	}

	public function ensureCanBeCancelled(): void
	{
		if ($this->status === AppointmentStatus::Cancelled) {
			throw new \DomainException('Appointment is already cancelled.');
		}

		if (!$this->status->canTransitionTo(AppointmentStatus::Cancelled)) {
			throw new \DomainException('Only pending or confirmed appointments can be cancelled.');
		}

		if (now()->diffInHours($this->starts_at, false) < 24) {
			throw new \DomainException('You cannot cancel appointments less than 24 hours in advance.');
		}
	}

	public function ensureCanBeDeclined(): void
	{
		if ($this->status === AppointmentStatus::Declined) {
			throw new DomainException('Appointment is already declined.');
		}

		if (!$this->status->canTransitionTo(AppointmentStatus::Declined)) {
			throw new DomainException('Only pending or confirmed appointments can be declined.');
		}

		if ($this->starts_at->isPast()) {
			throw new DomainException('You cannot decline appointments that have already started.');
		}
	}

	public function ensureCanBeConfirmed(): void
	{
		if ($this->status === AppointmentStatus::Confirmed) {
			throw new DomainException('Appointment is already confirmed.');
		}

		if (!$this->status->canTransitionTo(AppointmentStatus::Confirmed)) {
			throw new DomainException('Only pending appointments can be confirmed.');
		}
	}

	public function ensureCanBeStarted(): void
	{
		if ($this->status === AppointmentStatus::InProgress) {
			throw new DomainException('Appointment is already in progress.');
		}

		if (!$this->status->canTransitionTo(AppointmentStatus::InProgress)) {
			throw new DomainException('Only confirmed appointments can be started.');
		}

		if ($this->starts_at->isPast()) {
			throw new DomainException('Cannot start an appointment that has already passed.');
		}
	}

	public function ensureCanBeCompleted(): void
	{
		if ($this->status === AppointmentStatus::Completed) {
			throw new DomainException('Appointment is already completed.');
		}

		if (!$this->status->canTransitionTo(AppointmentStatus::Completed)) {
			throw new DomainException('Only in progress appointments can be completed.');
		}
	}

	public function ensureCanBeNoShow(): void
	{
		if ($this->status === AppointmentStatus::NoShow) {
			throw new DomainException('Appointment is marked to no show.');
		}

		if (!$this->status->canTransitionTo(AppointmentStatus::NoShow)) {
			throw new DomainException('Only confirmed appointments can be maked as no show.');
		}
	}

	public function ensureCanBeExpired(): void
	{
		if ($this->status === AppointmentStatus::Expired) {
			throw new DomainException('Appointment is already expired.');
		}

		if (!$this->status->canTransitionTo(AppointmentStatus::Expired)) {
			throw new DomainException('Only pending appointments can be expired.');
		}

		if ($this->ends_at->isFuture()) {
			throw new DomainException('Cannot mark future appointment as expired.');
		}
	}


	public function canBeExpired(): bool
	{
		return
			$this->status !== AppointmentStatus::Expired &&
			$this->status->canTransitionTo(AppointmentStatus::Expired) &&
			$this->ends_at->isPast();
	}

}
