import { api } from "../../../services";

export async function getAll() {
	const response = await api.get('/staff/categories');
	return response.data;
}

export async function getById(id) {
	const response = await api.get(`/staff/categories/${id}`);
	return response.data;
}

export async function create(data) {
	const response = await api.post('/staff/categories', data);
	return response.data;
}

export async function update(id, data) {
	const response = await api.put(`/staff/categories/${id}`, data);
	return response.data;
}

export async function remove(id) {
	const response = await api.delete(`/staff/categories/${id}`);
	return response.data;
}
