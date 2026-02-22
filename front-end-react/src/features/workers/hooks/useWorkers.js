import { useState, useEffect } from 'react';
import * as workerService from '../services/workerService';

export const useWorkers = () => {
	const [workers, setWorkers] = useState([]);
	const [isLoading, setIsLoading] = useState(true);
	const [error, setError] = useState(null);

	useEffect(() => {
		const fetchWorkers = async () => {
			try {
				setIsLoading(true);
				const data = await workerService.getWorkers();
				setWorkers(data.data || data);
			} catch (err) {
				setError(err.message);
			} finally {
				setIsLoading(false);
			}
		};

		fetchWorkers();
	}, []);

	return { workers, isLoading, error };
};