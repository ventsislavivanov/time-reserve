import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export default function UserDetailsModal({ user }) {
	if (!user) return null;

	const genderIconMap = {
		male: { icon: 'mars', color: 'text-info' },
		female: { icon: 'venus', color: 'text-danger' },
		other: { icon: 'genderless', color: 'text-secondary' },
	};

	const StatusBadge = ({ condition, trueText = "Yes", falseText = "No" }) => (
		<span className={`badge rounded-pill ${condition ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger'}`}
			  style={{ fontSize: '0.75rem' }}
		>
            <FontAwesomeIcon icon={condition ? 'check-circle' : 'times-circle'} className="me-1" />
			{condition ? trueText : falseText}
        </span>
	);

	return (
		<div className="modal fade" id="userDetailsModal" tabIndex="-1" aria-hidden="true">
			<div className="modal-dialog modal-dialog-centered">
				<div className="modal-content border-0 shadow">
					<div className="modal-header bg-primary text-white border-0">
						<h5 className="modal-title fw-bold">User details</h5>
						<button type="button"
								className="btn-close btn-close-white"
								data-bs-dismiss="modal"
								aria-label="Close"
						></button>
					</div>
					<div className="modal-body p-4">
						<div className="text-center">
							<div className="bg-primary bg-opacity-10 text-primary rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3
								"
								 style={{width: '80px', height: '80px', fontSize: '2rem'}}
							>
								<FontAwesomeIcon icon="user" />
							</div>
							<h4 className="fw-bold mb-1">{user.name}</h4>
							<p className="text-muted mb-4">{user.role.toUpperCase()}</p>

							<div className="row text-start g-3">
								<div className="col-6">
									<label className="small text-muted d-block">Email</label>
									<span className="fw-medium text-truncate d-block">{user.email}</span>
								</div>
								<div className="col-6">
									<label className="small text-muted d-block">Phone</label>
									<span className="fw-medium">{user.phone || 'N/A'}</span>
								</div>
								<div className="col-6">
									<label className="small text-muted d-block">Gender</label>
									<span className="fw-medium text-capitalize">
                                        <FontAwesomeIcon icon={genderIconMap[user.gender]?.icon || 'genderless'} className="me-2 opacity-50" />
										{user.gender}
                                    </span>
								</div>
								<div className="col-6">
									<label className="small text-muted d-block">Birth Date</label>
									<span className="fw-medium">{user.birth_date || 'N/A'}</span>
								</div>
								<div className="col-12 mt-3 pt-3 border-top">
									<div className="d-flex justify-content-between align-items-center mb-2">
										<span className="small text-muted">Verified email</span>
										<StatusBadge condition={user.email_verified_at !== null} trueText="Yes" falseText="No" />
									</div>
									<div className="d-flex justify-content-between align-items-center mb-2">
										<span className="small text-muted">Approved account</span>
										<StatusBadge condition={user.is_approved} trueText="Yes" falseText="No" />
									</div>
									<div className="d-flex justify-content-between align-items-center">
										<span className="small text-muted">Account status</span>
										<StatusBadge condition={user.is_active} trueText="Active" falseText="Blocked" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	);
}