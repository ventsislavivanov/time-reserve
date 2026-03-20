import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const STATUS_CONFIG = {
	pending:	 { bg: 'bg-warning-subtle',   text: 'text-warning',   icon: 'clock',         label: 'Pending'     },
	cancelled:	 { bg: 'bg-danger-subtle',    text: 'text-danger',    icon: 'times-circle',  label: 'Cancelled'   },
	declined:	 { bg: 'bg-danger-subtle',    text: 'text-danger',    icon: 'times-circle',  label: 'Declined'    },
	confirmed:	 { bg: 'bg-primary-subtle',   text: 'text-primary',   icon: 'check-circle',  label: 'Confirmed'   },
	in_progress: { bg: 'bg-danger-subtle',    text: 'text-warning',   icon: 'times-circle',  label: 'In progress' },
	completed:	 { bg: 'bg-success-subtle',   text: 'text-success',   icon: 'check-circle',  label: 'Completed'   },
	no_show:	 { bg: 'bg-secondary-subtle', text: 'text-secondary', icon: 'times-circle',  label: 'No Show'     },
	expired:	 { bg: 'bg-secondary-subtle', text: 'text-secondary', icon: 'hourglass-end', label: 'Expired'     },
};

const AppointmentBadge = ({ status }) => {
	const config = STATUS_CONFIG[status] ?? {
		bg: 'bg-secondary-subtle',
		text: 'text-secondary',
		icon: 'circle',
		label: status,
	};

	return (
		<span
			className={`badge rounded-pill ${config.bg} ${config.text}`}
			style={{ fontSize: '0.75rem' }}
		>
            <FontAwesomeIcon icon={config.icon} className="me-1" />
			{config.label}
        </span>
	);
};

export default AppointmentBadge;