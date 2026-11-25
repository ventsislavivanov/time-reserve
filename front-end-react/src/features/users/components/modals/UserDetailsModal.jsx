import { useState } from 'react';
import { Badge } from "@/components/ui/badge";
import { UIModal, UIStatusBadge, UINavTabLink } from '../../../../components/common/ui';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import WorkerServicesManager from '../WorkerServicesManager';

const UserDetailsModal = ({ user }) => {
	const [activeTab, setActiveTab] = useState('info');

	if (!user) return null;

	const roleBadgeMap = {
		admin: "default",
		worker: "primary",
		client: "muted"
	};

	return (
		<UIModal
			id="userDetailsModal"
			title="User Details"
			icon="user"
			size="modal-lg"
			key={user?.id}
		>
			<ul role="tablist" className="mb-4 flex gap-1 border-b">
				<UINavTabLink
					tabKey="info"
					activeTab={activeTab}
					onClick={setActiveTab}
					icon="info-circle"
				>
					Information
				</UINavTabLink>
				{user.role === 'worker' && (
					<UINavTabLink
						tabKey="services"
						activeTab={activeTab}
						onClick={setActiveTab}
						icon="concierge-bell"
					>
						Services
					</UINavTabLink>
				)}
			</ul>

			<div className="tab-content">
				{activeTab === 'info' && (
					<div>
						<div className="text-center mb-6 pb-4 border-b">
							<div className={`mb-4 inline-flex size-20 items-center justify-center rounded-full text-3xl ${user.is_active ? "bg-primary/10 text-primary" : "bg-muted text-muted-foreground"}`}>
								<FontAwesomeIcon icon="user" />
							</div>
							<h4 className="mb-2 font-bold">{user.name}</h4>
							<div className="flex gap-2 justify-center mb-2">
                                <Badge variant={roleBadgeMap[user.role] || "muted"} className="capitalize">{user.role}</Badge>
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
						<div className="grid grid-cols-12 gap-4">
							<div className="col-span-12 md:col-span-6">
								<div className="rounded-xl bg-muted/60 h-full">
									<div className="p-5">
										<h4 className="mb-4 text-sm font-semibold uppercase tracking-wider text-muted-foreground">
											<FontAwesomeIcon icon="address-card" className="mr-2" />
											Personal Info
										</h4>
										<div className="mb-2">
											<small className="block text-xs text-muted-foreground">Full Name</small>
											<strong>{user.name}</strong>
										</div>
										<div className="mb-2">
											<small className="block text-xs text-muted-foreground">Gender</small>
											<strong className="capitalize">{user.gender}</strong>
										</div>
										<div className="mb-2">
											<small className="block text-xs text-muted-foreground">Birth Date</small>
											<strong>{user.birth_date || 'Not provided'}</strong>
										</div>
									</div>
								</div>
							</div>

							<div className="col-span-12 md:col-span-6">
								<div className="rounded-xl bg-muted/60 h-full">
									<div className="p-5">
										<h4 className="mb-4 text-sm font-semibold uppercase tracking-wider text-muted-foreground">
											<FontAwesomeIcon icon="envelope" className="mr-2" />
											Contact Info
										</h4>
										<div className="mb-2">
											<small className="block text-xs text-muted-foreground">Email</small>
											<strong>{user.email}</strong>
										</div>
										<div className="mb-2">
											<small className="block text-xs text-muted-foreground">Phone</small>
											<strong>{user.phone || 'Not provided'}</strong>
										</div>
										<div className="mb-2">
											<small className="block text-xs text-muted-foreground">User ID</small>
											<strong>#{user.id}</strong>
										</div>
									</div>
								</div>
							</div>

							{user.role === 'worker' && user.job_position && (
								<div className="col-span-12">
									<div className="rounded-xl bg-muted/60">
										<div className="p-5">
											<h4 className="mb-4 text-sm font-semibold uppercase tracking-wider text-muted-foreground">
												<FontAwesomeIcon icon="briefcase" className="mr-2" />
												Job Position
											</h4>
											<div className="flex items-center">
												<div className="mr-4 flex size-12 items-center justify-center rounded-xl bg-primary/10 text-primary">
													<FontAwesomeIcon icon="briefcase" />
												</div>
												<div>
													<strong className="block">{user.job_position.name}</strong>
													<small className="text-muted-foreground">Position ID: #{user.job_position.id}</small>
												</div>
											</div>
										</div>
									</div>
								</div>
							)}

							<div className="col-span-12">
								<div className="rounded-xl bg-muted/60">
									<div className="p-5">
										<h4 className="mb-4 text-sm font-semibold uppercase tracking-wider text-muted-foreground">
											<FontAwesomeIcon icon="clock" className="mr-2" />
											Account Info
										</h4>
										<div className="grid grid-cols-12 gap-4">
											<div className="col-span-12 md:col-span-4">
												<small className="block text-xs text-muted-foreground">Created At</small>
												<strong>{new Date(user.created_at).toLocaleDateString()}</strong>
											</div>
											<div className="col-span-12 md:col-span-4">
												<small className="block text-xs text-muted-foreground">Email Verified</small>
												<strong>
													{user.email_verified ? (
														<span className="text-success">
                                                            <FontAwesomeIcon icon="check-circle" className="mr-1" />
                                                            Verified
                                                        </span>
													) : (
														<span className="text-warning">
                                                            <FontAwesomeIcon icon="exclamation-circle" className="mr-1" />
                                                            Not Verified
                                                        </span>
													)}
												</strong>
											</div>
											<div className="col-span-12 md:col-span-4">
												<small className="block text-xs text-muted-foreground">Status</small>
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