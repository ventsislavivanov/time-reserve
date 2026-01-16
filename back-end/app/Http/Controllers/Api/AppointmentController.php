<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use App\Models\Service;
use Illuminate\Http\Request;

class AppointmentController extends Controller
{
	public function store(Request $request)
	{
		$user = $request->user();

		// ✅ само клиенти
		if ($user->role !== 'client') {
			return response()->json(['message' => 'Forbidden'], 403);
		}

		$request->validate([
			'service_id' => 'required|exists:services,id',
			'worker_id' => 'required|exists:users,id',
			'date' => 'required|date',
			'start_time' => 'required',
		]);

		$service = Service::findOrFail($request->service_id);

		// ⏱️ изчисляваме крайния час
		$endTime = now()
			->setTimeFromTimeString($request->start_time)
			->addMinutes($service->duration)
			->format('H:i:s');

		// ❌ проверка за зает час
		$exists = Appointment::where('worker_id', $request->worker_id)
			->where('date', $request->date)
			->where('status', '!=', 'rejected')
			->where(function ($q) use ($request, $endTime) {
				$q->whereBetween('start_time', [$request->start_time, $endTime])
					->orWhereBetween('end_time', [$request->start_time, $endTime]);
			})
			->exists();

		if ($exists) {
			return response()->json([
				'message' => 'This time slot is already taken'
			], 422);
		}

		$appointment = Appointment::create([
			'client_id' => $user->id,
			'worker_id' => $request->worker_id,
			'service_id' => $request->service_id,
			'date' => $request->date,
			'start_time' => $request->start_time,
			'end_time' => $endTime,
			'status' => 'pending',
		]);

		return response()->json($appointment, 201);
	}

	public function myAppointments(Request $request)
	{
		return $request->user()
			->appointments()
			->with(['service', 'worker'])
			->get();
	}
}
