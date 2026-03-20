<?php

namespace Tests\Unit;

use App\AppointmentStatus;
use Tests\TestCase;

class AppointmentStatusTest extends TestCase
{
	public function test_pending_transitions()
	{
		$status = AppointmentStatus::Pending;

		$this->assertTrue($status->canTransitionTo(AppointmentStatus::Confirmed));
		$this->assertTrue($status->canTransitionTo(AppointmentStatus::Cancelled));
		$this->assertTrue($status->canTransitionTo(AppointmentStatus::Declined));
		$this->assertTrue($status->canTransitionTo(AppointmentStatus::Expired));

		$this->assertFalse($status->canTransitionTo(AppointmentStatus::InProgress));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Completed));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::NoShow));
	}

	public function test_confirmed_transitions()
	{
		$status = AppointmentStatus::Confirmed;

		$this->assertTrue($status->canTransitionTo(AppointmentStatus::Cancelled));
		$this->assertTrue($status->canTransitionTo(AppointmentStatus::Declined));
		$this->assertTrue($status->canTransitionTo(AppointmentStatus::InProgress));
		$this->assertTrue($status->canTransitionTo(AppointmentStatus::NoShow));

		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Pending));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Completed));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Expired));
	}

	public function test_in_progress_transitions()
	{
		$status = AppointmentStatus::InProgress;

		$this->assertTrue($status->canTransitionTo(AppointmentStatus::Completed));

		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Pending));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Cancelled));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Declined));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Confirmed));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::NoShow));
		$this->assertFalse($status->canTransitionTo(AppointmentStatus::Expired));
	}

	public function test_final_statuses_cannot_transition()
	{
		foreach ([
					 AppointmentStatus::Cancelled,
					 AppointmentStatus::Declined,
					 AppointmentStatus::Completed,
					 AppointmentStatus::NoShow,
					 AppointmentStatus::Expired,
				 ] as $status) {
			$this->assertFalse($status->canTransitionTo(AppointmentStatus::Pending));
			$this->assertFalse($status->canTransitionTo(AppointmentStatus::Confirmed));
			$this->assertFalse($status->canTransitionTo(AppointmentStatus::InProgress));
			$this->assertFalse($status->canTransitionTo(AppointmentStatus::Completed));
			$this->assertFalse($status->canTransitionTo(AppointmentStatus::NoShow));
			$this->assertFalse($status->canTransitionTo(AppointmentStatus::Expired));
		}
	}
}
