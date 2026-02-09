import { useState, useEffect, useMemo } from 'react';
import { getActive } from '../services/serviceService';
import { useCategories } from '../../categories';

export const useServicesCatalog = () => {
	const [services, setServices] = useState([]);
	const [isLoading, setIsLoading] = useState(true);
	const [selectedCategory, setSelectedCategory] = useState('all');
	const { categories } = useCategories();

	useEffect(() => {
		const fetchServices = async () => {
			try {
				setIsLoading(true);
				const data = await getActive();
				setServices(data);
			} catch (error) {
				console.error('Error fetching services:', error);
			} finally {
				setIsLoading(false);
			}
		};

		fetchServices();
	}, []);

	const filteredServices = useMemo(() => {
		if (selectedCategory === 'all') return services;
		return services.filter(s => s.category_id === parseInt(selectedCategory));
	}, [services, selectedCategory]);

	const groupedByCategory = useMemo(() => {
		return services.reduce((acc, service) => {
			const categoryName = categories.find(c => c.id === service.category_id)?.name || 'Other';
			if (!acc[categoryName]) acc[categoryName] = [];
			acc[categoryName].push(service);
			return acc;
		}, {});
	}, [services, categories]);

	return {
		services: filteredServices,
		groupedByCategory,
		categories,
		selectedCategory,
		setSelectedCategory,
		isLoading
	};
};