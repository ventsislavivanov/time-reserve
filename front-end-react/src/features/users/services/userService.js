import { api } from "../../../services";

export const getUsers = (params) =>
	api.get('/staff/users', { params });

export const createUser = (data) =>
	api.post('/staff/users', data);

export const updateUser = (id, data) =>
	api.put(`/staff/users/${id}`, data);

export const toggleUserActive = (userId) =>
	api.patch(`/staff/users/${userId}/toggle-active`);

export const updateUserRole = (userId, role) =>
	api.patch(`/staff/users/${userId}/role`, { role });

export const getUserServices = (userId) =>
	api.get(`/staff/users/${userId}/services`);

export const syncUserServices = (userId, serviceIds) =>
	api.post(`/staff/users/${userId}/services`, { service_ids: serviceIds });