import api from '../configs/api';

export async function login(email, password, guard) {
    try {
        const response = await api.post('/login', { email, password, guard});
        return response.data;
    } catch (error) {
        throw error;
    }
}

export async function logout() {
    try {
        await api.post('/logout');
    } catch (error) {
        throw error;
    }
}

export async function getMe() {
    try {
        const response = await api.get('/me');
        return response.data;
    } catch (error) {
        throw error;
    }
}