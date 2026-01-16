<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
		Schema::table('users', function (Blueprint $table) {
			$table->string('phone')
				->nullable()
				->after('password');

			$table->enum('gender', ['male', 'female', 'other'])
				->nullable()
				->after('phone');

			$table->date('birth_date')
				->nullable()
				->after('gender');

			$table->enum('role', ['admin', 'worker', 'client'])
				->default('client')
				->after('birth_date');

			$table->boolean('is_approved')
				->default(false)
				->after('role');
		});

	}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
			$table->dropColumn([
				'phone',
				'gender',
				'birth_date',
				'role',
				'is_approved',
			]);
        });
    }
};
