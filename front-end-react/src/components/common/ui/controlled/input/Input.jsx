import { useFormContext } from "react-hook-form";
import { Input as ShInput } from "@/components/ui/input";
import { cn } from "@/lib/utils";
import { useFieldError } from "../../../../../hooks";
import Field from "../field/Field.jsx";

const Input = ({
	type = 'text',
	name,
	placeholder,
	rules,
	label,
	icon = [],
	disabled,
	classes = '',
	showErrors = true,
	...rest
}) => {
	const { register } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);
	const hasIcon = icon.length > 0;

	return (
		<Field name={name} label={label} icon={icon} errors={errorMessages}>
			<ShInput
				type={type}
				id={name}
				placeholder={placeholder}
				{...register(name, rules)}
				aria-invalid={isInvalid || undefined}
				className={cn(hasIcon && "pl-9", classes)}
				disabled={disabled}
				{...rest}
			/>
		</Field>
	);
}

export default Input;
