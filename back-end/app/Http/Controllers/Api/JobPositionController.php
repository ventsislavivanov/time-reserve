<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\JobPositionRequest;
use App\Models\JobPosition;
use Illuminate\Http\JsonResponse;
use OpenApi\Attributes as OA;

class JobPositionController extends Controller
{
	#[OA\Get(
		path: '/api/staff/job-positions',
		summary: 'Get all job positions',
		security: [['sanctum' => []]],
		tags: ['Job Positions']
	)]
	#[OA\Response(
		response: 200,
		description: 'List of job positions',
		content: new OA\JsonContent(
			type: 'array',
			items: new OA\Items(
				properties: [
					new OA\Property(property: 'id', type: 'integer', example: 1),
					new OA\Property(property: 'name', type: 'string', example: 'Hair Stylist'),
					new OA\Property(property: 'description', type: 'string', example: 'Responsible for hair styling and cutting', nullable: true),
					new OA\Property(property: 'created_at', type: 'string', format: 'date-time'),
					new OA\Property(property: 'updated_at', type: 'string', format: 'date-time'),
				]
			)
		)
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	public function index(): JsonResponse
	{
		$this->authorize('viewAny', JobPosition::class);

        return response()->json(JobPosition::all());
    }

	#[OA\Get(
		path: '/api/staff/job-positions/{id}',
		summary: 'Get job position by ID',
		security: [['sanctum' => []]],
		tags: ['Job Positions']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(
		response: 200,
		description: 'Job position details',
		content: new OA\JsonContent(
			properties: [
				new OA\Property(property: 'id', type: 'integer', example: 1),
				new OA\Property(property: 'name', type: 'string', example: 'Hair Stylist'),
				new OA\Property(property: 'description', type: 'string', example: 'Responsible for hair styling and cutting', nullable: true),
				new OA\Property(property: 'created_at', type: 'string', format: 'date-time'),
				new OA\Property(property: 'updated_at', type: 'string', format: 'date-time'),
			]
		)
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Job position not found')]
	public function show(JobPosition $jobPosition): JsonResponse
	{
		$this->authorize('view', JobPosition::class);

		return response()->json($jobPosition);
	}

	#[OA\Post(
		path: '/api/staff/job-positions',
		summary: 'Create a new job position',
		security: [['sanctum' => []]],
		tags: ['Job Positions']
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/JobPositionRequest')
	)]
	#[OA\Response(response: 201, description: 'Job position created')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function store(JobPositionRequest $request): JsonResponse
	{
		$this->authorize('create', JobPosition::class);

		$jobPosition = JobPosition::create($request->validated());

		return response()->json($jobPosition, 201);
    }

	#[OA\Put(
		path: '/api/staff/job-positions/{id}',
		summary: 'Update a job position',
		security: [['sanctum' => []]],
		tags: ['Job Positions']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/JobPositionRequest')
	)]
	#[OA\Response(response: 200, description: 'Job position updated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Job position not found')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function update(JobPositionRequest $request, JobPosition $jobPosition): JsonResponse
	{
		$this->authorize('update', JobPosition::class);

		$jobPosition->update($request->validated());

        return response()->json($jobPosition);
    }

	#[OA\Delete(
		path: '/api/staff/job-positions/{id}',
		summary: 'Delete a job position',
		security: [['sanctum' => []]],
		tags: ['Job Positions']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(response: 204, description: 'Job position deleted')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Job position not found')]
	public function destroy(JobPosition $jobPosition): JsonResponse
	{
		$this->authorize('delete', JobPosition::class);

		$jobPosition->delete();

        return response()->json(null, 204);
    }
}
