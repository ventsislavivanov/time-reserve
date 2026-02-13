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
		'cancelled_by',
		'notes',
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

	public function isCompleted(): bool
	{
		return $this->status === 'completed';
	}
}
