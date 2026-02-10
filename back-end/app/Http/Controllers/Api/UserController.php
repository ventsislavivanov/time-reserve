<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Resources\User\UserListResource;
use App\Http\Resources\User\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;

class UserController extends Controller
{
	#[OA\Get(
		path: '/api/staff/users',
		summary: 'Get all users',
		security: [['sanctum' => []]],
		tags: ['Users']
	)]
	#[OA\Parameter(name: 'role', in: 'query', required: false,
		schema: new OA\Schema(type: 'string', enum: ['admin', 'worker', 'client'])
	)]
	#[OA\Parameter(name: 'gender', in: 'query', required: false,
		schema: new OA\Schema(type: 'string', enum: ['male', 'female', 'other'])
	)]
	#[OA\Parameter(name: 'search', in: 'query', required: false,
		schema: new OA\Schema(type: 'string', example: 'John')
	)]
	#[OA\Parameter(name: 'limit', in: 'query', required: false,
		schema: new OA\Schema(type: 'integer', example: 10)
	)]
	#[OA\Response(
		response: 200,
		description: 'Paginated list of users',
		content: new OA\JsonContent(
			properties: [
				new OA\Property(property: 'data', type: 'array',
					items: new OA\Items(
						properties: [
							new OA\Property(property: 'id', type: 'integer', example: 1),
							new OA\Property(property: 'name', type: 'string', example: 'John Doe'),
							new OA\Property(property: 'email', type: 'string', example: 'john@example.com'),
							new OA\Property(property: 'phone', type: 'string', example: '+359888123456'),
							new OA\Property(property: 'gender', type: 'string', example: 'male'),
							new OA\Property(property: 'birth_date', type: 'string', format: 'date', example: '1990-01-15'),
							new OA\Property(property: 'role', type: 'string', example: 'worker'),
							new OA\Property(property: 'is_active', type: 'boolean', example: true),
							new OA\Property(property: 'is_approved', type: 'boolean', example: true),
							new OA\Property(property: 'email_verified', type: 'boolean', example: true),
							new OA\Property(property: 'job_position_id', type: 'integer', example: 1, nullable: true),
						]
					)
				),
				new OA\Property(property: 'meta', properties: [
					new OA\Property(property: 'current_page', type: 'integer', example: 1),
					new OA\Property(property: 'last_page', type: 'integer', example: 5),
					new OA\Property(property: 'per_page', type: 'integer', example: 10),
					new OA\Property(property: 'total', type: 'integer', example: 50),
				],
					type: 'object'
				),
			]
		)
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	public function index(Request $request)
	{
		$this->authorize('viewAny', User::class);

		$users = User::query()
			->role($request->query('role'))
			->gender($request->query('gender'))
			->search($request->query('search'))
			->paginate($request->query('limit', 10));

		return UserListResource::collection($users);
	}

	#[OA\Post(
		path: '/api/staff/users',
		summary: 'Create a new user',
		security: [['sanctum' => []]],
		tags: ['Users']
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/CreateUserRequest')
	)]
	#[OA\Response(
		response: 200,
		description: 'User created',
		content: new OA\JsonContent(ref: '#/components/schemas/UserResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function store(CreateUserRequest $request): UserResource
	{
		$this->authorize('create', User::class);

		$user = User::create([
			...$request->validated(),
			'email_verified_at' => now(),
			'is_approved' 		=> true,
		]);

		return new UserResource($user);
	}

	#[OA\Put(
		path: '/api/staff/users/{id}',
		summary: 'Update a user',
		security: [['sanctum' => []]],
		tags: ['Users']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/UpdateUserRequest')
	)]
	#[OA\Response(
		response: 200,
		description: 'User updated',
		content: new OA\JsonContent(ref: '#/components/schemas/UserResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'User not found')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function update(UpdateUserRequest $request, User $user): UserResource
	{
		$this->authorize('update', $user);

		$data = array_filter(
			$request->validated(),
			fn ($v) => !is_null($v)
		);

		$user->update($data);

		return new UserResource($user);
	}
}
