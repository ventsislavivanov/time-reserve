import { Link, useNavigate } from "react-router";
import { CheckCircle2, User } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { UICard } from '../../../components/common/ui';

const WorkerCard = ({ worker }) => {
	const navigate = useNavigate();

	const handleBooking = () => {
		navigate(`/our-team/book/${worker.id}`);
	};

	return (
		<UICard
			className="h-full transition-shadow hover:shadow-md"
			bodyClassName="flex h-full flex-col"
		>
			<div className="mb-5 flex items-center gap-4">
				<div className="flex size-14 shrink-0 items-center justify-center rounded-full bg-primary text-primary-foreground">
					<User className="size-6" />
				</div>
				<div>
					<h3 className="text-lg">{worker.name}</h3>
					{worker.job_position && (
						<p className="text-sm text-muted-foreground">{worker.job_position.name}</p>
					)}
				</div>
			</div>

			<div className="mb-6 flex-1">
				<h4 className="mb-2 text-xs font-semibold uppercase tracking-wider text-muted-foreground">Services</h4>
				{worker.services && worker.services.length > 0 ? (
					<ul className="space-y-2">
						{worker.services.slice(0, 3).map(service => (
							<li key={service.id} className="flex items-center gap-2 text-sm">
								<CheckCircle2 className="size-4 shrink-0 text-primary" />
								<span className="flex-1">{service.name}</span>
								<Badge variant="muted">{service.price} € • {service.duration} min</Badge>
							</li>
						))}
						{worker.services.length > 3 && (
							<li className="text-sm text-muted-foreground">
								+{worker.services.length - 3} more services
							</li>
						)}
					</ul>
				) : (
					<p className="text-sm text-muted-foreground">No services available</p>
				)}
			</div>

			<div className="grid gap-2">
				<Button variant="outline" asChild>
					<Link to={`/our-team/${worker.id}`}>View profile</Link>
				</Button>
				<Button onClick={handleBooking}>Book appointment</Button>
			</div>
		</UICard>
	);
};

export default WorkerCard;
