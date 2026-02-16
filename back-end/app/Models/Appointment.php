<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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

	public function isPending(): bool
	{
		return $this->status === 'pending';
	}

	public function isConfirmed(): bool
	{
		return $this->status === 'confirmed';
	}

	public function isCancelled(): bool
	{
		return $this->status === 'cancelled';
	}

	public function isRejected(): bool
	{
		return $this->status === 'rejected';
	}

	public function isDeclined(): bool
	{
		return $this->status === 'declined';
	}

	public function isCompleted(): bool
	{
		return $this->status === 'completed';
	}

	public function isNoShow(): bool
	{
		return $this->status === 'no_show';
	}

	public function changeStatus(string $status, ?string $reason = null): self
	{
		$this->update([
			'status' => $status,
			'reason' => $reason,
		]);

		return $this;
	}
}
