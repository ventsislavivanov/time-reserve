import { useState, useEffect, useCallback } from 'react';
import { getUsers } from '../services/userService.js';

export default function useUsers() {
	const [users, setUsers] = useState([]);
	const [isLoading, setIsLoading] = useState(false);
	const [currentPage, setCurrentPage] = useState(1);
	const [itemsPerPage, setItemsPerPage] = useState(10);
	const [totalItems, setTotalItems] = useState(0);
	const [filters, setFilters] = useState({
		search: '',
		role: '',
		gender: ''
	});

	const fetchUsers = useCallback(async () => {
		setIsLoading(true);
		try {
			const params = {
				page: currentPage,
				limit: itemsPerPage,
				...filters
			};

			const response = await getUsers(params);
			const { data: usersData, meta } = response.data;

			setUsers(usersData);
			setTotalItems(meta.total);
		} catch (error) {
			console.error('Error fetching users:', error);
		} finally {
			setIsLoading(false);
		}
	}, [currentPage, itemsPerPage, filters]);

	useEffect(() => {
		fetchUsers();
	}, [fetchUsers]);

	const totalPages = Math.ceil(totalItems / itemsPerPage);

	return {
		users,
		isLoading,
		currentPage,
		itemsPerPage,
		totalItems,
		totalPages,
		filters,
		setFilters,
		setCurrentPage,
		setItemsPerPage,
		fetchUsers
	};
}