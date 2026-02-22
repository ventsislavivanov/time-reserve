import { api } from '../../../services';

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

export const getMyAppointments = async () => {
	const response = await api.get('/appointments');
	return response.data;
};

export const cancelAppointment = async (id, reason = null) => {
	const response = await api.patch(`/appointments/${id}/cancel`, { reason });
	return response.data;
};