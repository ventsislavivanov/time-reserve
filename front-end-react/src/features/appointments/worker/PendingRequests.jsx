import { useState } from "react";
import { usePendingRequests } from './hooks/usePendingRequests.js';
import { SkeletonTable } from '../../../components/common/ui';
import PendingRow from "./components/PendingRow.jsx";
import { DeclineAppointmentModal, ConfirmAppointmentModal } from "../components/modals";
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

	const [declining, setDeclining] = useState(null);
	const [confirming, setConfirming] = useState(null);

	const openDeclineModal = (app) => {
		setDeclining(app);
		setTimeout(() => showModal("declineAppointmentModal"), 10);
	};

	const closeDeclineModal = () => {
		hideModal("declineAppointmentModal");
		setDeclining(null);
	};

	const confirmDecline = async (reason) => {
		await decline(declining.id, reason);
		closeDeclineModal();
	};

	const openConfirmModal = (app) => {
		setConfirming(app);
		setTimeout(() => showModal("confirmAppointmentModal"), 10);
	};

	const closeConfirmModal = () => {
		hideModal("confirmAppointmentModal");
		setConfirming(null);
	};

	const confirmConfirm = async (id) => {
		await confirm(id);
		closeConfirmModal();
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
							confirm={()=> openConfirmModal(app)}
							decline={() => openDeclineModal(app)}
						/>
					))}
					</tbody>
				</table>
			)}

			<DeclineAppointmentModal
				appointment={declining}
				onClose={closeDeclineModal}
				onConfirm={confirmDecline}
				isDeclining={isUpdating}
			/>

			<ConfirmAppointmentModal
				appointment={confirming}
				onClose={closeConfirmModal}
				onConfirm={confirmConfirm}
				isConfirming={isUpdating}
			/>
		</div>
	);
};

export default PendingRequests;
