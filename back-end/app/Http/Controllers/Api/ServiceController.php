<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ServiceRequest;
use App\Http\Resources\Service\ServiceCollection;
use App\Http\Resources\Service\ServiceResource;
use App\Models\Service;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
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
		content: new OA\JsonContent(ref: '#/components/schemas/ServiceCollection')
	)]
	public function active(Request $request): ServiceCollection
	{
		$items = Service::query()
			->where('is_active', true)
			->with('category')
			->paginate($request->query('limit', Service::count()));

		return new ServiceCollection($items);
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
		content: new OA\JsonContent(ref: '#/components/schemas/ServiceCollection')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	public function index(Request $request): ServiceCollection
	{
		$this->authorize('viewAny', Service::class);

		$limit = $request->get('limit', Service::count());
		$items = Service::query()
			->paginate($request->query('limit', $limit));

		return new ServiceCollection($items);
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
	#[OA\Response(response: 201, description: 'Service created',
		content: new OA\JsonContent(ref: '#/components/schemas/ServiceResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function store(ServiceRequest $request): ServiceResource
	{
		$this->authorize('create', Service::class);

        $service = Service::create($request->validated());

        return new ServiceResource($service);
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
	#[OA\Response(response: 200, description: 'Service details',
		content: new OA\JsonContent(ref: '#/components/schemas/ServiceResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Service not found')]
	public function show(Service $service): ServiceResource
	{
		$this->authorize('view', Service::class);

		return new ServiceResource($service);
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
	#[OA\Response(response: 200, description: 'Service updated',
		content: new OA\JsonContent(ref: '#/components/schemas/ServiceResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Service not found')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function update(ServiceRequest $request, Service $service): ServiceResource
	{
		$this->authorize('update', Service::class);

		$service->update($request->validated());

		return new ServiceResource($service);
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
