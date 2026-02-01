import { api } from "../../../services";

export async function getAll() {
    const response = await api.get('/staff/job-positions');
    return response.data;
}

export async function getById(id) {
    const response = await api.get(`/staff/job-positions/${id}`);
    return response.data;
}

export async function create(data) {
    const response = await api.post('/staff/job-positions', data);
    return response.data;
}

export async function update(id, data) {
    const response = await api.put(`/staff/job-positions/${id}`, data);
    return response.data;
}

export async function remove(id) {
    const response = await api.delete(`/staff/job-positions/${id}`);
    return response.data;
}
