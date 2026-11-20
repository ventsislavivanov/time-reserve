import { Skeleton } from '@/components/ui/skeleton';
import { UICard } from '../../../index.js';

const SkeletonList = ({ rows = 5 }) => {
	return (
		<UICard>
			<Skeleton className="mb-5 h-7 w-52" />

			<div className="space-y-3">
				{[...Array(rows)].map((_, index) => (
					<div key={index} className="space-y-2 rounded-lg border p-4">
						<Skeleton className="h-5 w-2/5" />
						<Skeleton className="h-4 w-7/12" />
						<div className="flex gap-2 pt-2">
							<Skeleton className="h-8 w-20" />
							<Skeleton className="h-8 w-20" />
						</div>
					</div>
				))}
			</div>
		</UICard>
	);
};

export default SkeletonList;
