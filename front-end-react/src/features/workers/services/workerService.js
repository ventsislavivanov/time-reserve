
import { api } from '../../../services';

export const getWorkers = async () => {
	const response = await api.get('/workers');
	return response.data;
};
