import { useState } from "react";
import { Check, Clock } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { cn } from "@/lib/utils";

const ServiceCard = ({ service, isSelected, onSelect }) => {
	const [expanded, setExpanded] = useState(false);

	const handleToggle = (e) => {
		e.stopPropagation();
		setExpanded(prev => !prev);
	};

	return (
		<div
			role="radio"
			aria-checked={isSelected}
			tabIndex={0}
			onClick={() => onSelect(service)}
			onKeyDown={(e) => (e.key === 'Enter' || e.key === ' ') && (e.preventDefault(), onSelect(service))}
			className={cn(
				"flex h-full cursor-pointer items-start justify-between gap-3 rounded-xl border-2 p-4 outline-none transition-colors",
				"focus-visible:ring-[3px] focus-visible:ring-ring/50",
				isSelected ? "border-primary bg-primary/5" : "border-border bg-card hover:border-primary/40"
			)}
		>
			<div className="flex-1 space-y-2">
				<h4 className={cn(isSelected && "text-primary")}>{service.name}</h4>

				{service.category && (
					<Badge variant="muted">{service.category.name}</Badge>
				)}

				{service.description && (
					<div>
						<p className={cn("text-sm text-muted-foreground", !expanded && "line-clamp-3")}>
							{service.description}
						</p>
						<button
							type="button"
							onClick={handleToggle}
							className="text-xs font-medium text-primary hover:underline"
						>
							{expanded ? 'Show less' : 'Read more'}
						</button>
					</div>
				)}

				<div className="flex items-center gap-4 text-sm text-muted-foreground">
					<span className="flex items-center gap-1">
						<Clock className="size-3.5" />
						{service.duration} min
					</span>
					<span className="font-semibold text-primary">{service.price} €</span>
				</div>
			</div>

			<div
				className={cn(
					"flex size-6 shrink-0 items-center justify-center rounded-full border-2 transition-colors",
					isSelected ? "border-primary bg-primary text-primary-foreground" : "border-input"
				)}
			>
				{isSelected && <Check className="size-3.5" />}
			</div>
		</div>
	);
}

export default ServiceCard;
