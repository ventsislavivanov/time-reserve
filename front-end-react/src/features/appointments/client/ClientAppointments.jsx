import { useState } from 'react';
import { useNavigate } from 'react-router';
import { UICard, UIButton } from '../../../components/common/ui/index.js';
import AppointmentCard from './components/AppointmentCard.jsx';
import CancelAppointmentModal from './components/modals/CancelAppointmentModal.jsx';
import { useClientAppointments } from './hooks/useClientAppointments.js';
import { useBootstrapModal } from "../../../hooks/index.js";
import AppointmentDetailsModal from "./components/modals/AppointmentDetailsModal.jsx";

const TABS = [
	{ id: 'upcoming', label: 'Upcoming' },
	{ id: 'past', label: 'Past' },
];

const ClientAppointments = () => {
	const navigate = useNavigate();
	const { appointments, isLoading, cancelAppointment, isCancelling } = useClientAppointments();
	const { showModal, hideModal } = useBootstrapModal();

	const [activeTab, setActiveTab] = useState('upcoming');
	const [canceling, setCanceling] = useState(null);
	const [details, setDetails] = useState(null);

	const openCancel = (appointment) => {
		setCanceling(appointment);
		setTimeout(() => showModal('cancelAppointmentModal'), 10);
	};

	const closeCancel = () => {
		hideModal('cancelAppointmentModal');
		setCanceling(null);
	};

	const confirmCancel = async (reason) => {
		await cancelAppointment(canceling.id, reason);
		closeCancel();
	};

	const openDetails = (appointment) => {
		setDetails(appointment);
		setTimeout(() => showModal('appointmentDetailsModal'), 10);
	};

	const closeDetails = () => {
		hideModal('appointmentDetailsModal');
		setDetails(null);
	};

	const now = new Date();

	const upcoming = appointments.filter(
		a =>
			new Date(a.date) >= now &&
			a.status !== 'cancelled' &&
			a.status !== 'declined'
	);

	const past = appointments.filter(
		a =>
			new Date(a.date) < now ||
			a.status === 'cancelled' ||
			a.status === 'declined'
	);

	const displayed = activeTab === 'upcoming' ? upcoming : past;

	if (isLoading) {
		return (
			<div className="container py-5">
				<div className="row justify-content-center">
					<div className="col-lg-10">
						<div className="placeholder-glow text-center mb-4">
							<span className="placeholder col-4"></span>
						</div>
						<div className="row g-3">
							{[...Array(4)].map((_, i) => (
								<div key={i} className="col-md-6">
									<UICard>
										<div className="placeholder-glow">
											<span className="placeholder col-8 mb-2"></span>
											<span className="placeholder col-5 mb-2"></span>
											<span className="placeholder col-6"></span>
										</div>
									</UICard>
								</div>
							))}
						</div>
					</div>
				</div>
			</div>
		);
	}

	return (
		<div className="container py-5">
			<div className="row justify-content-center">
				<div className="col-lg-10">

					<div className="text-center mb-4">
						<h2>My Appointments</h2>
						<p className="text-muted">Manage all your bookings in one place</p>
					</div>

					<ul className="nav nav-tabs mb-4">
						{TABS.map(tab => (
							<li key={tab.id} className="nav-item">
								<button
									className={`nav-link ${activeTab === tab.id ? 'active' : ''}`}
									onClick={() => setActiveTab(tab.id)}
								>
									{tab.label}
									<span className="badge ms-2 bg-primary">
                                        {tab.id === 'upcoming' ? upcoming.length : past.length}
                                    </span>
								</button>
							</li>
						))}
					</ul>

					{displayed.length === 0 ? (
						<UICard>
							<div className="text-center py-5">
								<i className="bi bi-calendar-x fs-1 text-muted mb-3 d-block"></i>
								<h5 className="text-muted">
									{activeTab === 'upcoming'
										? 'No upcoming appointments'
										: 'No past appointments'}
								</h5>
								{activeTab === 'upcoming' && (
									<UIButton className="mt-3" onClick={() => navigate('/our-team')}>
										Choose our services
									</UIButton>
								)}
							</div>
						</UICard>
					) : (
						<div className="row g-3">
							{displayed.map(appointment => (
								<div key={appointment.id} className="col-md-6">
									<AppointmentCard
										appointment={appointment}
										onCancel={openCancel}
										onViewDetails={openDetails}
									/>
								</div>
							))}
						</div>
					)}
				</div>
			</div>

			<CancelAppointmentModal
				appointment={canceling}
				onClose={closeCancel}
				onConfirm={confirmCancel}
				isCancelling={isCancelling}
			/>

			<AppointmentDetailsModal
				appointment={details}
				onClose={closeDetails}
			/>
		</div>
	);
};

export default ClientAppointments;