import { useState, useEffect, useMemo } from "react";
import api from "../../services/common/api.js";

const HOURS = Array.from({ length: 12 }, (_, i) => 8 + i); // 08:00 - 20:00
const DAYS = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

const statusClasses = {
	approved: "bg-success text-white",
	pending: "bg-warning text-dark",
	busy: "bg-danger text-white",
};

export default function WorkerWeeklyCalendar({ workerId }) {
	const [appointments, setAppointments] = useState([]);
	const [isLoading, setLoading] = useState(true);

	useEffect(() => {
		if (!workerId) return;

		const fetchAppointments = async () => {
			try {
				setLoading(true);
				// const response = await api.get(`/appointments/worker/${workerId}`);
				const response = await api.get(`/appointments/worker/2`);
				setAppointments(response.data);
			} catch (error) {
				console.error("Error loading hours:", error);
			} finally {
				setLoading(false);
			}
		};

		fetchAppointments();
	}, [workerId]);

	const gridData = useMemo(() => {
		const map = {};
		appointments.forEach((appt)		 => {
			const key = `${appt.day}-${appt.startHour}`;
			map[key] = appt;
		});
		return map;
	}, [appointments]);

	if (isLoading) return <div className="p-4 text-center text-muted">Зареждане на график...</div>;

	return (
		<div className="card shadow-sm border-0">
			<div className="card-body">
				<h2 className="card-title h4 mb-4 fw-bold">Седмичен график</h2>

				<div className="table-responsive">
					<table className="table table-bordered mb-0 align-middle text-center" style={{ minWidth: "800px", tableLayout: "fixed" }}>
						<thead className="table-light">
						<tr>
							<th style={{ width: "80px" }}>Час</th>
							{DAYS.map(day => (
								<th key={day}>{day}</th>
							))}
						</tr>
						</thead>
						<tbody>
						{HOURS.map(hour => (
							<tr key={hour}>
								<td className="table-light fw-bold small text-secondary">
									{String(hour).padStart(2, '0')}:00
								</td>
								{DAYS.map(day => {
									const appt = gridData[`${day}-${hour}`];
									return (
										<td key={`${day}-${hour}`} className="p-1" style={{ height: "65px", verticalAlign: "middle" }}>
											{appt && (
												<div className={`p-1 rounded small shadow-sm d-flex flex-column justify-content-center align-items-center h-100 ${statusClasses[appt.status] || "bg-secondary text-white"}`}>
													<span className="fw-bold" style={{ fontSize: "0.75rem" }}>{appt.title}</span>
													{appt.status === 'pending' && <span className="fst-italic" style={{ fontSize: "0.65rem" }}>(изчакващ)</span>}
												</div>
											)}
										</td>
									);
								})}
							</tr>
						))}
						</tbody>
					</table>
				</div>

				{/* Легенда */}
				<div className="mt-4 d-flex gap-4 small text-secondary">
					<div className="d-flex align-items-center gap-2">
						<div className="rounded bg-success" style={{ width: "12px", height: "12px" }}></div>
						<span>Одобрен</span>
					</div>
					<div className="d-flex align-items-center gap-2">
						<div className="rounded bg-warning" style={{ width: "12px", height: "12px" }}></div>
						<span>Непотвърден</span>
					</div>
					<div className="d-flex align-items-center gap-2">
						<div className="rounded bg-danger" style={{ width: "12px", height: "12px" }}></div>
						<span>Зает</span>
					</div>
				</div>
			</div>
		</div>
	);
}