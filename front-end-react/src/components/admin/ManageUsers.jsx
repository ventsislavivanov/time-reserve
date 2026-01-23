import React, { useEffect, useState } from "react";
import { getUsers, toggleUserActive } from "../../services/userService.js";
import Loading from "../loading/Loading";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Modal } from "bootstrap";

export default function ManageUsers() {
	const [users, setUsers] = useState([]);
	const [loading, setLoading] = useState(true);

	const genderIconMap = {
		male: { icon: 'mars', color: 'text-info' },
		female: { icon: 'venus', color: 'text-danger' },
		other: { icon: 'genderless', color: 'text-secondary' },
	};

	const roleBadgeMap = {
		admin: 'bg-primary',
		worker: 'bg-info',
		client: 'bg-secondary'
	};

	useEffect(() => {
		fetchUsers();
	}, []);

	const fetchUsers = async () => {
		try {
			const data = await getUsers();
			setUsers(data);
		} catch (error) {
			console.error("Error loading users", error);
		} finally {
			setLoading(false);
		}
	};

	const handleToggleActive = async (id) => {
		try {
			const response = await toggleUserActive(id);
			setUsers(users.map(u => u.id === id ? response.user : u));
		} catch (error) {
			// Вече имаме глобален Toast, затова не е нужно alert
		}
	};

	if (loading) return <Loading />;

	const StatusBadge = ({ condition, trueText = "Yes", falseText = "No" }) => (
		<span className={`badge rounded-pill ${condition ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger'}`} style={{ fontSize: '0.75rem' }}>
            <FontAwesomeIcon icon={condition ? 'check-circle' : 'times-circle'} className="me-1" />
			{condition ? trueText : falseText}
        </span>
	);

	return (
		<div className="container mt-4">
			<div className="d-flex justify-content-between align-items-center mb-4">
				<h3 className="fw-bold text-primary m-0">
					<FontAwesomeIcon icon="users-cog" className="me-2" />
					Manage Users
				</h3>
				<span className="badge bg-light text-dark shadow-sm border">
                    Total: {users.length} users
                </span>
			</div>

			<div className="card shadow-sm border-0 rounded-3 overflow-hidden">
				<div className="table-responsive">
					<table className="table table-hover align-middle mb-0 table-striped" style={{ fontSize: '0.875rem' }}>
						<thead className="bg-light text-secondary text-uppercase" style={{ fontSize: '0.75rem', letterSpacing: '0.05em' }}>
						<tr>
							<th className="ps-4 py-3">User info</th>
							<th className="py-3">Contacts</th>
							<th className="text-center py-3">Gender</th>
							<th className="text-center py-3">Role</th>
							<th className="text-center py-3">Verification</th>
							<th className="text-center py-3">Status</th>
							<th className="pe-4 text-center py-3">Actions</th>
						</tr>
						</thead>
						<tbody>
						{users.map(user => {
							const gender = genderIconMap[user.gender] || genderIconMap.other;
							return (
								<tr key={user.id} className={!user.is_active ? "bg-light opacity-75" : ""}>
									<td className="ps-4 py-3">
										<div className="d-flex align-items-center">
											<div className={`rounded-circle bg-opacity-10 d-flex align-items-center justify-content-center me-3 ${user.is_active ? 'bg-primary text-primary' : 'bg-secondary text-secondary'}`} style={{ width: '38px', height: '38px' }}>
												<FontAwesomeIcon icon="user" />
											</div>
											<div>
												<div className="fw-bold text-dark">{user.name}</div>
												<div className="text-muted small">ID: #{user.id}</div>
											</div>
										</div>
									</td>
									<td className="py-3">
										<div className="d-flex flex-column">
											<span className="text-dark mb-1"><FontAwesomeIcon icon="envelope" className="me-2 small opacity-50" />{user.email}</span>
											<span className="text-muted small"><FontAwesomeIcon icon="phone" className="me-2 small opacity-50" />{user.phone}</span>
										</div>
									</td>
									<td className="text-center py-3">
										<FontAwesomeIcon icon={gender.icon} className={gender.color} style={{ fontSize: '1.1rem' }} title={user.gender} />
									</td>
									<td className="text-center py-3">
                                            <span className={`badge ${roleBadgeMap[user.role] || 'bg-secondary'}`} style={{ minWidth: '70px' }}>
                                                {user.role}
                                            </span>
									</td>
									<td className="text-center py-3">
										<StatusBadge condition={user.email_verified_at !== null} trueText="Verified" falseText="Unverified" />
									</td>
									<td className="text-center py-3">
										<div className="d-flex flex-column gap-1 align-items-center">
											<StatusBadge condition={user.is_active} trueText="Active" falseText="Blocked" />
											<StatusBadge condition={user.is_approved} trueText="Approved" falseText="Pending" />
										</div>
									</td>
									<td className="pe-4 text-center py-3">
										<div className="d-flex justify-content-center gap-2">
											<button
												className={`btn btn-sm shadow-sm rounded-pill px-3 ${user.is_active ? 'btn-outline-danger' : 'btn-success'}`}
												onClick={() => handleToggleActive(user.id)}
												style={{ transition: 'all 0.3s ease' }}
											>
												<FontAwesomeIcon icon={user.is_active ? 'user-slash' : 'user-check'} className="me-1" />
												{user.is_active ? 'Block' : 'Active'}
											</button>
											<button className="btn btn-sm btn-light border shadow-sm rounded-circle" style={{ width: '32px', height: '32px' }}>
												<FontAwesomeIcon icon="pen" className="text-primary small" />
											</button>
										</div>
									</td>
								</tr>
							);
						})}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	);
}