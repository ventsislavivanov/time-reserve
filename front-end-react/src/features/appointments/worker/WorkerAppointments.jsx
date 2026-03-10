import { useWorkerAppointments } from './hooks/useWorkerAppointments.js';
import { UIAppointmentBadge,SkeletonTable } from '../../../components/common/ui';

const WorkerAppointments = () => {
	const { appointments, isLoading } = useWorkerAppointments();

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
					</tr>
					</thead>

					<tbody>
					{appointments.map(app => (
						<tr key={app.id}>
							<td>{app.client.name}</td>
							<td>{app.service.name}</td>
							<td>{app.date}</td>
							<td>{app.time}</td>
							<td>{app.duration} min</td>
							<td>
								<UIAppointmentBadge status={app.status} />
							</td>
						</tr>
					))}
					</tbody>
				</table>
			)}
		</div>
	);
};

export default WorkerAppointments;
