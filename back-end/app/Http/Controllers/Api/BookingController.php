<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use App\Services\BookingService;
use Illuminate\Http\Request;

class BookingController extends Controller
{
	protected BookingService $service;

	public function __construct(BookingService $service)
	{
		$this->service = $service;
	}

	/**
	 * Създаване на час (от клиент)
	 */
	public function book(Request $request)
	{
		$request->validate([
			'worker_id' => 'required|integer',
			'service_id' => 'required|integer',
			'starts_at' => 'required|date',
			'ends_at' => 'required|date|after:starts_at',
		]);

		$appointment = $this->service->bookAppointment(
			$request->user()->id,
			$request->worker_id,
			$request->service_id,
			$request->starts_at,
			$request->ends_at
		);

		return response()->json($appointment, 201);
	}

	/**
	 * Одобряване на час (от козметик или админ)
	 */
	public function approve(Appointment $appointment)
	{
		$this->service->approveAppointment($appointment);

		return response()->json(['message' => 'Appointment approved']);
	}

	/**
	 * Отказ на час
	 */
	public function reject(Appointment $appointment)
	{
		$this->service->rejectAppointment($appointment);

		return response()->json(['message' => 'Appointment rejected']);
	}

	/**
	 * Всички часове за козметик
	 */
	public function workerAppointments($workerId)
	{
		return response()->json($this->service->getAppointmentsForWorker($workerId));
	}
}
