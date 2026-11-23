import { Link, useNavigate, useParams } from 'react-router';
import { User } from 'lucide-react';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { UICard, UILoading } from '../../components/common/ui';
import { useWorker } from './hooks/useWorker.js';

const WorkerDetails = () => {
	const { workerId } = useParams();
	const navigate = useNavigate();
	const { worker, isLoading, error } = useWorker(workerId);

	if (isLoading) {
		return <UILoading />;
	}

	if (error || !worker) {
		return (
			<div className="mx-auto w-full max-w-4xl space-y-4 px-4 py-12">
				<div className="rounded-lg border border-destructive/30 bg-destructive/10 px-4 py-3 text-sm text-destructive" role="alert">
					{error && error !== 'not-found'
						? `Error loading team member: ${error}`
						: 'This team member was not found.'}
				</div>
				<Button variant="outline" asChild><Link to="/our-team">Back to our team</Link></Button>
			</div>
		);
	}

	return (
		<div className="mx-auto w-full max-w-4xl px-4 py-12">
			<UICard>
				<div className="mb-8 flex items-center gap-5">
					<div className="flex size-20 items-center justify-center rounded-full bg-primary text-primary-foreground">
						<User className="size-9" />
					</div>
					<div>
						<h1 className="text-3xl">{worker.name}</h1>
						{worker.job_position && (
							<p className="text-muted-foreground">{worker.job_position.name}</p>
						)}
					</div>
				</div>

				<h2 className="mb-3 text-sm font-semibold uppercase tracking-wider text-muted-foreground">Services</h2>
				{worker.services && worker.services.length > 0 ? (
					<ul className="mb-8 divide-y rounded-xl border">
						{worker.services.map(service => (
							<li
								key={service.id}
								className="flex items-center justify-between gap-3 px-4 py-3"
							>
								<Link to={`/services/${service.id}`} className="font-medium hover:text-primary">{service.name}</Link>
								<Badge variant="muted">
									{service.price} € • {service.duration} min
								</Badge>
							</li>
						))}
					</ul>
				) : (
					<p className="mb-8 text-muted-foreground">No services available.</p>
				)}

				<div className="flex flex-wrap gap-2">
					<Button onClick={() => navigate(`/our-team/book/${worker.id}`)}>
						Book appointment
					</Button>
					<Button variant="outline" asChild><Link to="/our-team">Back to our team</Link></Button>
				</div>
			</UICard>
		</div>
	);
};

export default WorkerDetails;
