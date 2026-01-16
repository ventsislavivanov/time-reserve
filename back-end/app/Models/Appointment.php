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
		'start_time',
		'end_time',
		'status',
		'date',
		'rejection_reason',
		'user_id',
		'starts_at',
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
}
