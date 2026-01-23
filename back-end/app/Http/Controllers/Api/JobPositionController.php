<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobPosition;
use Illuminate\Http\Request;

class JobPositionController extends Controller
{
    public function index()
    {
        return response()->json(JobPosition::all());
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $jobPosition = JobPosition::create($validated);

        return response()->json($jobPosition, 201);
    }

    public function update(Request $request, $id)
    {
        $jobPosition = JobPosition::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $jobPosition->update($validated);

        return response()->json($jobPosition);
    }

    public function destroy($id)
    {
        $jobPosition = JobPosition::findOrFail($id);
        $jobPosition->delete();

        return response()->json(['message' => 'Job position deleted successfully']);
    }
}
