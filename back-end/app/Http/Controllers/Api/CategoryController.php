<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Models\Category;
use App\Models\User;

class CategoryController extends Controller
{
	public function index()
	{
		$this->authorize('viewAny', User::class);

		return response()->json(Category::all());
	}

	public function show(Category $category)
	{
		$this->authorize('view', User::class);

		return response()->json($category);
	}

	public function store(CategoryRequest $request)
	{
		$this->authorize('create', User::class);

		$category = Category::create($request->validated());

		return response()->json($category, 201);
	}

	public function update(CategoryRequest $request, Category $category)
	{
		$this->authorize('update', User::class);

		$category->update($request->validated());

		return response()->json($category);
	}

	public function destroy(Category $category)
	{
		$this->authorize('delete', User::class);

		$category->delete();

		return response()->json(null, 204);
	}
}