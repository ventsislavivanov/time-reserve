import api from '../configs/api';

export async function getUsers() {
	const response = await api.get('/staff/users');
	return response.data;
}

export async function createUser(userData) {
	const response = await api.post('/staff/users', userData);
	return response.data;
}

export async function toggleUserActive(id) {
	const response = await api.patch(`/staff/users/${id}/toggle-active`);
	return response.data;
}