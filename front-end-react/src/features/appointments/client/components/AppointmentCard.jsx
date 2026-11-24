import { CalendarDays, Clock, MessageSquareText } from 'lucide-react';
import { UICard, UIButton, UIAppointmentBadge } from '../../../../components/common/ui/index.js';

const AppointmentCard = ({ appointment, onCancel, onViewDetails }) => {
	const {
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

	const canViewDetails = status === 'confirmed' || status === 'completed';

	return (
		<UICard className="h-full" bodyClassName="flex h-full flex-col gap-4">
			<div className="flex items-start justify-between gap-3">
				<div>
					<h4>{service?.name}</h4>
					<p className="text-sm text-muted-foreground">with {worker?.name}</p>
					{worker?.job_position && (
						<p className="text-sm text-muted-foreground">{worker.job_position.name}</p>
					)}
				</div>
				<UIAppointmentBadge status={status} />
			</div>

			<div className="space-y-2 border-t pt-4 text-sm">
				<div className="flex items-center gap-2">
					<CalendarDays className="size-4 text-primary" />
					<span>{formatDate(date)}</span>
				</div>
				<div className="flex items-center gap-2">
					<Clock className="size-4 text-primary" />
					<span>{time}</span>
				</div>
			</div>

			{notes && (
				<div className="flex gap-2 rounded-lg bg-muted/60 px-3 py-2 text-sm">
					<MessageSquareText className="mt-0.5 size-4 shrink-0 text-muted-foreground" />
					{notes}
				</div>
			)}

			{(canViewDetails || isCancellable) && (
				<div className="mt-auto flex justify-end gap-2">
					{canViewDetails && (
						<UIButton
							variant="outline-info"
							size="sm"
							onClick={() => onViewDetails(appointment)}
						>
							View details
						</UIButton>
					)}

					{isCancellable && (
						<UIButton
							variant="outline-danger"
							size="sm"
							onClick={() => onCancel(appointment)}
						>
							Cancel
						</UIButton>
					)}
				</div>
			)}
		</UICard>
	);
};

export default AppointmentCard;
