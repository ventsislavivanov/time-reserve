<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;

class MeController extends Controller
{
	#[OA\Post(
		path: '/api/me',
		summary: 'Get authenticated user',
		tags: ['Auth']
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(
			required: ['email', 'password', 'guard'],
			properties: [
				new OA\Property(property: 'email', type: 'string', example: 'admin@test.com'),
				new OA\Property(property: 'password', type: 'string', example: 'password'),
				new OA\Property(property: 'guard', type: 'string', example: 'staff'),
				new OA\Property(property: 'remember', type: 'boolean', example: 'false'),
			]
		)
	)]
	#[OA\Response(
		response: 200,
		description: 'Authenticated user',
		content: new OA\JsonContent(
			properties: [
				new OA\Property(property: 'user', ref: '#/components/schemas/UserAuth')
			]
		)
	)]
	#[OA\Response(response: 401, description: 'Unauthenticated')]
	public function __invoke(Request $request)
	{
		// this method is NOT actualy USED
	}
}
