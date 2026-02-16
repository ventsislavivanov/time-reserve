<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Worker\WorkerCollection;
use App\Http\Resources\Worker\WorkerResource;
use App\Models\User;

class WorkerController extends Controller
{
	/**
	 * All active workers with their services
	 */
	public function index(): WorkerCollection
	{
		$workers = User::where('role', 'worker')
			->where('is_active', true)
			->where('is_approved', true)
			->with([
				'services' => fn($q) => $q->where('is_active', true)
					->select('services.id', 'services.name', 'services.description', 'services.duration', 'services.price', 'services.category_id')
					->with('category:id,name'),
				'jobPosition:id,name'
			])
			->select(['id', 'name', 'job_position_id'])
			->get();

		return new WorkerCollection($workers);
	}

	/**
	 * A specific worker with his services
	 */
	public function show(User $worker): WorkerResource
	{
		$worker->load([
			'services' => fn($q) => $q->where('is_active', true),
			'jobPosition:id,name'
		]);

		return new WorkerResource($worker);
	}
}