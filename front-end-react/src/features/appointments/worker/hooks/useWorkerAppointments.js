import { useState, useEffect } from 'react';
import { getStaffAppointments } from '../../services/appointmentService.js';
import { notify } from '../../../../services/index.js';

export const useWorkerAppointments = () => {
	const [appointments, setAppointments] = useState([]);
	const [isLoading, setIsLoading] = useState(false);

	useEffect(() => {
		fetchAppointments();
	}, []);

	const fetchAppointments = async () => {
		try {
			setIsLoading(true);
			const response = await getStaffAppointments();

			const confirmed = response.data.filter(a => a.status === 'confirmed');
			setAppointments(confirmed);

		} catch (error) {
			notify.error('Failed to load appointments');
		} finally {
			setIsLoading(false);
		}
	};

	return {
		appointments,
		isLoading,
		refetch: fetchAppointments
	};
};
