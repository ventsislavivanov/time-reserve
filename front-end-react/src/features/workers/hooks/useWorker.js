import { useState, useEffect } from 'react';
import { getWorker } from '../services/workerService';

export const useWorker = (workerId) => {
	const [worker, setWorker] = useState(null);
	const [isLoading, setIsLoading] = useState(true);
	const [error, setError] = useState(null);

	useEffect(() => {
		let isCancelled = false;

		const fetchWorker = async () => {
			try {
				setIsLoading(true);
				setError(null);
				const data = await getWorker(workerId);

				if (!isCancelled) setWorker(data.data || data);
			} catch (err) {
				if (!isCancelled) {
					setWorker(null);
					setError(err.response?.status === 404 ? 'not-found' : err.message);
				}
			} finally {
				if (!isCancelled) setIsLoading(false);
			}
		};

		fetchWorker();

		return () => {
			isCancelled = true;
		};
	}, [workerId]);

	return { worker, isLoading, error };
};
