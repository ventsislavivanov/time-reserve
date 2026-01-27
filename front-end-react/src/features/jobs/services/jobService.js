import { api } from "../../../services";

export async function getJobs() {
    const response = await api.get('/staff/jobs');
    return response.data;
}

export async function showJob(id) {
    const response = await api.get(`/staff/jobs/${id}`);
    return response.data;
}

export async function createJob(data) {
    const response = await api.post('/staff/jobs', data);
    return response.data;
}

export async function updateJob(id, data) {
    const response = await api.put(`/staff/jobs/${id}`, data);
    return response.data;
}

export async function deleteJob(id) {
    const response = await api.delete(`/staff/jobs/${id}`);
    return response.data;
}
