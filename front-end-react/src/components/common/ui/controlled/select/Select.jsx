import { useFormContext } from 'react-hook-form';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useFieldError } from "../../../../../hooks";

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
        <div className="mb-3">
            {label && <label className="form-label">{label}</label>}
            <div className="input-group">
                {icon && (
                    <span className="input-group-text">
                        <FontAwesomeIcon icon={icon} />
                    </span>
                )}
                <select
                    className={`form-select ${isInvalid ? 'is-invalid' : ''}`}
                    {...register(name, rules)}
                >
                    <option value="">{placeholder}</option>
                    {options.map((option) => (
                        <option key={option.id} value={option.id}>
                            {option.name}
                        </option>
                    ))}
                </select>

                {errorMessages.map((e) => (
                    <div key={e.$uid} className="invalid-feedback">
                        {e.$message}
                    </div>
                ))}
            </div>
        </div>
    );
};

export default UISelect;
