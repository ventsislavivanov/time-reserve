// Display names of the appointment statuses (the API sends the keys).
export const APPOINTMENT_STATUS_LABELS = {
	pending: 'Pending',
	confirmed: 'Confirmed',
	in_progress: 'In progress',
	completed: 'Completed',
	cancelled: 'Cancelled',
	declined: 'Declined',
	no_show: 'No Show',
	expired: 'Expired',
	timed_out: 'Timed out',
};

export const APPOINTMENT_STATUSES = Object.keys(APPOINTMENT_STATUS_LABELS);

export const appointmentStatusLabel = (status) => APPOINTMENT_STATUS_LABELS[status] ?? status;
