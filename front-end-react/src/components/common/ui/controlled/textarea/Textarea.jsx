import { useFormContext } from 'react-hook-form';
import { Textarea as ShTextarea } from "@/components/ui/textarea";
import { cn } from "@/lib/utils";
import { useFieldError } from "../../../../../hooks";
import Field from "../field/Field.jsx";

const Textarea = ({
	name,
	placeholder,
	rules,
	label,
	rows = 3,
	disabled,
	classes = '',
	showErrors = true,
}) => {
	const { register } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);

	return (
		<Field name={name} label={label} errors={errorMessages}>
			<ShTextarea
				id={name}
				rows={rows}
				placeholder={placeholder}
				{...register(name, rules)}
				aria-invalid={isInvalid || undefined}
				className={cn(classes)}
				disabled={disabled}
			/>
		</Field>
	);
};

export default Textarea;
