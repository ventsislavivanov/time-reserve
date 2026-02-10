<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateUserRoleRequest;
use App\Http\Resources\User\UserResource;
use App\Models\User;
use OpenApi\Attributes as OA;

class UserManagementController extends Controller
{
	#[OA\Patch(
		path: '/api/staff/users/{id}/toggle-active',
		description: 'Toggles the is_active status of a user',
		summary: 'Toggle user active status',
		security: [['sanctum' => []]],
		tags: ['Users']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(response: 200, description: 'User active status toggled',
		content: new OA\JsonContent(ref: '#/components/schemas/UserResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'User not found')]
	public function toggleActive(User $user): UserResource
	{
		$this->authorize('toggleActive', $user);

		$user->update([
			'is_active' => ! $user->is_active,
		]);

		return new UserResource($user);
	}

	#[OA\Patch(
		path: '/api/staff/users/{id}/role',
		summary: 'Update user role',
		security: [['sanctum' => []]],
		tags: ['Users']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/UpdateUserRoleRequest')
	)]
	#[OA\Response(response: 200, description: 'User role updated',
		content: new OA\JsonContent(ref: '#/components/schemas/UserResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'User not found')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function updateRole(UpdateUserRoleRequest $request, User $user): UserResource
	{
		$this->authorize('updateRole', $user);

		$user->update([
			'role' => $request->role,
		]);

		return new UserResource($user);
	}
}
