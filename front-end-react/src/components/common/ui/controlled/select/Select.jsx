import { useFormContext } from 'react-hook-form';
import { useFieldError } from "../../../../../hooks";
import { NativeSelect } from "../../base/native-select/NativeSelect.jsx";
import { cn } from "@/lib/utils";
import Field from "../field/Field.jsx";

const UISelect = ({
    name,
    label,
    options,
    icon,
    rules,
    placeholder = "Select option...",
    showErrors = true
}) => {
    const { register } = useFormContext();
    const { isInvalid, errorMessages } = useFieldError(name, showErrors);

    return (
        <Field name={name} label={label} icon={icon} errors={errorMessages}>
            <NativeSelect
                id={name}
                aria-invalid={isInvalid || undefined}
                className={cn(icon && "pl-9")}
                {...register(name, rules)}
            >
                <option value="">{placeholder}</option>
                {options.map((option) => (
                    <option key={option.id} value={option.id}>
                        {option.name}
                    </option>
                ))}
            </NativeSelect>
        </Field>
    );
};

export default UISelect;
