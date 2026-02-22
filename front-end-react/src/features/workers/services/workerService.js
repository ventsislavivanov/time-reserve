
import { api } from '../../../services';

export const getWorkers = async () => {
	const response = await api.get('/workers');
	return response.data;
};

export const getWorker = async (workerId) => {
	const response = await api.get(`/workers/${workerId}`);
	return response.data;
};