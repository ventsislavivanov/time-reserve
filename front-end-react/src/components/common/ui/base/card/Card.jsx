import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const UICard = ({
    children,
    title,
    headerIcon,
    headerActions,
    footer,
    className = '',
    headerClassName = '',
    bodyClassName = '',
    variant = '', // primary, success, etc. for header bg
    ...props
}) => {
    const headerBgClass = variant ? `bg-${variant} text-white` : 'bg-white';
    
    return (
        <div className={`card shadow-sm border-0 rounded-3 overflow-hidden ${className}`} {...props}>
            {(title || headerIcon || headerActions) && (
                <div className={`card-header d-flex justify-content-between align-items-center py-3 ${headerBgClass} ${headerClassName}`}>
                    <h5 className="mb-0 d-flex align-items-center fw-bold">
                        {headerIcon && (
                            <span className="me-2">
                                <FontAwesomeIcon icon={headerIcon} />
                            </span>)}
                        {title}
                    </h5>
                    {headerActions && <div>{headerActions}</div>}
                </div>
            )}
            <div className={`card-body ${bodyClassName}`}>
                {children}
            </div>
            {footer && (
                <div className="card-footer bg-white border-top-0 py-3">
                    {footer}
                </div>
            )}
        </div>
    );
};

export default UICard;
