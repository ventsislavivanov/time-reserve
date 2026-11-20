import { Controller, useFormContext } from "react-hook-form";
import { Checkbox as ShCheckbox } from "@/components/ui/checkbox";
import { Label } from "@/components/ui/label";
import { cn } from "@/lib/utils";
import { useFieldError } from "../../../../../hooks";
import { FieldErrors } from "../field/Field.jsx";

const Checkbox = ({
	name,
	label,
	rules = {},
	disabled = false,
	className = "",
	showErrors = true
}) => {
	const { control } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);

	return (
		<div className={cn("mb-4 space-y-1.5", className)}>
			<div className="flex items-center gap-2">
				<Controller
					control={control}
					name={name}
					rules={rules}
					render={({ field }) => (
						<ShCheckbox
							id={name}
							checked={!!field.value}
							onCheckedChange={(checked) => field.onChange(checked === true)}
							onBlur={field.onBlur}
							disabled={disabled}
							aria-invalid={isInvalid || undefined}
						/>
					)}
				/>
				{label && (
					<Label htmlFor={name} className="font-normal text-muted-foreground">
						{label}
					</Label>
				)}
			</div>
			<FieldErrors errors={errorMessages} />
		</div>
	);
}

export default Checkbox;
