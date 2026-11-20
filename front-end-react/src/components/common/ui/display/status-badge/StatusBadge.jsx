import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Badge } from "@/components/ui/badge";

const StatusBadge = ({
    condition,
    trueText = "Yes",
    falseText = "No"
}) => {
    return (
        <Badge variant={condition ? 'success' : 'danger'}>
            <FontAwesomeIcon icon={condition ? 'check-circle' : 'times-circle'} />
            {condition ? trueText : falseText}
        </Badge>
    );
}

export default StatusBadge;
