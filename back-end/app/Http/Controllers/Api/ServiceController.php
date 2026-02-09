<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ServiceRequest;
use App\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function index()
    {
		$this->authorize('viewAny', Service::class);

		return response()->json(Service::all());
    }

	public function show(Service $service)
	{
		$this->authorize('view', Service::class);

		return response()->json($service);
	}

    public function store(ServiceRequest $request)
    {
		$this->authorize('create', Service::class);

        $service = Service::create($request->validated());

        return response()->json($service, 201);
    }

	public function update(ServiceRequest $request, Service $service)
	{
		$this->authorize('update', Service::class);

		$service->update($request->validated());

		return response()->json($service);
	}

	public function destroy(Service $service)
	{
		$this->authorize('delete', Service::class);

		$service->delete();

		return response()->json(null, 204);
	}

	public function active()
	{
		return Service::where('is_active', true)
			->with('category')
			->get();
	}
}
