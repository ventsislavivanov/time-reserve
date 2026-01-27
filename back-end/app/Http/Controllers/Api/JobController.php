<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Job;
use Illuminate\Http\Request;

class JobController extends Controller
{
    public function index()
    {
        return response()->json(Job::all());
    }

	public function show(Job $job)
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
			Job::create($validated),
			201
		);
    }

    public function update(Request $request, Job $job)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $job->update($validated);

        return response()->json($job);
    }

    public function destroy(Job $job)
    {
        $job->delete();

        return response()->json(['message' => 'Job position deleted successfully']);
    }
}
