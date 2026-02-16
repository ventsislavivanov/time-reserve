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
			$table->integer('no_show_count')->default(0)->after('can_book_appointments');
			$table->integer('no_show_total_count')->default(0);
			$table->integer('cancelled_count')->default(0);
			$table->integer('completed_count')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['no_show_count', 'no_show_total_count', 'cancelled_count', 'completed_count']);
        });
    }
};
