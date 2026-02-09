<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Models\Category;
use Illuminate\Http\JsonResponse;

class CategoryController extends Controller
{
	public function index(): JsonResponse
	{
		return response()->json(Category::all());
	}

	public function show(Category $category): JsonResponse
	{
		$this->authorize('view', Category::class);

		return response()->json($category);
	}

	public function store(CategoryRequest $request): JsonResponse
	{
		$this->authorize('create', Category::class);

		$category = Category::create($request->validated());

		return response()->json($category, 201);
	}

	public function update(CategoryRequest $request, Category $category): JsonResponse
	{
		$this->authorize('update', Category::class);

		$category->update($request->validated());

		return response()->json($category);
	}

	public function destroy(Category $category): JsonResponse
	{
		$this->authorize('delete', Category::class);

		$category->delete();

		return response()->json(null, 204);
	}
}