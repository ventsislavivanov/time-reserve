<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\JobController;
use App\Http\Controllers\Api\ServiceController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [AuthController::class, 'registerClient']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
	Route::post('/logout', [AuthController::class, 'logout']);
	Route::get('/me', fn (Request $r) => $r->user());
});

Route::middleware(['auth:sanctum', 'role:admin'])->prefix('staff')->group(function () {
	Route::get('/users', [AuthController::class, 'getAllUsers']);
	Route::post('/users', [AuthController::class, 'createUser']);
	Route::put('/users/{user}', [AuthController::class, 'updateUser']);
	Route::patch('/users/{user}/toggle-active', [AuthController::class, 'toggleActive']);

	Route::apiResource('jobs', JobController::class);

	Route::apiResource('services', ServiceController::class)
		->only(['index', 'store']);

	Route::get('/users/{user}/services', [AuthController::class, 'getUserServices']);
	Route::post('/users/{user}/services', [AuthController::class, 'syncUserServices']);
});

Route::get('/email/verify/{id}/{hash}', [AuthController::class, 'verifyEmail'])
	->middleware(['signed'])
	->name('verification.verify');