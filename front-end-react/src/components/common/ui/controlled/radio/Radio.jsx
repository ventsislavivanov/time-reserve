import { useId } from 'react';
import { Controller, useFormContext } from "react-hook-form";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Label } from "@/components/ui/label";
import { useFieldError } from "../../../../../hooks";
import { FieldErrors } from "../field/Field.jsx";

const Radio = ({
	name,
	options,
	rules = {},
	label,
	showErrors = true,
}) => {
	const groupId = useId();
	const { control } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);

	const capitalizeFirstLetter = (string) => string.charAt(0).toUpperCase() + string.slice(1);

	return (
		<div className="mb-4 space-y-2">
			{label && <Label>{label}</Label>}

			<Controller
				control={control}
				name={name}
				rules={rules}
				render={({ field }) => (
					<RadioGroup
						value={field.value ?? ""}
						onValueChange={field.onChange}
						onBlur={field.onBlur}
						aria-invalid={isInvalid || undefined}
					>
						{options.map((option) => {
							const id = `${groupId}-${option}`;
							return (
								<div key={option} className="flex items-center gap-2">
									<RadioGroupItem value={option} id={id} />
									<Label htmlFor={id} className="font-normal">
										{capitalizeFirstLetter(option)}
									</Label>
								</div>
							);
						})}
					</RadioGroup>
				)}
			/>

			<FieldErrors errors={errorMessages} />
		</div>
	);
}

export default Radio;
