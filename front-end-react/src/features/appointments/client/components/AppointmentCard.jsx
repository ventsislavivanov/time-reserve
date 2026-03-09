import { UICard, UIButton, UIAppointmentBadge } from '../../../../components/common/ui/index.js';

const AppointmentCard = ({ appointment, onCancel }) => {
	const {
		id,
		worker,
		service,
		date,
		time,
		status,
		notes,
	} = appointment;

	const startTime = time?.split(' - ')[0];
	const isPast = new Date(`${date}T${startTime}`) < new Date();
	const isCancellable = !isPast && (status === 'pending' || status === 'confirmed');

	const formatDate = (dateStr) => {
		return new Date(dateStr).toLocaleDateString('en-GB', {
			weekday: 'long',
			year: 'numeric',
			month: 'long',
			day: 'numeric',
		});
	};

	return (
		<UICard className="h-100">
			<div className="d-flex justify-content-between align-items-start mb-3">
				<div>
					<h5 className="mb-1">{service?.name}</h5>
					<p className="text-muted mb-0 small">with {worker?.name}</p>
					{worker?.job_position && (
						<p className="text-muted mb-0 small">{worker.job_position.name}</p>
					)}
				</div>
				<UIAppointmentBadge status={status} />
			</div>

			<hr className="my-2" />

			<div className="row g-2 mb-3">
				<div className="col-12">
					<div className="d-flex align-items-center gap-2">
						<i className="bi bi-calendar3 text-primary"></i>
						<span className="small">{formatDate(date)}</span>
					</div>
				</div>
				<div className="col-12">
					<div className="d-flex align-items-center gap-2">
						<i className="bi bi-clock text-primary"></i>
						<span className="small">{time}</span>
					</div>
				</div>
				{service?.duration && (
					<div className="col-12">
						<div className="d-flex align-items-center gap-2">
							<i className="bi bi-hourglass-split text-primary"></i>
							<span className="small">{service.duration} min</span>
						</div>
					</div>
				)}
				{service?.price && (
					<div className="col-12">
						<div className="d-flex align-items-center gap-2">
							<i className="bi bi-tag text-primary"></i>
							<span className="small">{service.price} €</span>
						</div>
					</div>
				)}
			</div>

			{notes && (
				<div className="alert alert-light py-2 px-3 small mb-3">
					<i className="bi bi-chat-left-text me-2 text-muted"></i>
					{notes}
				</div>
			)}

			{isCancellable && (
				<div className="d-flex justify-content-end mt-auto">
					<UIButton
						variant="outline-danger"
						size="sm"
						onClick={() => onCancel(id)}
					>
						Cancel Appointment
					</UIButton>
				</div>
			)}
		</UICard>
	);
};

export default AppointmentCard;