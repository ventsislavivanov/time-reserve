<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Service extends Model
{
	protected $fillable = [
		'name',
		'duration_minutes',
		'description',
		'is_active',
	];

	protected $casts = [
		'duration_minutes' => 'integer',
		'is_active' => 'boolean',
	];

	public function appointments()
	{
		return $this->hasMany(Appointment::class);
	}

	public function workers(): BelongsToMany
	{
		return $this->belongsToMany(User::class, 'worker_service', 'service_id', 'user_id');
	}
}
