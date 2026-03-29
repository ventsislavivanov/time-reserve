import { useState } from "react";
import { useWorkerAppointments } from './hooks/useWorkerAppointments.js';
import {
	SkeletonTable,
	UIAppointmentBadge,
	UILoadingButton
} from '../../../components/common/ui';
import DeclineAppointmentModal from "./components/modals/DeclineAppointmentModal.jsx";

const WorkerAppointments = () => {
	const {
		appointments,
		isLoading,
		isUpdating,
		activeActionId,
		activeActionType,
		complete,
		decline,
		start,
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
						<th className="text-center">Status</th>
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
								<td className="text-center">
									<UIAppointmentBadge status={app.status} />
								</td>
								<td className="text-end">
									{app.status === 'confirmed' && (
										<UILoadingButton
											variant="outline-warning"
											size="sm"
											className="me-2"
											disabled={isUpdating && activeActionId === app.id}
											loading={
												isUpdating &&
												activeActionId === app.id &&
												activeActionType === "start"
											}
											loadingLabel="Starting..."
											onClick={() => start(app.id)}
										>
											Start
										</UILoadingButton>
									)}

									{(app.status === 'confirmed') && (
										<UILoadingButton
											variant="outline-danger"
											size="sm"
											className="me-2"
											disabled={isUpdating && activeActionId === app.id}
											loading={
												isUpdating &&
												activeActionId === app.id &&
												activeActionType === "decline"
											}
											loadingLabel="Declining..."
											onClick={() => setDeclineId(app.id)}
										>
											Decline
										</UILoadingButton>
									)}

									{app.status === 'confirmed' && now >= twoHoursAfterEnd && (
										<UILoadingButton
											variant="outline-dark"
											size="sm"
											className="me-2"
											disabled={isUpdating && activeActionId === app.id}
											loading={
												isUpdating &&
												activeActionId === app.id &&
												activeActionType === "no_show"
											}
											loadingLabel="Marking no-show..."
											onClick={() => markNoShow(app.id)}
										>
											Mark no-show
										</UILoadingButton>
									)}

									{app.status === 'in_progress' && (
										<UILoadingButton
											variant="outline-success"
											size="sm"
											className="me-2"
											disabled={isUpdating && activeActionId === app.id}
											loading={
												isUpdating &&
												activeActionId === app.id &&
												activeActionType === "complete"
											}
											loadingLabel="Completing..."
											onClick={() => complete(app.id)}
										>
											Complete
										</UILoadingButton>
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
