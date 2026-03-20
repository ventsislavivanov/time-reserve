<?php

namespace App;

enum AppointmentStatus: string
{
	case Pending = 'pending';
	case Cancelled = 'cancelled';
	case Declined = 'declined';
	case Confirmed = 'confirmed';
	case InProgress = 'in_progress';
	case Completed = 'completed';
	case NoShow = 'no_show';
	case Expired = 'expired';

	public function canTransitionTo(self $new): bool
	{
		return match ($this) {
			self::Pending => in_array($new, [
				self::Confirmed,
				self::Cancelled,
				self::Declined,
				self::Expired,
			]),

			self::Confirmed => in_array($new, [
				self::Cancelled,
				self::Declined,
				self::InProgress,
				self::NoShow,
			]),

			self::InProgress => $new === self::Completed,

			default => false,
		};
	}

}
