import { useEffect, useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Modal } from "bootstrap";
import { getUsers, toggleUserActive } from "../services/userService.js";
import { UILoading, UIButton, UICard, UIPagination } from "../../../components/common/ui";
import UserFilters from "./UserFilters.jsx";
import UserRow from "./UserRow.jsx";
import { UserDetailsModal, UserFormModal } from "./modals";


export default function ManageUsers() {
	const [users, setUsers] = useState([]);
	const [isLoading, setLoading] = useState(true);
	const [selectedUser, setSelectedUser] = useState(null);
	const [editUser, setEditUser] = useState(null);

	const [currentPage, setCurrentPage] = useState(1);
	const [itemsPerPage, setItemsPerPage] = useState(10);

	const [filters, setFilters] = useState({
		search: "",
		role: "",
		gender: ""
	});

	const [totalItems, setTotalItems] = useState(0);
	const [totalPages, setTotalPages] = useState(1);

	const roleBadgeMap = {
		admin: 'bg-primary',
		worker: 'bg-info',
		client: 'bg-secondary'
	};

	const fetchUsers = async () => {
		setLoading(true);
		try {
			const response = await getUsers(currentPage, itemsPerPage, filters);

			setUsers(response.data);
			setTotalItems(response.total);
			setTotalPages(response.last_page);
		} catch (error) {
			console.error("Error loading users", error);
		} finally {
			setLoading(false);
		}
	}

	useEffect(() => {
		fetchUsers();
	}, [currentPage, itemsPerPage, filters]);

	useEffect(() => {
		setCurrentPage(1);
	}, [filters, itemsPerPage]);

	const handleToggleActive = async (id) => {
		try {
			const response = await toggleUserActive(id);
			setUsers(users.map(u => u.id === id ? response.user : u));
		} catch (error) {}
	};

	const openDetails = (user) => {
		setSelectedUser(user);

		setTimeout(() => {
			const modalElement = document.getElementById('userDetailsModal');
			if (modalElement) {
				const modal = new Modal(modalElement);
				modal.show();
			}
		}, 10);
	};

	const handleCreate = () => {
		setEditUser(null);
		setTimeout(() => {
			const modalElement = document.getElementById('userFormModal');
			if (modalElement) {
				const modal = new Modal(modalElement);
				modal.show();
			}
		}, 10);
	};

	const handleEdit = (user) => {
		setEditUser(user);
		setTimeout(() => {
			const modalElement = document.getElementById('userFormModal');
			if (modalElement) {
				const modal = new Modal(modalElement);
				modal.show();
			}
		}, 10);
	};

	const handleFormSuccess = () => {
		const modalElement = document.getElementById('userFormModal');
		if (modalElement) {
			const modal = Modal.getInstance(modalElement);
			if (modal) modal.hide();
		}
		fetchUsers();
	};

	if (isLoading) {
		return <UILoading fullscreen={true} color="#436d9a" size={60}/>;
	}

	return (
		<div className="container mt-4 pb-5">
			<div className="d-flex justify-content-between align-items-center mb-4">
				<h3 className="fw-bold text-primary m-0">
					<FontAwesomeIcon icon="users-cog" className="me-2" />
					Manage Users
				</h3>
				<div className="d-flex gap-2">
					<UIButton size="sm"
							  variant="success"
							  className="shadow-sm"
							  onClick={handleCreate}
							  icon="user-plus"
					>
						Add User
					</UIButton>
                    <span className="badge bg-light text-dark shadow-sm border p-2">
                        Filtered: {users.length}
                    </span>
					<span className="badge bg-primary shadow-sm p-2">
                        Total: {totalItems}
                    </span>
				</div>
			</div>

			<UserFilters
				filters={filters}
				onFilterChange={(key, value) => setFilters(prev => ({ ...prev, [key]: value }))}
				onReset={() => setFilters({ search: "", role: "", gender: "" })}
			/>

			<div className="card shadow-sm border-0 rounded-3 overflow-hidden bg-white">
				<div className="table-responsive">
					<table className="table table-hover table-striped align-middle mb-0"
						   style={{ fontSize: '0.875rem' }}>
						<thead className="bg-light text-secondary text-uppercase"
							   style={{ fontSize: '0.75rem', letterSpacing: '0.05em' }}
						>
						<tr>
							<th className="ps-4 py-3">User info</th>
							<th className="py-3">Contacts</th>
							<th className="text-center py-3">Role</th>
							<th className="text-center py-3">Status</th>
							<th className="pe-4 text-center py-3">Actions</th>
						</tr>
						</thead>
						<tbody>
						{users.map(user => (
							<UserRow
								key={user.id}
								user={user}
								roleBadgeMap={roleBadgeMap}
								onToggleActive={handleToggleActive}
								onViewDetails={openDetails}
								onEdit={handleEdit}
							/>
						))}
						</tbody>
					</table>
				</div>
			</div>

			<UIPagination
				currentPage={currentPage}
				totalPages={totalPages}
				totalItems={totalItems}
				itemsPerPage={itemsPerPage}
				onPageChange={setCurrentPage}
				onItemsPerPageChange={setItemsPerPage}
			/>

			<UserDetailsModal user={selectedUser} />
			<UserFormModal 
				user={editUser} 
				onSuccess={handleFormSuccess} 
				onCancel={() => setEditUser(null)} 
			/>
		</div>
	);
}