import axios from "axios";
import { toast } from 'react-toastify';

const api = axios.create({
	baseURL: import.meta.env.VITE_API_URL || "http://127.0.0.1:8989/api",
});

api.interceptors.request.use(config => {
	const token = localStorage.getItem("token");
	if (token) {
		config.headers.Authorization = `Bearer ${token}`;
	}
	return config;
}, error => {
	return Promise.reject(error);
});

api.interceptors.response.use(
	(response) => {
		return response;
	},
	(error) => {
		const message = error.response?.data?.message || error.message || "An unexpected error occurred";

		if (error.response) {
			switch (error.response.status) {
				case 401:
					toast.error(message);
					localStorage.removeItem("token");
					break;
				case 403:
					toast.warning(message);
					break;
				case 422:
					const validationErrors = error.response.data.errors;
					if (validationErrors) {
						const firstError = Object.values(validationErrors)[0][0];
						toast.error(`⚠️ ${firstError}`, {
							icon: false
						});
					} else {
						toast.error(message);
					}
					break;
				default:
					toast.error(message);
			}
		} else {
			toast.error("No connection to server. Check your internet connection.");
		}

		return Promise.reject(error);
	}
);

export default api;