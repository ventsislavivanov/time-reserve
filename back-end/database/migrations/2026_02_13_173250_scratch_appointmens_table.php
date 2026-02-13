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
		Schema::dropIfExists('appointments');

		Schema::create('appointments', function (Blueprint $table) {
			$table->id();
			$table->foreignId('service_id')->constrained()->cascadeOnDelete();
			$table->foreignId('worker_id')->constrained('users')->cascadeOnDelete();
			$table->foreignId('client_id')->nullable()->constrained('users')->nullOnDelete();

			$table->dateTime('starts_at');
			$table->dateTime('ends_at');

			$table->enum('status', ['pending', 'confirmed', 'cancelled', 'rejected', 'declined', 'completed'])
				->default('pending');

			$table->foreignId('cancelled_by')->nullable()->constrained('users')->nullOnDelete();
			$table->text('notes')->nullable();

			$table->timestamps();

			$table->index(['worker_id', 'starts_at']);
			$table->index('client_id');
		});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
		Schema::dropIfExists('appointments');
    }
};
