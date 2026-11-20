import { Skeleton } from '@/components/ui/skeleton';
import { UICard } from '../../../index.js';

const SkeletonForm = ({ fields = 5 }) => {
	return (
		<UICard>
			<Skeleton className="mb-6 h-5 w-2/5" />

			{[...Array(fields)].map((_, index) => (
				<div key={index} className="mb-4 space-y-2">
					<Skeleton className="h-4 w-[30%]" />
					<Skeleton className="h-9 w-full" />
				</div>
			))}

			<Skeleton className="mt-6 h-10 w-full" />
		</UICard>
	);
};

export default SkeletonForm;
