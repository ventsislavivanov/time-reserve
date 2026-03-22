import { useState } from "react";
import { useWorkerAppointments } from './hooks/useWorkerAppointments.js';
import { UIAppointmentBadge, SkeletonTable, UIButton } from '../../../components/common/ui';
import DeclineAppointmentModal from "./components/DeclineAppointmentModal.jsx";

const WorkerAppointments = () => {
	const {
		appointments,
		isLoading,
		isUpdating,
		complate,
		decline,
		inProgress,
		markNoShow,
	} = useWorkerAppointments();

	const [declineId, setDeclineId] = useState(null);

	if (isLoading) {
		return (
			<div className="container py-5">
				<h2 className="mb-4">My Appointments</h2>
				<SkeletonTable rows={8} columns={6} />
			</div>
		);
	}

	return (
		<div className="container py-5">
			<h2 className="mb-4">My Appointments</h2>

			{appointments.length === 0 ? (
				<div className="alert alert-info">
					Нямате потвърдени часове.
				</div>
			) : (
				<table className="table table-striped align-middle">
					<thead>
					<tr>
						<th>Client</th>
						<th>Service</th>
						<th>Date</th>
						<th>Time</th>
						<th>Duration</th>
						<th>Status</th>
						<th className="text-end">Actions</th>
					</tr>
					</thead>

					<tbody>
					{appointments.map(app => {
						const now = new Date();
						const startsAt = new Date(app.starts_at);
						const endsAt = new Date(app.ends_at);
						const twoHoursAfterEnd = new Date(endsAt.getTime() + 2 * 60 * 60 * 1000);

						return (
							<tr key={app.id}>
								<td>{app.client.name}</td>
								<td>{app.service.name}</td>
								<td>{app.date}</td>
								<td>{app.time}</td>
								<td>{app.duration} min</td>
								<td>
									<UIAppointmentBadge status={app.status} />
								</td>

								<td className="text-end">
									{app.status === 'confirmed' && (
										<UIButton
											className="btn btn-warning btn-sm me-2"
											disabled={isUpdating}
											onClick={() => inProgress(app.id)}
										>
											In progress
										</UIButton>
									)}

									{(app.status === 'pending' || app.status === 'confirmed') && (
										// <UIButton
										// 	className="btn btn-danger btn-sm me-2"
										// 	disabled={isUpdating}
										// 	onClick={() => decline(app.id)}
										// >
										// 	Decline
										// </UIButton>

										<UIButton
											className="btn btn-danger btn-sm me-2"
											disabled={isUpdating}
											onClick={() => setDeclineId(app.id)}
										>
											Decline
										</UIButton>
									)}

									{app.status === 'confirmed' && now >= twoHoursAfterEnd && (
										<UIButton
											className="btn btn-dark btn-sm me-2"
											disabled={isUpdating}
											onClick={() => markNoShow(app.id)}
										>
											Mark no-show
										</UIButton>
									)}

									{app.status === 'in-progress' && (
										<UIButton
											className="btn btn-success btn-sm"
											disabled={isUpdating}
											onClick={() => complate(app.id)}
										>
											Complete
										</UIButton>
									)}
								</td>
							</tr>
						);
					})}
					</tbody>
				</table>
			)}

			<DeclineAppointmentModal
				appointmentId={declineId}
				onClose={() => setDeclineId(null)}
				declineAppointment={decline}
				isDeclining={isUpdating}
			/>
		</div>
	);
};

export default WorkerAppointments;
