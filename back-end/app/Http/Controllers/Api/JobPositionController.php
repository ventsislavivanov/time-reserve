<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\JobPositionRequest;
use App\Models\JobPosition;

class JobPositionController extends Controller
{
    public function index()
    {
		$this->authorize('viewAny', JobPosition::class);

        return response()->json(JobPosition::all());
    }

	public function show(JobPosition $jobPosition)
	{
		$this->authorize('view', JobPosition::class);

		return response()->json($jobPosition);
	}

    public function store(JobPositionRequest $request)
    {
		$this->authorize('create', JobPosition::class);

		$jobPosition = JobPosition::create($request->validated());

		return response()->json($jobPosition, 201);
    }

    public function update(JobPositionRequest $request, JobPosition $jobPosition)
    {
		$this->authorize('update', JobPosition::class);

		$jobPosition->update($request->validated());

        return response()->json($jobPosition);
    }

    public function destroy(JobPosition $jobPosition)
    {
		$this->authorize('delete', JobPosition::class);

		$jobPosition->delete();

        return response()->json(null, 204);
    }
}
