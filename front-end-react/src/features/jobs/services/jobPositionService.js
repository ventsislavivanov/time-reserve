import { api } from "../../../services";

export async function getJobPositions() {
    const response = await api.get('/staff/job-positions');
    return response.data;
}

export async function createJobPosition(data) {
    const response = await api.post('/staff/job-positions', data);
    return response.data;
}

export async function updateJobPosition(id, data) {
    const response = await api.put(`/staff/job-positions/${id}`, data);
    return response.data;
}

export async function deleteJobPosition(id) {
    const response = await api.delete(`/staff/job-positions/${id}`);
    return response.data;
}
