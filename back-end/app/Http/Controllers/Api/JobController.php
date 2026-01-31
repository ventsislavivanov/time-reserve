<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\JobRequest;
use App\Models\JobPosition;

class JobController extends Controller
{
    public function index()
    {
		$this->authorize('viewAny', JobPosition::class);

        return response()->json(JobPosition::all());
    }

	public function show(JobPosition $job)
	{
		$this->authorize('view', JobPosition::class);

		return response()->json($job);
	}

    public function store(JobRequest $request)
    {
		$this->authorize('create', JobPosition::class);

		$job = JobPosition::create($request->validated());

		return response()->json($job, 201);
    }

    public function update(JobRequest $request, JobPosition $job)
    {
		$this->authorize('update', JobPosition::class);

		$data = array_filter(
			$request->validated(),
			fn ($v) => !is_null($v)
		);

        $job->update($data);

        return response()->json($job);
    }

    public function destroy(JobPosition $job)
    {
		$this->authorize('delete', JobPosition::class);

        $job->delete();

        return response()->json(null, 204);
    }
}
