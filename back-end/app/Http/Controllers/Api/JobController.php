<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobPosition;
use Illuminate\Http\Request;

class JobController extends Controller
{
    public function index()
    {
        return response()->json(JobPosition::all());
    }

	public function show(JobPosition $job)
	{
		return response()->json($job);
	}

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

		return response()->json(
			JobPosition::create($validated),
			201
		);
    }

    public function update(Request $request, JobPosition $job)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $job->update($validated);

        return response()->json($job);
    }

    public function destroy(JobPosition $job)
    {
        $job->delete();

        return response()->json(['message' => 'JobPosition position deleted successfully']);
    }
}
