<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Service extends Model
{
	protected $fillable = [
		'name',
		'description',
		'category_id',
		'duration',
		'price',
		'is_active',
		'image',
		'preparation_time',
		'cleanup_time',
	];

	protected $casts = [
		'category_id' => 'integer',
		'duration' => 'integer',
		'price' => 'float',
		'is_active' => 'boolean',
		'preparation_time' => 'integer',
		'cleanup_time' => 'integer',
	];

//	public function appointments()
//	{
//		return $this->hasMany(Appointment::class);
//	}

	public function workers(): BelongsToMany
	{
		return $this->belongsToMany(User::class, 'worker_service', 'service_id', 'user_id');
	}

	public function category(): BelongsTo
	{
		return $this->belongsTo(Category::class);
	}
}
