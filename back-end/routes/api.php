<?php

use App\Http\Controllers\Api\AppointmentController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\JobPositionController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Controllers\Api\WorkerAppointmentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [AuthController::class, 'registerClient']);
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

Route::middleware(['auth:sanctum', 'role:admin'])->prefix('staff')->group(function () {
	Route::get('/users', [AuthController::class, 'getAllUsers']);
	Route::post('/users', [AuthController::class, 'createUser']);
	Route::put('/users/{id}', [AuthController::class, 'updateUser']);
	Route::patch('/users/{id}/toggle-active', [AuthController::class, 'toggleActive']);

	Route::apiResource('job-positions', JobPositionController::class);
	Route::get('/services', [ServiceController::class, 'index']);
	Route::post('/services', [ServiceController::class, 'store']);

	Route::get('/users/{id}/services', [AuthController::class, 'getUserServices']);
	Route::post('/users/{id}/services', [AuthController::class, 'syncUserServices']);
});

Route::get('/email/verify/{id}/{hash}', [AuthController::class, 'verifyEmail'])
	->middleware(['signed'])
	->name('verification.verify');