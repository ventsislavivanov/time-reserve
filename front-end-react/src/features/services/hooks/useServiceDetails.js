import { useState, useEffect } from 'react';
import { getActive } from '../services/serviceService';

export const useServiceDetails = (serviceId) => {
	const [service, setService] = useState(null);
	const [isLoading, setIsLoading] = useState(true);
	const [error, setError] = useState(null);

	useEffect(() => {
		let isCancelled = false;

		const fetchService = async () => {
			try {
				setIsLoading(true);
				setError(null);
				const { data } = await getActive();
				const found = data.find(s => s.id === parseInt(serviceId));

				if (!isCancelled) setService(found ?? null);
			} catch (err) {
				if (!isCancelled) {
					setService(null);
					setError(err.message);
				}
			} finally {
				if (!isCancelled) setIsLoading(false);
			}
		};

		fetchService();

		return () => {
			isCancelled = true;
		};
	}, [serviceId]);

	return { service, isLoading, error };
};
