import { Skeleton } from '@/components/ui/skeleton';
import { UICard } from '../../../index.js';

const ServiceCard = () => {
	return (
		<UICard className="h-full" bodyClassName="p-0">
			<Skeleton className="h-48 rounded-none" />

			<div className="space-y-3 p-5">
				<div className="flex items-start justify-between">
					<Skeleton className="h-6 w-3/5" />
					<Skeleton className="h-5 w-1/4 rounded-full" />
				</div>

				<Skeleton className="h-3.5 w-11/12" />
				<Skeleton className="h-3.5 w-8/12" />

				<div className="flex items-center justify-between pt-2">
					<Skeleton className="h-4 w-[30%]" />
					<Skeleton className="h-5 w-1/5" />
				</div>
			</div>
		</UICard>
	);
};

export default ServiceCard;
