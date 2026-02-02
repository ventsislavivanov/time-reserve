<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\JobPositionController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\Admin\UserController as AdminUserController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [AuthController::class, 'registerClient']);
Route::post('/login', [AuthController::class, 'login']);

Route::get('/email/verify/{id}/{hash}', [AuthController::class, 'verifyEmail'])
    ->middleware(['signed'])
    ->name('verification.verify');

Route::middleware('auth:sanctum')->group(function () {
	Route::post('/logout', [AuthController::class, 'logout']);
	Route::get('/me', fn (Request $r) => $r->user());
});

Route::middleware(['auth:sanctum', 'role:admin'])->prefix('staff')->group(function () {
	Route::get('/users', [UserController::class, 'index']);
	Route::post('/users', [UserController::class, 'store']);
	Route::put('/users/{user}', [UserController::class, 'update']);

	Route::patch('/users/{user}/toggle-active', [AdminUserController::class, 'toggleActive']);

	Route::get('/users/{user}/services', [UserController::class, 'services']);
	Route::post('/users/{user}/services', [UserController::class, 'syncServices']);

	Route::apiResource('job-positions', JobPositionController::class);

	Route::apiResource('categories', CategoryController::class);

	Route::apiResource('services', ServiceController::class);
});
