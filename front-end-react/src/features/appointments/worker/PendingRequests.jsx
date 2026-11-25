import { usePendingRequests } from './hooks/usePendingRequests.js';
import PendingTable from "./components/PendingTable.jsx";
import { DeclineAppointmentModal, ConfirmAppointmentModal } from "../components/modals";
import {useAppointmentModals} from "../hooks/useAppointmentModals.js";

const PendingRequests = () => {
	const {
		appointments,
		isLoading,
		isUpdating,
		activeActionId,
		confirm,
		decline
	} = usePendingRequests();

	const {
		modalType,
		modalTarget,
		openModal,
		closeModal,
		confirmModal
	} = useAppointmentModals({
		decline,
		confirm
	})

	return (
		<div className="mx-auto w-full max-w-7xl px-4 py-12">
			<h2 className="mb-6">Pending Requests</h2>

			<PendingTable
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

			{modalType === "confirm" && (
				<ConfirmAppointmentModal
					appointment={modalTarget}
					isConfirming={isUpdating}
					onClose={closeModal}
					onConfirm={confirmModal}
				/>
			)}
		</div>
	);
};

export default PendingRequests;
