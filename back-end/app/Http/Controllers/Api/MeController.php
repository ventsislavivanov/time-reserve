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
		content: new OA\JsonContent(ref: '#/components/schemas/LoginRequest')
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
	public function __invoke(Request $request): void
	{
		// this method is NOT actualy USED
	}
}
