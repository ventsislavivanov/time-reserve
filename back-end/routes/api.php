<?php

use App\Http\Controllers\Api\AppointmentController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AvailabilityController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\JobPositionController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\UserManagementController;
use App\Http\Controllers\Api\UserServiceController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [AuthController::class, 'registerClient']);
Route::post('/login', [AuthController::class, 'login']);

Route::get('categories', [CategoryController::class, 'index']);
Route::get('services/active', [ServiceController::class, 'active']);

Route::get('/email/verify/{id}/{hash}', [AuthController::class, 'verifyEmail'])
    ->middleware(['signed'])
    ->name('verification.verify');

Route::get('availability/slots', [AvailabilityController::class, 'getSlots']);

Route::middleware('auth:sanctum')->group(function () {
	Route::post('/logout', [AuthController::class, 'logout']);
	Route::get('/me', fn (Request $r) => $r->user());

	Route::get('appointments', [AppointmentController::class, 'index']);
	Route::post('appointments', [AppointmentController::class, 'store']);
	Route::patch('appointments/{appointment}/cancel', [AppointmentController::class, 'cancel']);
});

Route::middleware(['auth:sanctum', 'role:admin'])->prefix('staff')->group(function () {
	Route::apiResource('users', UserController::class)
		->only(['index', 'store', 'update']);

	Route::prefix('users/{user}')->group(function() {
		Route::get('services', [UserServiceController::class, 'index']);
		Route::post('services', [UserServiceController::class, 'syncServices']);

		Route::patch('toggle-active', [UserManagementController::class, 'toggleActive']);
		Route::patch('role', [UserManagementController::class, 'updateRole']);
		Route::patch('users/{user}/can-book-appointments', [UserManagementController::class, 'toggleCanBookAppointments']);
	});

	Route::apiResource('job-positions', JobPositionController::class);

	Route::apiResource('categories', CategoryController::class)
		->except(['index']);

	Route::apiResource('services', ServiceController::class);
});

Route::middleware(['auth:sanctum', 'role:admin,worker'])->prefix('staff')->group(function () {
	Route::get('appointments', [AppointmentController::class, 'staffIndex']);
	Route::patch('appointments/{appointment}/confirm', [AppointmentController::class, 'confirm']);
	Route::patch('appointments/{appointment}/reject', [AppointmentController::class, 'reject']);
	Route::patch('appointments/{appointment}/decline', [AppointmentController::class, 'decline']);
	Route::patch('appointments/{appointment}/complete', [AppointmentController::class, 'complete']);
});
