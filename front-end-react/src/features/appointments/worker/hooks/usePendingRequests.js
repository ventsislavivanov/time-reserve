import { useState, useEffect } from 'react';
import {
	getStaffAppointments,
	confirmAppointment,
	declineAppointment
} from '../../services/appointmentService.js';
import { notify } from '../../../../services/index.js';

export const usePendingRequests = () => {
	const [requests, setRequests] = useState([]);
	const [isLoading, setIsLoading] = useState(false);
	const [isUpdating, setIsUpdating] = useState(false);

	useEffect(() => {
		fetchPending();
	}, []);

	const fetchPending = async () => {
		try {
			setIsLoading(true);
			const response = await getStaffAppointments();

			const pending = response.data.filter(a => a.status === 'pending');
			setRequests(pending);

		} catch (error) {
			notify.error('Failed to load pending requests');
		} finally {
			setIsLoading(false);
		}
	};

	const confirm = async (id) => {
		try {
			setIsUpdating(true);
			await confirmAppointment(id);
			setRequests(prev => prev.filter(r => r.id !== id));
			notify.success('Appointment confirmed');
		} catch (error) {
			notify.error('Failed to confirm appointment');
		} finally {
			setIsUpdating(false);
		}
	};

	const decline = async (id, reason = null) => {
		try {
			setIsUpdating(true);
			await declineAppointment(id, reason);
			setRequests(prev => prev.filter(r => r.id !== id));
			notify.success('Appointment declined');
		} catch (error) {
			notify.error('Failed to decline appointment');
		} finally {
			setIsUpdating(false);
		}
	};

	return {
		requests,
		isLoading,
		isUpdating,
		confirm,
		decline,
		refetch: fetchPending
	};
};
