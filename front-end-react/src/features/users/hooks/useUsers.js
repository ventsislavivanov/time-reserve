import { useEffect, useState } from "react";
import { getUsers, toggleUserActive } from "../services/userService";

export default function useUsers() {
	const [users, setUsers] = useState([]);
	const [isLoading, setLoading] = useState(true);

	const [currentPage, setCurrentPage] = useState(1);
	const [itemsPerPage, setItemsPerPage] = useState(10);

	const [filters, setFilters] = useState({
		search: "",
		role: "",
		gender: ""
	});

	const [totalItems, setTotalItems] = useState(0);
	const [totalPages, setTotalPages] = useState(1);

	const fetchUsers = async () => {
		setLoading(true);
		try {
			const response = await getUsers(currentPage, itemsPerPage, filters);
			const { data, meta } = response;

			setUsers(data);
			setTotalItems(meta.total);
			setTotalPages(meta.last_page);
		} catch (error) {
			console.error("Error loading users", error);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		fetchUsers();
	}, [currentPage, itemsPerPage, filters]);

	useEffect(() => {
		setCurrentPage(1);
	}, [filters, itemsPerPage]);

	const toggleActive = async (id) => {
		const response = await toggleUserActive(id);
		setUsers(prev =>
			prev.map(u => (u.id === id ? response.user : u))
		);
	};

	return {
		// data
		users,
		isLoading,

		// pagination
		currentPage,
		itemsPerPage,
		totalItems,
		totalPages,
		setCurrentPage,
		setItemsPerPage,

		// filters
		filters,
		setFilters,

		// actions
		fetchUsers,
		toggleActive
	};
}