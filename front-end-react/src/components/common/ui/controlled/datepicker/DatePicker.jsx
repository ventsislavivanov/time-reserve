import { useState } from "react";
import { Controller, useFormContext } from "react-hook-form";
import { format } from "date-fns";
import { bg } from "react-day-picker/locale";
import { CalendarIcon } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Calendar } from "@/components/ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { cn } from "@/lib/utils";
import { useFieldError } from "../../../../../hooks";
import Field from "../field/Field.jsx";

const START_MONTH = new Date(1920, 0);
const END_MONTH = new Date(new Date().getFullYear() + 5, 11);

const DatePicker = ({
	name,
	rules,
	label,
	placeholder,
	showErrors = true,
}) => {
	const { control } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);
	const [open, setOpen] = useState(false);

	return (
		<Field name={name} label={label} errors={errorMessages}>
			<Controller
				control={control}
				name={name}
				rules={rules}
				render={({ field: { onChange, onBlur, value } }) => (
					<Popover open={open} onOpenChange={setOpen}>
						<PopoverTrigger asChild>
							<Button
								id={name}
								type="button"
								variant="outline"
								onBlur={onBlur}
								aria-invalid={isInvalid || undefined}
								className={cn(
									"w-full justify-start font-normal",
									!value && "text-muted-foreground"
								)}
							>
								<CalendarIcon />
								{value ? format(value, "dd/MM/yyyy") : (placeholder ?? "dd/mm/yyyy")}
							</Button>
						</PopoverTrigger>
						<PopoverContent className="w-auto p-0" align="start">
							<Calendar
								mode="single"
								locale={bg}
								captionLayout="dropdown"
								startMonth={START_MONTH}
								endMonth={END_MONTH}
								selected={value || undefined}
								defaultMonth={value || undefined}
								onSelect={(date) => {
									onChange(date);
									setOpen(false);
								}}
							/>
						</PopoverContent>
					</Popover>
				)}
			/>
		</Field>
	);
}

export default DatePicker;
