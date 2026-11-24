import { useState } from 'react';
import { useNavigate } from 'react-router';
import { CalendarX } from 'lucide-react';
import { useBootstrapModal } from "../../../hooks";
import { UICard, UIButton } from '../../../components/common/ui';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { cn } from '@/lib/utils';
import AppointmentCard from './components/AppointmentCard.jsx';
import { useClientAppointments } from './hooks/useClientAppointments.js';
import { CancelAppointmentModal } from '../components/modals/';
import AppointmentDetailsModal from "./components/modals/AppointmentDetailsModal.jsx";

const TABS = [
	{ id: 'upcoming', label: 'Upcoming' },
	{ id: 'past', label: 'Past' },
];

const ClientAppointments = () => {
	const navigate = useNavigate();

	const {
		appointments,
		isLoading,
		isCancelling,
		cancelAppointment
	} = useClientAppointments();

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
			<div className="mx-auto w-full max-w-5xl px-4 py-12">
				<div className="mb-8 flex flex-col items-center gap-2">
					<Skeleton className="h-8 w-64" />
					<Skeleton className="h-4 w-48" />
				</div>
				<div className="grid gap-4 md:grid-cols-2">
					{[...Array(4)].map((_, i) => (
						<UICard key={i}>
							<div className="space-y-3">
								<Skeleton className="h-5 w-2/3" />
								<Skeleton className="h-4 w-1/2" />
								<Skeleton className="h-4 w-1/3" />
							</div>
						</UICard>
					))}
				</div>
			</div>
		);
	}

	return (
		<div className="mx-auto w-full max-w-5xl px-4 py-12">
			<div className="mb-8 text-center">
				<h1>My appointments</h1>
				<p className="mt-1 text-muted-foreground">Manage all your bookings in one place</p>
			</div>

			<div role="tablist" className="mb-6 flex gap-1 border-b">
				{TABS.map(tab => (
					<button
						key={tab.id}
						role="tab"
						aria-selected={activeTab === tab.id}
						className={cn(
							"-mb-px flex items-center gap-2 border-b-2 px-4 py-2 text-sm font-medium transition-colors",
							activeTab === tab.id
								? "border-primary text-primary"
								: "border-transparent text-muted-foreground hover:text-foreground"
						)}
						onClick={() => setActiveTab(tab.id)}
					>
						{tab.label}
						<Badge variant={activeTab === tab.id ? 'default' : 'muted'}>
							{tab.id === 'upcoming' ? upcoming.length : past.length}
						</Badge>
					</button>
				))}
			</div>

			{displayed.length === 0 ? (
				<UICard>
					<div className="flex flex-col items-center py-12 text-center">
						<CalendarX className="mb-4 size-10 text-muted-foreground" />
						<h3 className="text-muted-foreground">
							{activeTab === 'upcoming'
								? 'No upcoming appointments'
								: 'No past appointments'}
						</h3>
						{activeTab === 'upcoming' && (
							<UIButton className="mt-4" onClick={() => navigate('/our-team')}>
								Choose our services
							</UIButton>
						)}
					</div>
				</UICard>
			) : (
				<div className="grid gap-4 md:grid-cols-2">
					{displayed.map(appointment => (
						<AppointmentCard
							key={appointment.id}
							appointment={appointment}
							onCancel={openCancel}
							onViewDetails={openDetails}
						/>
					))}
				</div>
			)}

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
