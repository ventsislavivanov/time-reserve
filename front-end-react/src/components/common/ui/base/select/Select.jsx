import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { NativeSelect } from "../native-select/NativeSelect.jsx";
import { cn } from "@/lib/utils";

const Select = ({
	label,
	value,
	onChange,
	options = [],
	icon,
	placeholder = "Select option...",
	className = ""
}) => {
	return (
		<div className={cn("relative w-full md:w-56", className)}>
			{icon && (
				<FontAwesomeIcon
					icon={icon}
					className="pointer-events-none absolute left-3 top-1/2 z-10 size-3.5 -translate-y-1/2 text-muted-foreground"
				/>
			)}
			<NativeSelect
				aria-label={label}
				className={cn(icon && "pl-9")}
				value={value}
				onChange={(e) => onChange(e.target.value)}
			>
				{placeholder && <option value="">{placeholder}</option>}
				{options.map((opt) => (
					<option key={opt.value} value={opt.value}>
						{opt.label}
					</option>
				))}
			</NativeSelect>
		</div>
	);
};

export default Select;
