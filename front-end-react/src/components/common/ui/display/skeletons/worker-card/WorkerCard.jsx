import { Skeleton } from '@/components/ui/skeleton';
import { UICard } from '../../../index.js';

const WorkerCard = () => {
	return (
		<UICard className="h-full">
			<div className="mb-4 flex items-center gap-4">
				<Skeleton className="size-14 rounded-full" />
				<div className="flex-1 space-y-2">
					<Skeleton className="h-4 w-1/2" />
					<Skeleton className="h-3.5 w-1/3" />
				</div>
			</div>

			<div className="mb-4 space-y-2">
				<Skeleton className="h-3.5 w-1/4" />
				<Skeleton className="h-3.5 w-full" />
				<Skeleton className="h-3.5 w-10/12" />
				<Skeleton className="h-3.5 w-11/12" />
			</div>

			<Skeleton className="h-9 w-full" />
		</UICard>
	);
};

export default WorkerCard;
