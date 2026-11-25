import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import { UIButton, UIPagination, SkeletonTable } from "../../components/common/ui/index.js";
import { useBootstrapModal } from "../../hooks/index.js";
import { notify } from "../../services/index.js";

import UserFilters from "./components/UserFilters.jsx";
import UserRow from "./components/UserRow.jsx";
import { UserDetailsModal, UserFormModal } from "./components/modals/index.js";
import useUsers from "./hooks/useUsers.js";
import { toggleUserActive } from './services/userService.js';

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
		fetchUsers
	} = useUsers();

	const [selectedUser, setSelectedUser] = useState(null);
	const [editUser, setEditUser] = useState(null);

	const { showModal, hideModal } = useBootstrapModal();

	const roleBadgeMap = {
		admin: "default",
		worker: "primary",
		client: "muted"
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

	const handleToggleActive = async (userId) => {
		try {
			await toggleUserActive(userId);
			notify.success('User status updated');
			fetchUsers();
		} catch (error) {
			notify.error('Failed to update user status');
		}
	};

	if (isLoading) {
		return (
			<div className="mx-auto w-full max-w-7xl px-4 py-12">
				<SkeletonTable rows={15} columns={6} />
			</div>
		);

	}

	return (
		<div className="mx-auto w-full max-w-7xl px-4 mt-6 pb-12">
			<div className="flex justify-between items-center mb-6">
				<h1 className="flex items-center gap-2 text-2xl">
					<FontAwesomeIcon icon="users-cog" className="mr-2" />
					Manage Users
				</h1>
				<div className="flex gap-2">
					<UIButton
						size="sm"
						variant="success"
						onClick={handleCreate}
						icon="user-plus"
					>
						Add User
					</UIButton>
					<Badge variant="outline">Filtered: {users.length}</Badge>
					<Badge>Total: {totalItems}</Badge>
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

			<div className="overflow-hidden rounded-xl border bg-card shadow-sm">
				<div className="overflow-x-auto">
					<Table>
						<TableHeader>
						<TableRow>
							<TableHead className="pl-6 py-4">User info</TableHead>
							<TableHead className="py-4">Contacts</TableHead>
							<TableHead className="text-center py-4">Role</TableHead>
							<TableHead className="text-center py-4">Status</TableHead>
							<TableHead className="pr-6 text-center py-4">Actions</TableHead>
						</TableRow>
						</TableHeader>
						<TableBody>
						{users && users.length > 0 ? (
							users.map(user => (
								<UserRow
									key={`user-${user.id}`}
									user={user}
									roleBadgeMap={roleBadgeMap}
									onToggleActive={handleToggleActive}
									onViewDetails={openDetails}
									onEdit={handleEdit}
								/>
							))
						) : (
							<TableRow>
								<TableCell colSpan="5" className="text-center py-6 text-muted-foreground">
									No users found
								</TableCell>
							</TableRow>
						)}
						</TableBody>
					</Table>
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