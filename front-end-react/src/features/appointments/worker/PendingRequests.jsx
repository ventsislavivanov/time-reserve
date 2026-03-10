import { usePendingRequests } from './hooks/usePendingRequests.js';
import { UIButton, UIAppointmentBadge, SkeletonTable } from '../../../components/common/ui';

const PendingRequests = () => {
	const {
		requests,
		isLoading,
		isUpdating,
		confirm,
		decline
	} = usePendingRequests();

	if (isLoading) {
		return (
			<div className="container py-5">
				<SkeletonTable rows={5} columns={7} />
			</div>
		);
	}

	return (
		<div className="container py-5">
			<h2 className="mb-4">Pending Requests</h2>

			{requests.length === 0 ? (
				<div className="alert alert-info">
					Нямате чакащи заявки.
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
					{requests.map(req => (
						<tr key={req.id}>
							<td>{req.client.name}</td>
							<td>{req.service.name}</td>
							<td>{req.date}</td>
							<td>{req.time}</td>
							<td>{req.duration} min</td>
							<td>
								<UIAppointmentBadge status={req.status} />
							</td>
							<td className="text-end">
								<UIButton
									className="btn btn-success btn-sm me-2"
									disabled={isUpdating}
									onClick={() => confirm(req.id)}
								>
									Confirm
								</UIButton>

								<UIButton
									className="btn btn-danger btn-sm"
									disabled={isUpdating}
									onClick={() => decline(req.id)}
								>
									Decline
								</UIButton>
							</td>
						</tr>
					))}
					</tbody>
				</table>
			)}
		</div>
	);
};

export default PendingRequests;
