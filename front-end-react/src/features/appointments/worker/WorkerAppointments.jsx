import { useState } from "react";
import { useWorkerAppointments } from './hooks/useWorkerAppointments.js';
import { SkeletonTable } from '../../../components/common/ui';
import { DeclineAppointmentModal } from "../components/modals/index.js";
import WorkerRow from "./components/WorkerRow.jsx";
import { useBootstrapModal } from "../../../hooks/index.js";
import NoShowAppointmentModal from "../components/modals/NoShowAppointmentModal.jsx";

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

	const { showModal, hideModal } = useBootstrapModal();

	const [declining, setDeclining] = useState(null);
	const [noShowTarget, setNoShowTarget] = useState(null);

	// Decline
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

	// NoShow
	const openNoShowModal = (app) => {
		setNoShowTarget(app);
		setTimeout(() => showModal("noShowAppointmentModal"), 10);
	};

	const closeNoShowModal = () => {
		hideModal("noShowAppointmentModal");
		setNoShowTarget(null);
	};

	const confirmNoShow = async (id) => {
		await noShow(id);
		closeNoShowModal();
	};

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
					You have no confirmed requests.
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
					{appointments.map(app => (
						<WorkerRow
							key={app.id}
							app={app}
							isUpdating={isUpdating}
							activeActionId={activeActionId}
							activeActionType={activeActionType}
							start={start}
							decline={() => openDeclineModal(app)}
							markNoShow={() => openNoShowModal(app)}
							complete={complete}
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

			<NoShowAppointmentModal
				appointment={noShowTarget}
				onClose={closeNoShowModal}
				onConfirm={confirmNoShow}
				isMarking={isUpdating}
			/>
		</div>
	);
};

export default WorkerAppointments;
