import { Skeleton } from '@/components/ui/skeleton';

const WizardServiceCard = () => {
	return (
		<div className="flex items-start justify-between rounded-xl border-2 bg-card p-4">
			<div className="flex-1 space-y-2">
				<Skeleton className="h-5 w-7/12" />
				<Skeleton className="h-5 w-1/4" />
				<Skeleton className="h-3.5 w-full" />
				<Skeleton className="h-3.5 w-9/12" />
				<div className="flex gap-3 pt-1">
					<Skeleton className="h-3.5 w-1/4" />
					<Skeleton className="h-3.5 w-1/6" />
				</div>
			</div>

			<Skeleton className="ml-3 size-5 shrink-0 rounded-full" />
		</div>
	);
};

export default WizardServiceCard;
