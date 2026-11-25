import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Badge } from "@/components/ui/badge";
import { appointmentStatusLabel } from "./statusLabels.js";

const STATUS_CONFIG = {
	pending:	 { variant: 'warning', icon: 'clock'          },
	cancelled:	 { variant: 'danger',  icon: 'times-circle'   },
	declined:	 { variant: 'danger',  icon: 'times-circle'   },
	confirmed:	 { variant: 'primary', icon: 'check-circle'   },
	in_progress: { variant: 'warning', icon: 'hourglass-half' },
	completed:	 { variant: 'success', icon: 'check-circle'   },
	no_show:	 { variant: 'muted',   icon: 'times-circle'   },
	expired:	 { variant: 'muted',   icon: 'hourglass'      },
	timed_out:	 { variant: 'muted',   icon: 'hourglass'      },
};

const AppointmentBadge = ({ status }) => {
	const config = STATUS_CONFIG[status] ?? { variant: 'muted', icon: 'circle' };

	return (
		<Badge variant={config.variant}>
			<FontAwesomeIcon icon={config.icon} />
			{appointmentStatusLabel(status)}
		</Badge>
	);
};

export default AppointmentBadge;
