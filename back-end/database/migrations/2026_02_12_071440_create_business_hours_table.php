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
		Schema::create('business_hours', function (Blueprint $table) {
			$table->id();
			$table->tinyInteger('day_of_week'); // 0=Пон, 6=Нед
			$table->time('start_time');
			$table->time('end_time');
			$table->boolean('is_working')->default(true);
			$table->timestamps();

			$table->unique('day_of_week');
		});
	}

	public function down(): void
	{
		Schema::dropIfExists('business_hours');
	}
};
