import { Link } from 'react-router';
import { Clock, Sparkles } from 'lucide-react';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { UICard } from '../../../components/common/ui';

const ServiceCard = ({ service, category }) => {
	return (
		<UICard className="h-full transition-shadow hover:shadow-md" bodyClassName="p-0 flex h-full flex-col">
			<div className="flex h-44 items-center justify-center bg-gradient-to-br from-primary to-primary/60">
				<Sparkles className="size-12 text-primary-foreground/70" />
			</div>

			<div className="flex flex-1 flex-col gap-3 p-6">
				<div className="flex items-start justify-between gap-2">
					<h3 className="text-lg">
						<Link to={`/services/${service.id}`} className="hover:text-primary">{service.name}</Link>
					</h3>
					{category?.name && <Badge variant="primary">{category.name}</Badge>}
				</div>

				{service.description && (
					<p className="line-clamp-3 text-sm text-muted-foreground">
						{service.description}
					</p>
				)}

				<div className="mt-auto flex items-center justify-between pt-2">
					<span className="flex items-center gap-1 text-sm text-muted-foreground">
						<Clock className="size-4" />
						{service.duration} min
					</span>
					<span className="text-lg font-semibold text-primary">{service.price} €</span>
				</div>

				<Button variant="outline" asChild className="w-full">
					<Link to={`/services/${service.id}`}>View details</Link>
				</Button>
			</div>
		</UICard>
	);
};

export default ServiceCard;
