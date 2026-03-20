<?php

// @formatter:off
// phpcs:ignoreFile
/**
 * A helper file for your Eloquent Models
 * Copy the phpDocs from this file to the correct Model,
 * And remove them from this file, to prevent double declarations.
 *
 * @author Barry vd. Heuvel <barryvdh@gmail.com>
 */


namespace App\Models{
/**
 * @property int $id
 * @property int $service_id
 * @property int $worker_id
 * @property int|null $client_id
 * @property \Illuminate\Support\Carbon $starts_at
 * @property \Illuminate\Support\Carbon $ends_at
 * @property \App\AppointmentStatus $status
 * @property int|null $changed_by
 * @property string|null $notes
 * @property string|null $reason
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\User|null $changedBy
 * @property-read \App\Models\User|null $client
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\AppointmentHistory> $history
 * @property-read int|null $history_count
 * @property-read \App\Models\Service $service
 * @property-read \App\Models\User $worker
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment active()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment confirmed()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment forDate(string $date)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment forWorker(int $workerId)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment pending()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereChangedBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereClientId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereEndsAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereNotes($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereReason($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereServiceId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereStartsAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Appointment whereWorkerId($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperAppointment {}
}

namespace App\Models{
/**
 * @property int $id
 * @property int $appointment_id
 * @property string|null $old_status
 * @property string $new_status
 * @property int|null $changed_by
 * @property string|null $reason
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Appointment $appointment
 * @property-read \App\Models\User|null $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory whereAppointmentId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory whereChangedBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory whereNewStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory whereOldStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory whereReason($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AppointmentHistory whereUpdatedAt($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperAppointmentHistory {}
}

namespace App\Models{
/**
 * @property int $id
 * @property int $day_of_week
 * @property string $start_time
 * @property string $end_time
 * @property bool $is_working
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours forDay(int $dayOfWeek)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours whereDayOfWeek($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours whereEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours whereIsWorking($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours whereStartTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BusinessHours working()
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperBusinessHours {}
}

namespace App\Models{
/**
 * @property int $id
 * @property string $name
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Service> $services
 * @property-read int|null $services_count
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereUpdatedAt($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperCategory {}
}

namespace App\Models{
/**
 * @property int $id
 * @property string $name
 * @property string $description
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder<static>|JobPosition newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|JobPosition newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|JobPosition query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|JobPosition whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|JobPosition whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|JobPosition whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|JobPosition whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|JobPosition whereUpdatedAt($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperJobPosition {}
}

namespace App\Models{
/**
 * @property int $id
 * @property string $name
 * @property string|null $description
 * @property int|null $category_id
 * @property int $duration
 * @property float $price
 * @property bool $is_active
 * @property string|null $image
 * @property int $preparation_time
 * @property int $cleanup_time
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Category|null $category
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\User> $workers
 * @property-read int|null $workers_count
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereCategoryId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereCleanupTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereDuration($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereImage($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereIsActive($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service wherePreparationTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service wherePrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Service whereUpdatedAt($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperService {}
}

namespace App\Models{
/**
 * @property int $id
 * @property string $name
 * @property string $email
 * @property \Illuminate\Support\Carbon|null $email_verified_at
 * @property string $password
 * @property string|null $remember_token
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property string|null $phone
 * @property string|null $gender
 * @property \Illuminate\Support\Carbon|null $birth_date
 * @property string $role
 * @property bool $is_approved
 * @property bool $is_active
 * @property int|null $job_position_id
 * @property bool|null $can_book_appointments
 * @property int $no_show_count
 * @property int $no_show_total_count
 * @property int $cancelled_count
 * @property int $completed_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Appointment> $appointments
 * @property-read int|null $appointments_count
 * @property-read bool $is_verified
 * @property-read string $status
 * @property-read \App\Models\JobPosition|null $jobPosition
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection<int, \Illuminate\Notifications\DatabaseNotification> $notifications
 * @property-read int|null $notifications_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Service> $services
 * @property-read int|null $services_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Laravel\Sanctum\PersonalAccessToken> $tokens
 * @property-read int|null $tokens_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Appointment> $workerAppointments
 * @property-read int|null $worker_appointments_count
 * @method static \Database\Factories\UserFactory factory($count = null, $state = [])
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User gender($gender)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User role($role)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User search($search)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereBirthDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereCanBookAppointments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereCancelledCount($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereCompletedCount($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereEmailVerifiedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereGender($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereIsActive($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereIsApproved($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereJobPositionId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereNoShowCount($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereNoShowTotalCount($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User wherePassword($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User wherePhone($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereRememberToken($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereRole($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereUpdatedAt($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperUser {}
}

