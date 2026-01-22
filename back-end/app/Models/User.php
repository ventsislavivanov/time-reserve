<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens,  Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
		'phone',
        'gender',
        'birth_date',
        'role',
        'is_approved',
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
        ];
    }

	/* ---------- RELATIONS ---------- */

	// Client → неговите записи
	public function appointments()
	{
		return $this->hasMany(Appointment::class, 'client_id');
	}

	// Worker → часовете му
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
}
