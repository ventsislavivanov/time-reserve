import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Input as ShInput } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { cn } from "@/lib/utils";

const Input = ({
	type = 'text',
	label,
	labelClassName = '',
	inputClassName = '',
	placeholder,
	icon,
	iconClassName = '',
	value,
	onChange,
	positionClassName = "w-full md:w-64",
	name,
	...props
}) => {
	return (
		<div className={cn("space-y-1.5", positionClassName)}>
			{label && <Label htmlFor={name} className={labelClassName}>{label}</Label>}

			<div className="relative">
				{icon && (
					<FontAwesomeIcon
						icon={icon}
						className={cn("pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground", iconClassName)}
					/>
				)}
				<ShInput
					id={name}
					name={name}
					type={type}
					className={cn(icon && "pl-9", inputClassName)}
					placeholder={placeholder}
					value={value}
					onChange={onChange}
					{...props}
				/>
			</div>
		</div>
	);
}

export default Input;
