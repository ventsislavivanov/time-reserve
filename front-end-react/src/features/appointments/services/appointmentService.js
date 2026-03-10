import { api } from '../../../services/index.js';

export const getAvailableSlots = async (workerId, serviceId, date) => {
	const response = await api.get('/availability/slots', {
		params: { worker_id: workerId, service_id: serviceId, date }
	});
	return response.data;
};

export const createAppointment = async (data) => {
	const response = await api.post('/appointments', data);
	return response.data;
};

export const getClientAppointments = async () => {
	const response = await api.get('/appointments');
	return response.data;
};

export const cancelAppointment = async (id, reason = null) => {
	const response = await api.patch(`/appointments/${id}/cancel`, { reason });
	return response.data;
};

export const getStaffAppointments = async () => {
	const response = await api.get('/staff/appointments');
	return response.data;
};

export const declineAppointment = async (id, reason = null) => {
	const response = await api.patch(`/staff/appointments/${id}/decline`, { reason });
	return response.data;
};

export const confirmAppointment = async (id, reason = null) => {
	const response = await api.patch(`/staff/appointments/${id}/confirm`, { reason });
	return response.data;
};
