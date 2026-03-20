<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperJobPosition
 */
class JobPosition extends Model
{
	protected $fillable = ['name', 'description'];
}
