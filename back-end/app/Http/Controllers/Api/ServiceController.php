<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ServiceRequest;
use App\Models\Service;
use Illuminate\Http\JsonResponse;
use OpenApi\Attributes as OA;

class ServiceController extends Controller
{

	#[OA\Get(
		path: '/api/services/active',
		description: 'Returns a list of all active services with their categories. Publicly accessible.',
		summary: 'Get all active services',
		tags: ['Services']
	)]
	#[OA\Response(
		response: 200,
		description: 'List of active services',
		content: new OA\JsonContent(
			type: 'array',
			items: new OA\Items(
				properties: [
					new OA\Property(property: 'id', type: 'integer', example: 1),
					new OA\Property(property: 'name', type: 'string', example: 'Haircut'),
					new OA\Property(property: 'description', type: 'string', example: 'Basic haircut service', nullable: true),
					new OA\Property(property: 'category_id', type: 'integer', example: 1),
					new OA\Property(property: 'duration', type: 'integer', example: 30),
					new OA\Property(property: 'price', type: 'number', format: 'float', example: 25.00),
					new OA\Property(property: 'is_active', type: 'boolean', example: true),
					new OA\Property(property: 'preparation_time', type: 'integer', example: 5),
					new OA\Property(property: 'cleanup_time', type: 'integer', example: 5),
					new OA\Property(
						property: 'category',
						properties: [
							new OA\Property(property: 'id', type: 'integer', example: 1),
							new OA\Property(property: 'name', type: 'string', example: 'Hair'),
						],
						type: 'object'
					),
					new OA\Property(property: 'created_at', type: 'string', format: 'date-time'),
					new OA\Property(property: 'updated_at', type: 'string', format: 'date-time'),
				]
			)
		)
	)]
	public function active()
	{
		return Service::where('is_active', true)
			->with('category')
			->get();
	}

	#[OA\Get(
		path: '/api/staff/services',
		description: 'Returns a list of all services. Admin only.',
		summary: 'Get all services',
		security: [['sanctum' => []]],
		tags: ['Services']
	)]
	#[OA\Response(
		response: 200,
		description: 'List of all services',
		content: new OA\JsonContent(
			type: 'array',
			items: new OA\Items(
				properties: [
					new OA\Property(property: 'id', type: 'integer', example: 1),
					new OA\Property(property: 'name', type: 'string', example: 'Haircut'),
					new OA\Property(property: 'description', type: 'string', example: 'Basic haircut service', nullable: true),
					new OA\Property(property: 'category_id', type: 'integer', example: 1),
					new OA\Property(property: 'duration', type: 'integer', example: 30),
					new OA\Property(property: 'price', type: 'number', format: 'float', example: 25.00),
					new OA\Property(property: 'is_active', type: 'boolean', example: true),
					new OA\Property(property: 'preparation_time', type: 'integer', example: 5),
					new OA\Property(property: 'cleanup_time', type: 'integer', example: 5),
					new OA\Property(property: 'created_at', type: 'string', format: 'date-time'),
					new OA\Property(property: 'updated_at', type: 'string', format: 'date-time'),
				]
			)
		)
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	public function index(): JsonResponse
	{
		$this->authorize('viewAny', Service::class);

		return response()->json(Service::all());
    }

	#[OA\Get(
		path: '/api/staff/services/{id}',
		summary: 'Get service by ID',
		security: [['sanctum' => []]],
		tags: ['Services']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(
		response: 200,
		description: 'Service details',
		content: new OA\JsonContent(
			properties: [
				new OA\Property(property: 'id', type: 'integer', example: 1),
				new OA\Property(property: 'name', type: 'string', example: 'Haircut'),
				new OA\Property(property: 'description', type: 'string', example: 'Basic haircut service', nullable: true),
				new OA\Property(property: 'category_id', type: 'integer', example: 1),
				new OA\Property(property: 'duration', type: 'integer', example: 30),
				new OA\Property(property: 'price', type: 'number', format: 'float', example: 25.00),
				new OA\Property(property: 'is_active', type: 'boolean', example: true),
				new OA\Property(property: 'preparation_time', type: 'integer', example: 5),
				new OA\Property(property: 'cleanup_time', type: 'integer', example: 5),
				new OA\Property(property: 'created_at', type: 'string', format: 'date-time'),
				new OA\Property(property: 'updated_at', type: 'string', format: 'date-time'),
			]
		)
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Service not found')]
	public function show(Service $service): JsonResponse
	{
		$this->authorize('view', Service::class);

		return response()->json($service);
	}

	#[OA\Post(
		path: '/api/staff/services',
		summary: 'Create a new service',
		security: [['sanctum' => []]],
		tags: ['Services']
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/ServiceRequest')
	)]
	#[OA\Response(response: 201, description: 'Service created')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function store(ServiceRequest $request): JsonResponse
	{
		$this->authorize('create', Service::class);

        $service = Service::create($request->validated());

        return response()->json($service, 201);
    }

	#[OA\Put(
		path: '/api/staff/services/{id}',
		summary: 'Update a service',
		security: [['sanctum' => []]],
		tags: ['Services']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/ServiceRequest')
	)]
	#[OA\Response(response: 200, description: 'Service updated')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Service not found')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function update(ServiceRequest $request, Service $service): JsonResponse
	{
		$this->authorize('update', Service::class);

		$service->update($request->validated());

		return response()->json($service);
	}

	#[OA\Delete(
		path: '/api/staff/services/{id}',
		summary: 'Delete a service',
		security: [['sanctum' => []]],
		tags: ['Services']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(response: 204, description: 'Service deleted')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Service not found')]
	public function destroy(Service $service): JsonResponse
	{
		$this->authorize('delete', Service::class);

		$service->delete();

		return response()->json(null, 204);
	}

}
