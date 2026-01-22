import React, { useEffect, useState } from "react";
import { getUsers, toggleUserActive } from "../../services/userService.js";
import Loading from "../loading/Loading";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export default function ManageUsers() {
	const [users, setUsers] = useState([]);
	const [loading, setLoading] = useState(true);

	const genderIconMap = {
		male: 'mars',
		female: 'venus',
		other: 'genderless',
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
			alert(error.response?.data?.message || "Error changing user status. Please try again later.");
		}
	};

	const handleEditUser = async (id) => {

	}

	if (loading) return <Loading />;

	return (
		<div className="container mt-4">
			<h3>Manage users</h3>
			<div className="table-responsive mt-3">
				<table className="table table-hover table-striped align-middle">
					<thead className="table-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th className={'text-center'}>Gender</th>
						<th className={'text-center'}>Role</th>
						<th className={'text-center'}>Verified email</th>
						<th className={'text-center'}>Active</th>
						<th className={'text-center'}>Approve</th>
						<th className={'text-center'}>Action</th>
					</tr>
					</thead>
					<tbody>
					{users.map(user => (
						<tr key={user.id} className={!user.is_active ? "table-light text-muted" : ""}>
							<td>{user.id}</td>
							<td>{user.name}</td>
							<td>{user.email}</td>
							<td>{user.phone}</td>
							<td className={'text-center'}>
								<FontAwesomeIcon icon={genderIconMap[user.gender] ?? 'genderless'}
												 className={'text-primary'}
												 style={{ fontSize: '1.25rem' }}
								/>
							</td>
							<td className={'text-center'}><span className="badge bg-secondary">{user.role}</span></td>
							<td className={'text-center'}>
								{user.email_verified_at !== null
									? <span className="text-success fw-bold">Yes</span>
									: <span className="text-danger fw-bold">No</span>
								}
							</td>
							<td className={'text-center'}>
								{user.is_active
									? <span className="text-success fw-bold">Yes</span>
									: <span className="text-danger fw-bold">No</span>
								}
							</td>
							<td className={'text-center'}>
								{
									user.is_approved
										? <span className="text-success fw-bold">Yes</span>
										: <span className="text-danger fw-bold">No</span>
								}
							</td>
							<td className={'text-center'}>
								<button
									className={`btn btn-sm`}
									onClick={() => handleToggleActive(user.id)}
								>
									<FontAwesomeIcon icon={user.is_active ? 'ban' : 'user'}
													 className={'text-primary'}
									/>
									{
										user.is_active
											? ' Deactivate'
											: ' Activate'
									}
								</button>

								<button
									className={`btn btn-sm`}
									onClick={() => handleEditUser(user.id)}
								>
									<FontAwesomeIcon icon={'user-pen'} className={'text-primary'} />
									Edit
								</button>
							</td>
						</tr>
					))}
					</tbody>
				</table>
			</div>
		</div>
	);
}