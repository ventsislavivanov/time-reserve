import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import BaseModal from './BaseModal';
import WorkerServicesManager from '../admin/WorkerServicesManager';

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
		<BaseModal
			id="userDetailsModal"
			title="User Details"
			icon="id-card"
			size={user.role === 'worker' ? 'modal-lg' : 'modal-md'}
			centered={true}
		>
			<div className="text-center">
				<div className="bg-primary bg-opacity-10 text-primary rounded-circl"
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
							<FontAwesomeIcon icon={genderIconMap[user.gender]?.icon || 'genderless'}
											 className="me-2 opacity-50"
							/>
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
							<StatusBadge condition={user.email_verified_at !== null}
										 trueText="Yes"
										 falseText="No"
							/>
						</div>
						<div className="d-flex justify-content-between align-items-center mb-2">
							<span className="small text-muted">Approved account</span>
							<StatusBadge condition={user.is_approved}
										 trueText="Yes"
										 falseText="No"
							/>
						</div>
						<div className="d-flex justify-content-between align-items-center">
							<span className="small text-muted">Account status</span>
							<StatusBadge condition={user.is_active}
										 trueText="Active"
										 falseText="Blocked"
							/>
						</div>
					</div>
					{user.role === 'worker' && (
						<div className="col-12 mt-2">
							<WorkerServicesManager workerId={user.id} />
						</div>
					)}
				</div>
			</div>
		</BaseModal>
	);
}