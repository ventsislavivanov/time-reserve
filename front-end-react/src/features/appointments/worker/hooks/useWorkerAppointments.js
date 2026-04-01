import { useFetchList } from '../../hooks/useFetchList.js';
import { useActionHandler } from '../../hooks/useActionHandler.js';
import {
	getStaffAppointments,
	completeAppointment,
	declineAppointment,
	startAppointment,
	noShowAppointment
} from '../../services/appointmentService.js';

export const useWorkerAppointments = () => {
	const {
		items: appointments,
		setItems: setAppointments,
		isLoading,
		fetchData: fetchAppointments
	} = useFetchList(
		getStaffAppointments,
		items => items.filter(a =>
			a.status === "confirmed" || a.status === "in_progress"
		)
	);


	const {
		isUpdating,
		activeActionId,
		activeActionType,
		handleAction
	} = useActionHandler();

	const start = (id) =>
		handleAction({
			id,
			type: "start",
			requestFn: startAppointment,
			successMessage: "Appointment in progress",
			refetchFn: fetchAppointments,
			optimisticUpdate: (updated) =>
				setAppointments(prev =>
					prev.map(a => a.id === id ? updated : a)
				)
		});

	const complete = (id) =>
		handleAction({
			id,
			type: "complete",
			requestFn: completeAppointment,
			successMessage: "Appointment completed",
			refetchFn: fetchAppointments,
			optimisticUpdate: () =>
				setAppointments(prev => prev.filter(a => a.id !== id))
		});

	const decline = (id, reason) =>
		handleAction({
			id,
			type: "decline",
			requestFn: () => declineAppointment(id, reason),
			successMessage: "Appointment declined",
			refetchFn: fetchAppointments,
			optimisticUpdate: () =>
				setAppointments(prev => prev.filter(a => a.id !== id))
		});

	const noShow = (id) =>
		handleAction({
			id,
			type: "no_show",
			requestFn: noShowAppointment,
			successMessage: "Appointment marked no-show",
			refetchFn: fetchAppointments,
			optimisticUpdate: () =>
				setAppointments(prev => prev.filter(a => a.id !== id))
		});

	return {
		appointments,
		isLoading,
		isUpdating,
		activeActionId,
		activeActionType,
		start,
		complete,
		decline,
		noShow,
		refetch: fetchAppointments
	};
};
