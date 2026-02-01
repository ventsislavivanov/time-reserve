import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { UILoading, UIButton, UIPagination } from "../../../components/common/ui";
import { useBootstrapModal } from "../../../hooks";
import UserFilters from "./UserFilters.jsx";
import UserRow from "./UserRow.jsx";
import { UserDetailsModal, UserFormModal } from "./modals";
import useUsers from "../hooks/useUsers";

export default function ManageUsers() {
	const {
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
		toggleActive,
		fetchUsers
	} = useUsers();

	const [selectedUser, setSelectedUser] = useState(null);
	const [editUser, setEditUser] = useState(null);

	const { showModal, hideModal } = useBootstrapModal();

	const roleBadgeMap = {
		admin: 'bg-primary',
		worker: 'bg-info',
		client: 'bg-secondary'
	};

	const openDetails = (user) => {
		setSelectedUser(user);
		setTimeout(() => showModal('userDetailsModal'), 10);
	};

	const handleCreate = () => {
		setEditUser(null);
		setTimeout(() => showModal('userFormModal'), 10);
	};

	const handleEdit = (user) => {
		setEditUser(user);
		setTimeout(() => showModal('userFormModal'), 10);
	};

	const handleFormSuccess = () => {
		hideModal('userFormModal');
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
					<UIButton
						size="sm"
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
				onFilterChange={(key, value) =>
					setFilters(prev => ({ ...prev, [key]: value }))
				}
				onReset={() =>
					setFilters({ search: "", role: "", gender: "" })
				}
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
						{users && users.length > 0 ? (
							users.map(user => (
								<UserRow
									key={`user-${user.id}`}
									user={user}
									roleBadgeMap={roleBadgeMap}
									onToggleActive={toggleActive}
									onViewDetails={openDetails}
									onEdit={handleEdit}
								/>
							))
						) : (
							<tr>
								<td colSpan="5" className="text-center py-4 text-muted">
									No users found
								</td>
							</tr>
						)}
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