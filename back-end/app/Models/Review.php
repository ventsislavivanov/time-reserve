<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Review extends Model
{
	protected $fillable = [
		'user_id',
		'service_id',
		'rating',
		'comment',
	];

	protected $casts = [
		'user_id' => 'integer',
		'service_id' => 'integer',
		'rating' => 'integer',
	];

	public function user(): BelongsTo
	{
		return $this->belongsTo(User::class);
	}

	public function service(): BelongsTo
	{
		return $this->belongsTo(Service::class);
	}
}
