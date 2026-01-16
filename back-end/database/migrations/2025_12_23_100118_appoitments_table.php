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
		Schema::create('appointments', function (Blueprint $table) {
			$table->id();

			$table->foreignId('service_id')->constrained()->cascadeOnDelete();
			$table->foreignId('worker_id')->constrained('users')->cascadeOnDelete();
			$table->foreignId('client_id')->nullable()->constrained('users')->nullOnDelete();

			$table->date('date');
			$table->dateTime('start_time');
			$table->dateTime('end_time');

			$table->enum('status', ['pending', 'approved', 'rejected', 'cancelled'])
				->default('pending');

			$table->timestamps();

			$table->unique([
				'worker_id',
				'date',
				'start_time'
			]);
		});

	}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('appoitments');
    }
};
