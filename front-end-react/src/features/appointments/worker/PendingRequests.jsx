import { usePendingRequests } from './hooks/usePendingRequests.js';
import { UIAppointmentBadge, SkeletonTable, UILoadingButton } from '../../../components/common/ui';

const PendingRequests = () => {
	const {
		requests,
		isLoading,
		isUpdating,
		activeActionId,
		activeActionType,
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
					You have no pending requests.
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
					{requests.map(app => (
						<tr key={app.id}>
							<td>{app.client.name}</td>
							<td>{app.service.name}</td>
							<td>{app.date}</td>
							<td>{app.time}</td>
							<td className="text-center">
								<UIAppointmentBadge status={app.status} />
							</td>
							<td className="text-end">
								<UILoadingButton
									variant="outline-primary"
									size="sm"
									className="me-2"
									disabled={isUpdating && activeActionId === app.id}
									loading={
										isUpdating &&
										activeActionId === app.id &&
										activeActionType === "confirm"
									}
									loadingLabel="Confirming..."
									onClick={() => confirm(app.id)}
								>
									Confirm
								</UILoadingButton>

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
									onClick={() => decline(app.id)}
								>
									Decline
								</UILoadingButton>
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
