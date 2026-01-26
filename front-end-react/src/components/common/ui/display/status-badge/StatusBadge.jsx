import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

 const StatusBadge = ({
    condition,
    trueText = "Yes",
    falseText = "No"
}) => {
    return (
        <span
            className={`badge rounded-pill ${condition ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger'}`}
            style={{ fontSize: '0.75rem' }}
        >
        <FontAwesomeIcon icon={condition ? 'check-circle' : 'times-circle'} className="me-1"/>
            {condition ? trueText : falseText}
    </span>
    );
}

export default StatusBadge;