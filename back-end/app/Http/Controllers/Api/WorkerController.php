<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Worker\WorkerCollection;
use App\Http\Resources\Worker\WorkerResource;
use App\Models\User;
use OpenApi\Attributes as OA;

class WorkerController extends Controller
{
    #[OA\Get(
        path: '/api/workers',
        description: 'Returns a list of all active workers with their services and job positions.',
        summary: 'Get all active workers',
        tags: ['Workers']
    )]
    #[OA\Response(
        response: 200,
        description: 'Successful operation',
        content: new OA\JsonContent(ref: '#/components/schemas/WorkerCollection')
    )]
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

    #[OA\Get(
        path: '/api/workers/{id}',
        description: 'Returns detailed information about a specific worker.',
        summary: 'Get worker by ID',
        tags: ['Workers']
    )]
    #[OA\Parameter(
        name: 'id',
        description: 'ID of the worker',
        in: 'path',
        required: true,
        schema: new OA\Schema(type: 'integer')
    )]
    #[OA\Response(
        response: 200,
        description: 'Successful operation',
        content: new OA\JsonContent(ref: '#/components/schemas/WorkerResource')
    )]
    #[OA\Response(response: 404, description: 'Worker not found')]
	public function show(User $worker): WorkerResource
	{
		$worker->load([
			'services' => fn($q) => $q->where('is_active', true),
			'jobPosition:id,name'
		]);

		return new WorkerResource($worker);
	}
}
