<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BusinessHours extends Model
{
	protected $fillable = [
		'day_of_week',
		'start_time',
		'end_time',
		'is_working',
	];

	protected $casts = [
		'day_of_week' => 'integer',
		'is_working' => 'boolean',
	];

	public function scopeWorking($query)
	{
		return $query->where('is_working', true);
	}

	public function scopeForDay($query, int $dayOfWeek)
	{
		return $query->where('day_of_week', $dayOfWeek);
	}
}
