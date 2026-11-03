
import { api } from '../../../services';

export const getWorkers = async () => {
	const response = await api.get('/workers');
	return response.data;
};

export const getWorker = async (id) => {
	const response = await api.get(`/workers/${id}`);
	return response.data;
};
