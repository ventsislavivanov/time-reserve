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
		Schema::table('worker_service', function (Blueprint $table) {
			$table->decimal('price_override', 8, 2)
				->nullable()
				->after('service_id');

			$table->integer('duration_override')
				->nullable()
				->after('price_override');
		});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
		Schema::table('worker_service', function (Blueprint $table) {
			$table->dropColumn('price_override');
			$table->dropColumn('duration_override');
		});
    }
};
