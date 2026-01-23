import api from '../configs/api';

export async function getServices() {
    const response = await api.get('/staff/services');
    return response.data;
}

export async function createService(data) {
    const response = await api.post('/staff/services', data);
    return response.data;
}
