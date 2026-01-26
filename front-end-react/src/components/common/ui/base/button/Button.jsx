import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

const UIButton = ({
    children,
    type = 'button',
    variant = 'primary',
    size = '',
    className = '',
    onClick,
    disabled = false,
    isLoading = false,
    icon = [],
    iconClassName = '',
    ...props
}) => {
    const baseClass = `btn btn-${variant} ${size ? `btn-${size}` : ''} d-inline-flex align-items-center justify-content-center`;
    const combinedClass = `${baseClass} ${className}`.trim();
    const hasIcon = icon && (Array.isArray(icon) ? icon.length > 0 : typeof icon === 'string');

    return (
        <button
            type={type}
            className={combinedClass}
            onClick={onClick}
            disabled={disabled || isLoading}
            {...props}
        >
            {isLoading ? (
                <>
                    <span className="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>
                    {children}
                </>
            ) : (
                <>
                    {hasIcon && (
                        <span className={children ? "me-2" : ""}>
                             <FontAwesomeIcon icon={icon} className={iconClassName}/>
                        </span>
                    )}
                    {children}
                </>
            )}
        </button>
    );
};

export default UIButton;
