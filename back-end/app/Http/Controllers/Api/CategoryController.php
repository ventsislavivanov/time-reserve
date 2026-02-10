<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Http\Resources\Category\CategoryCollection;
use App\Http\Resources\Category\CategoryResource;
use App\Models\Category;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;

class CategoryController extends Controller
{
	#[OA\Get(
		path: '/api/categories',
		description: 'Returns a list of all categories. Publicly accessible.',
		summary: 'Get all categories',
		tags: ['Categories']
	)]
	#[OA\Response(response: 200, description: 'List of categories',
		content: new OA\JsonContent(ref: '#/components/schemas/CategoryCollection')
	)]
	public function index(Request $request): CategoryCollection
	{
		$items = Category::query()
			->paginate($request->query('limit', 100));

		return new CategoryCollection($items);
	}

	#[OA\Post(
		path: '/api/staff/categories',
		summary: 'Create a new category',
		security: [['sanctum' => []]],
		tags: ['Categories']
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/CategoryRequest')
	)]
	#[OA\Response(response: 201, description: 'Category created',
		content: new OA\JsonContent(ref: '#/components/schemas/CategoryResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function store(CategoryRequest $request): CategoryResource
	{
		$this->authorize('create', Category::class);

		$category = Category::create($request->validated());

		return new CategoryResource($category);
	}

	#[OA\Get(
		path: '/api/staff/categories/{id}',
		summary: 'Get category by ID',
		security: [['sanctum' => []]],
		tags: ['Categories']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(response: 200, description: 'Category details',
		content: new OA\JsonContent(ref: '#/components/schemas/CategoryResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Category not found')]
	public function show(Category $category): CategoryResource
	{
		$this->authorize('view', Category::class);

		return new CategoryResource($category);
	}

	#[OA\Put(
		path: '/api/staff/categories/{id}',
		summary: 'Update a category',
		security: [['sanctum' => []]],
		tags: ['Categories']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\RequestBody(
		required: true,
		content: new OA\JsonContent(ref: '#/components/schemas/CategoryRequest')
	)]
	#[OA\Response(response: 200, description: 'Category updated',
		content: new OA\JsonContent(ref: '#/components/schemas/CategoryResource')
	)]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Category not found')]
	#[OA\Response(response: 422, description: 'Validation error')]
	public function update(CategoryRequest $request, Category $category): CategoryResource
	{
		$this->authorize('update', Category::class);

		$category->update($request->validated());

		return new CategoryResource($category);
	}

	#[OA\Delete(
		path: '/api/staff/categories/{id}',
		summary: 'Delete a category',
		security: [['sanctum' => []]],
		tags: ['Categories']
	)]
	#[OA\Parameter(
		name: 'id', in: 'path', required: true,
		schema: new OA\Schema(type: 'integer', example: 1)
	)]
	#[OA\Response(response: 204, description: 'Category deleted')]
	#[OA\Response(response: 403, description: 'Unauthorized')]
	#[OA\Response(response: 404, description: 'Category not found')]
	public function destroy(Category $category): JsonResponse
	{
		$this->authorize('delete', Category::class);

		$category->delete();

		return response()->json(null, 204);
	}
}