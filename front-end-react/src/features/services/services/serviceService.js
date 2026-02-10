import { api } from "../../../services";

export async function getAll() {
    const response = await api.get('/staff/services');
    return response.data;
}

export async function getById(id) {
    const response = await api.get(`/staff/services/${id}`);
    return response.data;
}

export async function create(data) {
    const response = await api.post('/staff/services', data);
    return response.data;
}

export async function update(id, data) {
    const response = await api.put(`/staff/services/${id}`, data);
    return response.data;
}

export async function remove(id) {
    const response = await api.delete(`/staff/services/${id}`);
    return response.data;
}

export async function getActive()  {
    const response = await api.get('/services/active');
    return response.data;
}