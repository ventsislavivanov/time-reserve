<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens,  Notifiable, HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
		'email_verified_at',
        'password',
		'phone',
        'gender',
        'birth_date',
        'role',
        'is_approved',
		'is_active',
		'job_position_id',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
			'is_approved' => 'boolean',
			'is_active' => 'boolean',
        ];
    }

	/* ---------- RELATIONS ---------- */

	public function appointments()
	{
		return $this->hasMany(Appointment::class, 'client_id');
	}

	public function workerAppointments()
	{
		return $this->hasMany(Appointment::class, 'worker_id');
	}

	/* ---------- HELPERS ---------- */

	public function isAdmin(): bool
	{
		return $this->role === 'admin';
	}

	public function isWorker(): bool
	{
		return $this->role === 'worker';
	}

	public function isClient(): bool
	{
		return $this->role === 'client';
	}

	public function jobPosition(): BelongsTo
	{
		return $this->belongsTo(JobPosition::class);
	}

	public function services(): BelongsToMany
	{
		return $this->belongsToMany(Service::class, 'worker_service', 'user_id', 'service_id');
	}
}
