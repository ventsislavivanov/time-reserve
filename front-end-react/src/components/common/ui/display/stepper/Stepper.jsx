import { Check } from "lucide-react";
import { cn } from "@/lib/utils";

const UIStepper = ({ steps, currentStep }) => {
	return (
		<ol className="mb-8 flex items-start justify-between">
			{steps.map((s, index) => {
				const done = currentStep > s.id;
				const active = currentStep === s.id;

				return (
					<li key={s.id} className="relative flex flex-1 flex-col items-center">
						{index < steps.length - 1 && (
							<div
								className={cn(
									"absolute left-1/2 top-5 h-0.5 w-full",
									done ? "bg-primary" : "bg-border"
								)}
							/>
						)}

						<div
							aria-current={active ? "step" : undefined}
							className={cn(
								"relative z-10 mb-2 flex size-10 items-center justify-center rounded-full border-2 text-sm font-semibold transition-colors",
								done && "border-primary bg-primary text-primary-foreground",
								active && "border-primary bg-background text-primary ring-4 ring-primary/15",
								!done && !active && "border-border bg-background text-muted-foreground"
							)}
						>
							{done ? <Check className="size-5" /> : s.id}
						</div>

						<span className={cn(
							"text-center text-xs",
							currentStep >= s.id ? "font-semibold text-foreground" : "text-muted-foreground"
						)}>
							{s.label}
						</span>
					</li>
				);
			})}
		</ol>
	);
};

export default UIStepper;
