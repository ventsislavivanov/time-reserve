import { api } from "../../../services";

export async function getUsers(params = {}) {
	const response = await api.get('/staff/users?', { params });
	return response.data;
}

export async function createUser(data) {
	const response = await api.post('/staff/users', data);
	return response.data;
}

export async function updateUser(id, data){
	const response = await api.put(`/staff/users/${id}`, data);
	return response.data;
}

export async function toggleUserActive(userId) {
	const response = await api.patch(`/staff/users/${userId}/toggle-active`);
	return response.data;
}

export async function updateUserRole(userId, role) {
	const response = await api.patch(`/staff/users/${userId}/role`, { role });
	return response.data;
}

export const getUserServices = async (userId) => {
	const response = await api.get(`/staff/users/${userId}/services`);
	return response.data;
};

export const syncUserServices = async (userId, serviceIds) => {
	const response = await api.post(`/staff/users/${userId}/services`, {
		service_ids: serviceIds
	});
	return response.data;
};