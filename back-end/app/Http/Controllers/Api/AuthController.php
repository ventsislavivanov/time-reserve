<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterClientRequest;
use App\Http\Resources\User\UserAuthResource;
use App\Models\User;
use App\Services\AuthService;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;

class AuthController extends Controller
{

	public function __construct(
		// auto-resolve
		protected AuthService $authService
	) {}

	#[OA\Post(
		path: '/api/login',
		summary: 'Login user',
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
		description: 'Successful login',
		content: new OA\JsonContent(
			properties: [
				new OA\Property(property: 'token', type: 'string'),
				new OA\Property(property: 'user', ref: '#/components/schemas/UserAuth')
			]
		)
	)]
	#[OA\Response(response: 401, description: 'Invalid credentials')]
	public function login(LoginRequest $request)
	{
		$result = $this->authService->login(
			email: $request->email,
			password: $request->password,
			guard: $request->guard,
			remember: $request->remember ?? false
		);

		return response()->json([
			'token' => $result['token'],
			'user' => new UserAuthResource($result['user']),
		]);
	}

	#[OA\Post(
		path: '/api/logout',
		description: 'Revokes the current access token and logs out the authenticated user',
		summary: 'Logout user',
		security: [['sanctum' => []]],
		tags: ['Auth']
	)]
	#[OA\Response(
		response: 200,
		description: 'Successfully logged out',
		content: new OA\JsonContent(
			properties: [
				new OA\Property(property: 'message', type: 'string', example: 'Logged out')
			]
		)
	)]
	#[OA\Response(
		response: 401,
		description: 'Unauthenticated - no valid token provided',
		content: new OA\JsonContent(
			properties: [
				new OA\Property(property: 'message', type: 'string', example: 'Unauthenticated.')
			]
		)
	)]
	public function logout(Request $request)
	{
		$request->user()->currentAccessToken()->delete();
		return response()->json(['message' => 'Logged out']);
	}

	public function registerClient(RegisterClientRequest  $request)
	{
		$user = User::create([
			...$request->validated(),
			'is_approved' => false,
		]);

		$user->sendEmailVerificationNotification();

		return response()->json([
			'message' => 'Please check your email for a confirmation link.'
		]);
	}

	#[OA\Get(
		path: '/api/email/verify/{id}/{hash}',
		description: 'Verifies user email using the link sent to their inbox',
		summary: 'Verify user email address',
		tags: ['Auth'],
		parameters: [
			new OA\Parameter(
				name: 'id',
				description: 'User ID',
				in: 'path',
				required: true,
				schema: new OA\Schema(type: 'integer', example: 1)
			),
			new OA\Parameter(
				name: 'hash',
				description: 'Verification hash',
				in: 'path',
				required: true,
				schema: new OA\Schema(type: 'string', example: 'abc123def456')
			),
			new OA\Parameter(
				name: 'expires',
				description: 'Expiration timestamp',
				in: 'query',
				required: false,
				schema: new OA\Schema(type: 'integer', example: 1640995200)
			),
			new OA\Parameter(
				name: 'signature',
				description: 'URL signature',
				in: 'query',
				required: false,
				schema: new OA\Schema(type: 'string', example: 'xyz789')
			),
		],
		responses: [
			new OA\Response(
				response: 302,
				description: 'Redirects to frontend login page',
				headers: [
					new OA\Header(
						header: 'Location',
						description: 'Redirect URL',
						schema: new OA\Schema(type: 'string', example: 'http://localhost:5173/login?verified=1')
					)
				]
			),
			new OA\Response(
				response: 403,
				description: 'Invalid verification link',
				content: new OA\JsonContent(
					properties: [
						new OA\Property(property: 'message', type: 'string', example: 'Invalid verification link.')
					]
				)
			),
			new OA\Response(response: 404, description: 'User not found'),
		]
	)]
	public function verifyEmail(Request $request, $id, $hash)
	{
		$user = User::findOrFail($id);
		$frontendUrl = config('app.frontend_url');

		if (! hash_equals((string) $hash, sha1($user->getEmailForVerification()))) {
			return response()->json(['message' => 'Invalid verification link.'], 403);
		}

		if ($user->hasVerifiedEmail()) {
			return redirect("{$frontendUrl}/login?verified=1");
		}

		if ($user->markEmailAsVerified()) {
			event(new Verified($user));
		}

		return redirect("{$frontendUrl}/login?verified=1&email=" . urlencode($user->email));
	}

}