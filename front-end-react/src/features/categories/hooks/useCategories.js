import { useState, useEffect } from 'react';
import { getAll as getAllCategory } from '../services/categoryService.js';

export const useCategories = () => {
	const [categories, setCategories] = useState([]);
	const [isLoading, setIsLoading] = useState(true);
	const [error, setError] = useState(null);

	useEffect(() => {
		const fetchCategories = async () => {
			try {
				setIsLoading(true);
				const data = await getAllCategory();
				setCategories(data);
				setError(null);
			} catch (err) {
				console.error('Error fetching categories:', err);
				setError(err);
			} finally {
				setIsLoading(false);
			}
		};
		fetchCategories();
	}, []);

	return { categories, isLoading, error };
};