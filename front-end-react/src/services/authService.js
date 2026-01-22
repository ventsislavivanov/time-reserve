import api from '../configs/api';

export async function login(email, password, guard) {
    const response = await api.post('/login', { email, password, guard});
    return response.data;
}

export async function logout() {
    await api.post('/logout');
}

export async function getMe() {
    const response = await api.get('/me');
    return response.data;
}

export async function register(data) {
    const response = await api.post('/register', { ...data });
    return response.data;
}
