<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @mixin IdeHelperAppointmentHistory
 */
class AppointmentHistory extends Model
{
	protected $table = 'appointment_history';

	protected $guarded = [];

	public function appointment(): BelongsTo
	{
		return $this->belongsTo(Appointment::class);
	}

	public function user(): BelongsTo
	{
		return $this->belongsTo(User::class, 'changed_by');
	}
}
