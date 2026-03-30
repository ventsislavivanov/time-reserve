import { useState } from "react";
import { usePendingRequests } from './hooks/usePendingRequests.js';
import { SkeletonTable } from '../../../components/common/ui';
import PendingRow from "./components/PendingRow.jsx";
import DeclineAppointmentModal from "./components/modals/DeclineAppointmentModal.jsx";
import { useBootstrapModal } from "../../../hooks";

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

	const { showModal, hideModal } = useBootstrapModal();

	const [declineAppointment, setDeclineAppointment] = useState(null);

	const openDecline = (appointment) => {
		setDeclineAppointment(appointment);
		setTimeout(() => showModal("declineAppointmentModal"), 10);
	};

	const closeDecline = () => {
		hideModal("declineAppointmentModal");
		setDeclineAppointment(null);
	};

	const confirmDecline = async (reason) => {
		await decline(declineAppointment.id, reason);
		closeDecline();
	};

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
				<div className="alert alert-info">You have no pending requests.</div>
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
						<PendingRow
							key={app.id}
							app={app}
							isUpdating={isUpdating}
							activeActionId={activeActionId}
							activeActionType={activeActionType}
							confirm={confirm}
							decline={() => openDecline(app)}
						/>
					))}
					</tbody>
				</table>
			)}

			<DeclineAppointmentModal
				appointment={declineAppointment}
				onClose={closeDecline}
				onConfirm={confirmDecline}
				isDeclining={isUpdating}
			/>
		</div>
	);
};

export default PendingRequests;
