import { useWorkerAppointments } from "./hooks/useWorkerAppointments";
import WorkerTable from "./components/WorkerTable.jsx";
import { useAppointmentModals } from "../hooks/useAppointmentModals.js";
import {
	DeclineAppointmentModal,
	StartAppointmentModal,
	CompleteAppointmentModal,
	NoShowAppointmentModal
} from "../components/modals";

const WorkerAppointments = () => {
	const {
		appointments,
		isLoading,
		isUpdating,
		activeActionId,
		decline,
		start,
		complete,
		noShow
	} = useWorkerAppointments();

	const {
		modalType,
		modalTarget,
		openModal,
		closeModal,
		confirmModal
	} = useAppointmentModals({
		decline,
		start,
		complete,
		noShow
	});

	return (
		<div className="container py-5">
			<h2 className="mb-4">My Appointments</h2>

			<WorkerTable
				appointments={appointments}
				isLoading={isLoading}
				isUpdating={isUpdating}
				activeActionId={activeActionId}
				openModal={openModal}
			/>

			{modalType === "decline" && (
				<DeclineAppointmentModal
					appointment={modalTarget}
					isDeclining={isUpdating}
					onClose={closeModal}
					onConfirm={confirmModal}
				/>
			)}

			{modalType === "start" && (
				<StartAppointmentModal
					appointment={modalTarget}
					isStarting={isUpdating}
					onClose={closeModal}
					onConfirm={confirmModal}
				/>
			)}

			{modalType === "complete" && (
				<CompleteAppointmentModal
					appointment={modalTarget}
					isCompleting={isUpdating}
					onClose={closeModal}
					onConfirm={confirmModal}
				/>
			)}

			{modalType === "no_show" && (
				<NoShowAppointmentModal
					appointment={modalTarget}
					isMarking={isUpdating}
					onClose={closeModal}
					onConfirm={confirmModal}
				/>
			)}
		</div>
	);
};

export default WorkerAppointments;
