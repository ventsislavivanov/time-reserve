import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Label } from "@/components/ui/label";
import { cn } from "@/lib/utils";

export const FieldErrors = ({ errors = [] }) =>
	errors.map((e) => (
		<p key={e.$uid} role="alert" className="text-sm text-destructive">
			{e.$message}
		</p>
	));

// Label + optional leading icon + error list around a form control.
const Field = ({ name, label, icon, errors, className, children }) => {
	const hasIcon = Array.isArray(icon) ? icon.length > 0 : Boolean(icon);

	return (
		<div className={cn("mb-4 space-y-1.5", className)}>
			{label && <Label htmlFor={name}>{label}</Label>}
			<div className="relative">
				{hasIcon && (
					<FontAwesomeIcon
						icon={icon}
						className="pointer-events-none absolute left-3 top-1/2 z-10 size-4 -translate-y-1/2 text-muted-foreground"
					/>
				)}
				{children}
			</div>
			<FieldErrors errors={errors} />
		</div>
	);
};

export default Field;
