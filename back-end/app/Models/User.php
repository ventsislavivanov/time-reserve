<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens,  Notifiable, HasFactory;

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

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
			'is_approved' => 'boolean',
			'is_active' => 'boolean',
			'birth_date' => 'date',
			'job_position_id' => 'integer',
        ];
    }

	// ───── Relationships ─────

	public function appointments(): HasMany
	{
		return $this->hasMany(Appointment::class, 'client_id');
	}

	public function workerAppointments(): HasMany
	{
		return $this->hasMany(Appointment::class, 'worker_id');
	}

	public function jobPosition(): BelongsTo
	{
		return $this->belongsTo(JobPosition::class);
	}

	public function services(): BelongsToMany
	{
		return $this->belongsToMany(
			Service::class,
			'worker_service',
			'user_id',
			'service_id'
		);
	}

	// ───── Helpers ─────

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

	public function isStaff(): bool
	{
		return in_array($this->role, ['admin', 'worker'], true);
	}

	public function isApproved(): bool
	{
		return (bool) $this->is_approved;
	}

	public function canLogin(): bool
	{
		if (!$this->is_active) {
			return false;
		}

		if (is_null($this->email_verified_at)) {
			return false;
		}

		return true;
	}

	public function canBeAssigned(): bool
	{
		return $this->is_active && $this->is_approved;
	}

	// ───── Scopes ─────
	public function scopeRole($query, $role)
	{
		return $query->when($role, fn ($q) => $q->where('role', $role));
	}

	public function scopeGender($query, $gender)
	{
		return $query->when($gender, fn ($q) => $q->where('gender', $gender));
	}

	public function scopeSearch($query, $search)
	{
		return $query->when($search, function ($q) use ($search) {
			$q->where('name', 'like', "%$search%")
				->orWhere('email', 'like', "%$search%")
				->orWhere('phone', 'like', "%$search%");
		});
	}

	// ───── Accessors ─────
	public function getIsVerifiedAttribute(): bool
	{
		return !is_null($this->email_verified_at);
	}

	public function getStatusAttribute(): string
	{
		if (!$this->is_active) {
			return 'inactive';
		}

		if (!$this->email_verified_at) {
			return 'unverified';
		}

		if (!$this->is_approved) {
			return 'pending';
		}

		return 'active';
	}

	public function canBookAppointments(): bool
	{
		return $this->role === 'client' && $this->can_book_appointments;
	}
}
