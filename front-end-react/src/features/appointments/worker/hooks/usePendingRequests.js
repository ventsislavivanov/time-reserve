import { useActionHandler} from "../../hooks/useActionHandler.js";
import { useFetchList } from '../../hooks/useFetchList.js';
import {
	getStaffAppointments,
	confirmAppointment,
	declineAppointment
} from '../../services/appointmentService.js';

export const usePendingRequests = () => {
	const {
		items: appointments,
		setItems: setAppointments,
		isLoading,
		fetchData: fetchPending
	} = useFetchList(
		getStaffAppointments,
		items => items.filter(a => a.status === "pending")
	);

	const {
		isUpdating,
		activeActionId,
		activeActionType,
		handleAction
	} = useActionHandler();

	const confirm = (id) =>
		handleAction({
			id,
			type: "confirm",
			requestFn: confirmAppointment,
			successMessage: "Appointment confirmed",
			refetchFn: fetchPending,
			optimisticUpdate: () =>
				setAppointments(prev => prev.filter(r => r.id !== id))
		});

	const decline = (id, reason) =>
		handleAction({
			id,
			type: "decline",
			requestFn: () => declineAppointment(id, reason),
			successMessage: "Appointment declined",
			refetchFn: fetchPending,
			optimisticUpdate: () =>
				setAppointments(prev => prev.filter(r => r.id !== id))
		});

	return {
		appointments,
		isLoading,
		isUpdating,
		activeActionId,
		activeActionType,
		confirm,
		decline,
		refetch: fetchPending
	};
};
