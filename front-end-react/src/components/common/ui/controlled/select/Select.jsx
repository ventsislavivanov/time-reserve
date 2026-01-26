import { useFormContext } from 'react-hook-form';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const UISelect = ({
    name,
    label,
    options,
    icon,
    rules,
    placeholder = "Select option..."
}) => {
    const {
        register,
        formState: { errors }
    } = useFormContext();

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
                    className={`form-select ${errors[name] ? 'is-invalid' : ''}`}
                    {...register(name, rules)}
                >
                    <option value="">{placeholder}</option>
                    {options.map((option) => (
                        <option key={option.id} value={option.id}>
                            {option.name}
                        </option>
                    ))}
                </select>
                {errors[name] && (
                    <div className="invalid-feedback">
                        {errors[name].message}
                    </div>
                )}
            </div>
        </div>
    );
};

export default UISelect;
