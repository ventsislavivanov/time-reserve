<?php

use App\Http\Controllers\Api\AppointmentController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\WorkerAppointmentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
	Route::post('/logout', [AuthController::class, 'logout']);

	Route::get('/me', function (Request $request) {
		return $request->user();
	});

	Route::post('/appointments', [AppointmentController::class, 'store']);

	Route::get('/my-appointments', [AppointmentController::class, 'myAppointments']);

	Route::get('/worker/appointments/pending', [WorkerAppointmentController::class, 'pending']);

	Route::post('/appointments/{appointment}/approve', [WorkerAppointmentController::class, 'approve']);

	Route::post('/appointments', [BookingController::class, 'book']);
	Route::post('/appointments/{appointment}/approve', [BookingController::class, 'approve']);
	Route::post('/appointments/{appointment}/reject', [BookingController::class, 'reject']);
});

Route::get('/appointments/worker/{workerId}', [BookingController::class, 'workerAppointments']);

Route::middleware(['auth:sanctum', 'role:admin,worker'])->prefix('staff')->group(function () {
	Route::get('/dashboard', function () {
		return response()->json(['message' => 'Welcome to staff dashboard']);
	});

	Route::get('/worker/appointments/pending', [WorkerAppointmentController::class, 'pending']);
	Route::post('/appointments/{appointment}/approve', [WorkerAppointmentController::class, 'approve']);
});