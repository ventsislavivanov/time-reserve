import { useState, useEffect } from 'react';
import * as appointmentService from '../../services/appointmentService.js';
import { notify } from '../../../../services/index.js';
import { getClientAppointments } from "../../services/appointmentService.js";

export const useClientAppointments = () => {
	const [appointments, setAppointments] = useState([]);
	const [isLoading, setIsLoading] = useState(false);
	const [isCancelling, setIsCancelling] = useState(false);

	useEffect(() => {
		fetchAppointments();
	}, []);

	const fetchAppointments = async () => {
		try {
			setIsLoading(true);
			const response = await appointmentService.getClientAppointments();
			setAppointments(response.data);
		} catch (error) {
			notify.error('Failed to load appointments');
		} finally {
			setIsLoading(false);
		}
	};

	const cancelAppointment = async (id, reason = null) => {
		try {
			setIsCancelling(true);
			await appointmentService.cancelAppointment(id, reason);
			setAppointments((prev) =>
				prev.map((a) =>
					a.id === id ? { ...a, status: 'cancelled' } : a
				)
			);
			notify.success('Appointment cancelled successfully');
		} catch (error) {
			const message = error.response?.data?.message;
			console.error(message);
		} finally {
			setIsCancelling(false);
		}
	};

	return {
		appointments,
		isLoading,
		isCancelling,
		cancelAppointment,
		refetch: fetchAppointments,
	};
};