import api from '../configs/api';

export async function getUsers(page = 1, limit = 10, filters = {}) {
	const params = new URLSearchParams({
		page,
		limit,
		...filters
	}).toString();

	const response = await api.get(`/staff/users?${params}`);
	return response.data;
}

export async function createUser(userData) {
	const response = await api.post('/staff/users', userData);
	return response.data;
}

export async function updateUser(id, userData) {
	const response = await api.put(`/staff/users/${id}`, userData);
	return response.data;
}

export async function toggleUserActive(id) {
	const response = await api.patch(`/staff/users/${id}/toggle-active`);
	return response.data;
}