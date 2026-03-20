import { useState, useEffect } from 'react';
import {
	getStaffAppointments,
	complateAppointment,
	declineAppointment,
	inProgressAppointment,
	markNoShowAppointment
} from '../../services/appointmentService.js';
import { notify } from '../../../../services/index.js';

export const useWorkerAppointments = () => {
	const [appointments, setAppointments] = useState([]);
	const [isLoading, setIsLoading] = useState(false);
	const [isUpdating, setIsUpdating] = useState(false);

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

	const complate = async (id) => {
		try {
			setIsUpdating(true);
			await complateAppointment(id);
			setAppointments(prev => prev.filter(r => r.id !== id));
			notify.success('Appointment complateed');
		} catch (error) {
			notify.error('Failed to complate appointment');
		} finally {
			setIsUpdating(false);
		}
	};

	const decline = async (id, reason = null) => {
		try {
			setIsUpdating(true);
			await declineAppointment(id, reason);
			setAppointments(prev => prev.filter(r => r.id !== id));
			notify.success('Appointment declined');
		} catch (error) {
			notify.error('Failed to decline appointment');
		} finally {
			setIsUpdating(false);
		}
	};

	const inProgress = async (id, reason = null) => {
		try {
			setIsUpdating(true);
			await inProgressAppointment(id, reason);
			setAppointments(prev => prev.filter(r => r.id !== id));
			notify.success('Appointment in progress');
		} catch (error) {
			notify.error('Failed to in progress appointment');
		} finally {
			setIsUpdating(false);
		}
	};
	const markNoShow = async (id, reason = null) => {
		try {
			setIsUpdating(true);
			await markNoShowAppointment(id, reason);
			setAppointments(prev => prev.filter(r => r.id !== id));
			notify.success('Appointment mark no-show');
		} catch (error) {
			notify.error('Failed to mark no-show appointment');
		} finally {
			setIsUpdating(false);
		}
	};

	return {
		appointments,
		isLoading,
		isUpdating,
		complate,
		decline,
		inProgress,
		markNoShow,
		refetch: fetchAppointments
	};
};
