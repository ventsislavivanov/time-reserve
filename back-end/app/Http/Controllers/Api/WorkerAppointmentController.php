<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use App\Models\User;
use Illuminate\Http\Request;

class WorkerAppointmentController extends Controller
{
	public function pending(Request $request)
	{
		$user = $request->user();

		if ($user->role !== 'worker') {
			abort(403);
		}

		return Appointment::where('worker_id', $user->id)
			->where('status', 'pending')
			->with(['client', 'service'])
			->orderBy('starts_at')
			->get();
	}

	public function approve(Request $request, Appointment $appointment)
	{
		$this->authorizeWorker($request->user(), $appointment);

		if ($appointment->status !== 'pending') {
			return response()->json(['message' => 'Appointment is not pending'], 422);
		}

		$appointment->update([
			'status' => 'approved',
		]);

		return response()->json(['message' => 'Appointment approved']);
	}

	public function reject(Request $request, Appointment $appointment)
	{
		$this->authorizeWorker($request->user(), $appointment);

		$request->validate([
			'reason' => 'nullable|string|max:255',
		]);

		$appointment->update([
			'status' => 'rejected',
			'rejection_reason' => $request->reason,
		]);

		return response()->json(['message' => 'Appointment rejected']);
	}

	private function authorizeWorker(User $user, Appointment $appointment)
	{
		if (
			$user->role !== 'worker' ||
			$appointment->worker_id !== $user->id
		) {
			abort(403);
		}
	}
}
