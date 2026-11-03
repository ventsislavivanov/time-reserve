<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ReviewRequest;
use App\Http\Resources\Review\ReviewResource;
use App\Models\Review;
use App\Models\Service;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use OpenApi\Attributes as OA;

class ReviewController extends Controller
{
	#[OA\Get(
		path: '/api/services/{service}/reviews',
		description: 'Returns the reviews of a service together with the average rating. Publicly accessible.',
		summary: 'List reviews of a service',
		tags: ['Reviews']
	)]
	#[OA\Parameter(name: 'service', in: 'path', required: true, schema: new OA\Schema(type: 'integer'))]
	#[OA\Response(response: 200, description: 'List of reviews')]
	public function index(Request $request, Service $service): AnonymousResourceCollection
	{
		$reviews = $service->reviews()
			->with('user:id,name')
			->latest()
			->paginate($request->query('limit', 50));

		return ReviewResource::collection($reviews)->additional([
			'summary' => [
				'count' => $service->reviews()->count(),
				'average' => round((float) $service->reviews()->avg('rating'), 1),
			],
		]);
	}

	#[OA\Post(
		path: '/api/services/{service}/reviews',
		description: 'Creates a review. Clients only, one review per service.',
		summary: 'Create a review',
		security: [['sanctum' => []]],
		tags: ['Reviews']
	)]
	#[OA\Parameter(name: 'service', in: 'path', required: true, schema: new OA\Schema(type: 'integer'))]
	#[OA\RequestBody(required: true, content: new OA\JsonContent(ref: '#/components/schemas/ReviewRequest'))]
	#[OA\Response(response: 201, description: 'Review created', content: new OA\JsonContent(ref: '#/components/schemas/ReviewResource'))]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 422, description: 'Validation error or review already exists')]
	public function store(ReviewRequest $request, Service $service): JsonResponse
	{
		$this->authorize('create', Review::class);

		$user = $request->user();

		if ($service->reviews()->where('user_id', $user->id)->exists()) {
			return response()->json([
				'message' => 'You have already reviewed this service.',
				'errors' => ['comment' => ['You have already reviewed this service.']],
			], 422);
		}

		$review = $service->reviews()->create([
			...$request->validated(),
			'user_id' => $user->id,
		]);

		return (new ReviewResource($review->load('user:id,name')))
			->response()
			->setStatusCode(201);
	}

	#[OA\Put(
		path: '/api/reviews/{review}',
		description: 'Updates a review. Only the author can edit it.',
		summary: 'Update a review',
		security: [['sanctum' => []]],
		tags: ['Reviews']
	)]
	#[OA\Parameter(name: 'review', in: 'path', required: true, schema: new OA\Schema(type: 'integer'))]
	#[OA\RequestBody(required: true, content: new OA\JsonContent(ref: '#/components/schemas/ReviewRequest'))]
	#[OA\Response(response: 200, description: 'Review updated', content: new OA\JsonContent(ref: '#/components/schemas/ReviewResource'))]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	public function update(ReviewRequest $request, Review $review): ReviewResource
	{
		$this->authorize('update', $review);

		$review->update($request->validated());

		return new ReviewResource($review->load('user:id,name'));
	}

	#[OA\Delete(
		path: '/api/reviews/{review}',
		description: 'Deletes a review. Only the author can delete it.',
		summary: 'Delete a review',
		security: [['sanctum' => []]],
		tags: ['Reviews']
	)]
	#[OA\Parameter(name: 'review', in: 'path', required: true, schema: new OA\Schema(type: 'integer'))]
	#[OA\Response(response: 204, description: 'Review deleted')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	public function destroy(Review $review): JsonResponse
	{
		$this->authorize('delete', $review);

		$review->delete();

		return response()->json(null, 204);
	}
}
