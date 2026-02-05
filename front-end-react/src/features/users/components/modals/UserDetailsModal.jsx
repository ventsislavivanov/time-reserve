import { useState } from 'react';
import { UIModal, UIButton, UIStatusBadge } from '../../../../components/common/ui';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import WorkerServicesManager from '../WorkerServicesManager';

const UserDetailsModal = ({ user }) => {
	const [activeTab, setActiveTab] = useState('info');

	if (!user) return null;

	const roleBadgeMap = {
		admin: 'bg-primary',
		worker: 'bg-info',
		client: 'bg-secondary'
	};

	return (
		<UIModal
			id="userDetailsModal"
			title="User Details"
			icon="user"
			size="modal-lg"
			key={user?.id}
		>
			<ul className="nav nav-tabs mb-3">
				<li className="nav-item">
					<button
						className={`nav-link ${activeTab === 'info' ? 'active' : ''}`}
						onClick={() => setActiveTab('info')}
					>
						<FontAwesomeIcon icon="info-circle" className="me-2" />
						Information
					</button>
				</li>
				{user.role === 'worker' && (
					<li className="nav-item">
						<button
							className={`nav-link ${activeTab === 'services' ? 'active' : ''}`}
							onClick={() => setActiveTab('services')}
						>
							<FontAwesomeIcon icon="concierge-bell" className="me-2" />
							Services
						</button>
					</li>
				)}
			</ul>

			<div className="tab-content">
				{activeTab === 'info' && (
					<div>
						<div className="text-center mb-4 pb-3 border-bottom">
							<div className={`rounded-circle bg-opacity-10 d-inline-flex align-items-center justify-content-center mb-3 ${user.is_active ? 'bg-primary text-primary' : 'bg-secondary text-secondary'}`}
								 style={{ width: '80px', height: '80px', fontSize: '2rem' }}
							>
								<FontAwesomeIcon icon="user" />
							</div>
							<h4 className="mb-2 fw-bold">{user.name}</h4>
							<div className="d-flex gap-2 justify-content-center mb-2">
                                <span className={`badge ${roleBadgeMap[user.role] || 'bg-secondary'}`}>
                                    {user.role}
                                </span>
								<UIStatusBadge
									condition={user.is_active}
									trueText="Active"
									falseText="Blocked"
								/>
								<UIStatusBadge
									condition={user.is_approved}
									trueText="Approved"
									falseText="Pending"
								/>
							</div>
						</div>

						{/* User Information */}
						<div className="row g-3">
							<div className="col-md-6">
								<div className="card border-0 bg-light h-100">
									<div className="card-body">
										<h6 className="text-muted mb-3">
											<FontAwesomeIcon icon="address-card" className="me-2" />
											Personal Info
										</h6>
										<div className="mb-2">
											<small className="text-muted d-block">Full Name</small>
											<strong>{user.name}</strong>
										</div>
										<div className="mb-2">
											<small className="text-muted d-block">Gender</small>
											<strong className="text-capitalize">{user.gender}</strong>
										</div>
										<div className="mb-2">
											<small className="text-muted d-block">Birth Date</small>
											<strong>{user.birth_date || 'Not provided'}</strong>
										</div>
									</div>
								</div>
							</div>

							<div className="col-md-6">
								<div className="card border-0 bg-light h-100">
									<div className="card-body">
										<h6 className="text-muted mb-3">
											<FontAwesomeIcon icon="envelope" className="me-2" />
											Contact Info
										</h6>
										<div className="mb-2">
											<small className="text-muted d-block">Email</small>
											<strong>{user.email}</strong>
										</div>
										<div className="mb-2">
											<small className="text-muted d-block">Phone</small>
											<strong>{user.phone || 'Not provided'}</strong>
										</div>
										<div className="mb-2">
											<small className="text-muted d-block">User ID</small>
											<strong>#{user.id}</strong>
										</div>
									</div>
								</div>
							</div>

							{user.role === 'worker' && user.job_position && (
								<div className="col-12">
									<div className="card border-0 bg-light">
										<div className="card-body">
											<h6 className="text-muted mb-3">
												<FontAwesomeIcon icon="briefcase" className="me-2" />
												Job Position
											</h6>
											<div className="d-flex align-items-center">
												<div className="badge bg-info bg-opacity-10 text-info p-3 me-3">
													<FontAwesomeIcon icon="briefcase" size="2x" />
												</div>
												<div>
													<strong className="d-block">{user.job_position.name}</strong>
													<small className="text-muted">Position ID: #{user.job_position.id}</small>
												</div>
											</div>
										</div>
									</div>
								</div>
							)}

							<div className="col-12">
								<div className="card border-0 bg-light">
									<div className="card-body">
										<h6 className="text-muted mb-3">
											<FontAwesomeIcon icon="clock" className="me-2" />
											Account Info
										</h6>
										<div className="row">
											<div className="col-md-4">
												<small className="text-muted d-block">Created At</small>
												<strong>{new Date(user.created_at).toLocaleDateString()}</strong>
											</div>
											<div className="col-md-4">
												<small className="text-muted d-block">Email Verified</small>
												<strong>
													{user.email_verified_at ? (
														<span className="text-success">
                                                            <FontAwesomeIcon icon="check-circle" className="me-1" />
                                                            Verified
                                                        </span>
													) : (
														<span className="text-warning">
                                                            <FontAwesomeIcon icon="exclamation-circle" className="me-1" />
                                                            Not Verified
                                                        </span>
													)}
												</strong>
											</div>
											<div className="col-md-4">
												<small className="text-muted d-block">Status</small>
												<strong>
													<UIStatusBadge
														condition={user.is_active}
														trueText="Active"
														falseText="Inactive"
													/>
												</strong>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				)}

				{activeTab === 'services' && user.role === 'worker' && (
					<WorkerServicesManager workerId={user.id} />
				)}
			</div>
		</UIModal>
	);
};

export default UserDetailsModal;