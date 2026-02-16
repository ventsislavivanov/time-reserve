<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;

trait ApiResponse
{
	/**
	 * Success response with data
	 */
	protected function dataResponse($data, int $status = 200): JsonResponse
	{
		return response()->json(['data' => $data], $status);
	}

	/**
	 * Collection response (paginated)
	 */
	protected function paginatedResponse($collection): JsonResponse
	{
		return response()->json([
			'data' => $collection->items(),
			'meta' => [
				'total' => $collection->total(),
				'per_page' => $collection->perPage(),
				'current_page' => $collection->currentPage(),
				'last_page' => $collection->lastPage(),
			],
		]);
	}

	/**
	 * Error response
	 */
	protected function errorResponse(string $message, int $status = 400, $errors = null): JsonResponse
	{
		$response = ['message' => $message];

		if ($errors) {
			$response['errors'] = $errors;
		}

		return response()->json($response, $status);
	}
}