<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\SyncUserServicesRequest;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use OpenApi\Attributes as OA;

class UserServiceController extends Controller
{
	#[OA\Get(
		path: '/api/staff/users/{id}/services',
		summary: 'Get services assigned to a user',
		security: [['sanctum' => []]],
		tags: ['Users']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(
		response: 200,
		description: 'List of user services',
		content: new OA\JsonContent(
			type: 'array',
			items: new OA\Items(ref: '#/components/schemas/UserResource')
		)
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'User not found')]
	public function index(User $user): JsonResponse
	{
		return response()->json($user->services);
	}

	#[OA\Post(
		path: '/api/staff/users/{id}/services',
		description: 'Replaces all existing service assignments with the provided list',
		summary: 'Sync services assigned to a user',
		security: [['sanctum' => []]],
		tags: ['Users']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/SyncUserServicesRequest')
	)]
	#[OA\Response(
		response: 200,
		description: 'Services synced successfully',
		content: new OA\JsonContent(
			type: 'array',
			items: new OA\Items(ref: '#/components/schemas/UserResource')
		)
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'User not found')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function syncServices(SyncUserServicesRequest $request, User $user): JsonResponse
	{
		$this->authorize('syncServices', $user);

		$user->services()->sync($request->service_ids);

		return response()->json($user->fresh()->services);
	}
}
