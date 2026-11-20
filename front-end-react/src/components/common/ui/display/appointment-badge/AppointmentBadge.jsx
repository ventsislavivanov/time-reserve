import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Badge } from "@/components/ui/badge";

const STATUS_CONFIG = {
	pending:	 { variant: 'warning', icon: 'clock',          label: 'Pending'     },
	cancelled:	 { variant: 'danger',  icon: 'times-circle',   label: 'Cancelled'   },
	declined:	 { variant: 'danger',  icon: 'times-circle',   label: 'Declined'    },
	confirmed:	 { variant: 'primary', icon: 'check-circle',   label: 'Confirmed'   },
	in_progress: { variant: 'warning', icon: 'hourglass-half', label: 'In progress' },
	completed:	 { variant: 'success', icon: 'check-circle',   label: 'Completed'   },
	no_show:	 { variant: 'muted',   icon: 'times-circle',   label: 'No Show'     },
	expired:	 { variant: 'muted',   icon: 'hourglass',      label: 'Expired'     },
	timed_out:	 { variant: 'muted',   icon: 'hourglass',      label: 'Timed out'   },
};

const AppointmentBadge = ({ status }) => {
	const config = STATUS_CONFIG[status] ?? {
		variant: 'muted',
		icon: 'circle',
		label: status,
	};

	return (
		<Badge variant={config.variant}>
			<FontAwesomeIcon icon={config.icon} />
			{config.label}
		</Badge>
	);
};

export default AppointmentBadge;
