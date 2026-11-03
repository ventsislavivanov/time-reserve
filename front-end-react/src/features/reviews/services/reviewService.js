import { api } from "../../../services";

export async function getByService(serviceId) {
	const response = await api.get(`/services/${serviceId}/reviews`);
	return response.data;
}

export async function create(serviceId, data) {
	const response = await api.post(`/services/${serviceId}/reviews`, data);
	return response.data;
}

export async function update(id, data) {
	const response = await api.put(`/reviews/${id}`, data);
	return response.data;
}

export async function remove(id) {
	await api.delete(`/reviews/${id}`);
}
