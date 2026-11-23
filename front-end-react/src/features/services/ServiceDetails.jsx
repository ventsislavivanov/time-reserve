import { Link, useParams } from 'react-router';
import { Clock } from 'lucide-react';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { UICard, UILoading } from '../../components/common/ui';
import { ReviewsSection } from '../reviews';
import { useServiceDetails } from './hooks/useServiceDetails.js';

const ServiceDetails = () => {
	const { serviceId } = useParams();
	const { service, isLoading, error } = useServiceDetails(serviceId);

	if (isLoading) {
		return <UILoading />;
	}

	if (error || !service) {
		return (
			<div className="mx-auto w-full max-w-4xl space-y-4 px-4 py-12">
				<div className="rounded-lg border border-destructive/30 bg-destructive/10 px-4 py-3 text-sm text-destructive" role="alert">
					{error ? `Error loading service: ${error}` : 'This service was not found.'}
				</div>
				<Button variant="outline" asChild><Link to="/services">Back to services</Link></Button>
			</div>
		);
	}

	return (
		<div className="mx-auto w-full max-w-4xl px-4 py-12">
			<UICard>
				<div className="mb-4 flex items-start justify-between gap-4">
					<h1 className="text-3xl">{service.name}</h1>
					{service.category?.name && (
						<Badge variant="primary">{service.category.name}</Badge>
					)}
				</div>

				{service.description && <p className="mb-6 text-lg text-muted-foreground">{service.description}</p>}

				<div className="mb-8 flex items-center gap-6">
					<div className="flex items-center gap-2 text-muted-foreground">
						<Clock className="size-4" />
						{service.duration} min
					</div>
					<div className="text-xl font-semibold text-primary">{service.price} €</div>
				</div>

				<div className="flex flex-wrap gap-2">
					<Button asChild><Link to="/our-team">Choose a specialist</Link></Button>
					<Button variant="outline" asChild><Link to="/services">Back to services</Link></Button>
				</div>
			</UICard>

			<ReviewsSection serviceId={service.id} />
		</div>
	);
};

export default ServiceDetails;
