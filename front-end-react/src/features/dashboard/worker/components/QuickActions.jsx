import { useNavigate } from "react-router";
import { UIButton, UICard } from "../../../../components/common/ui/index.js";

const QuickActions = () => {
    const navigate = useNavigate();

    return (
        <UICard className="p-4">
            <h5 className="mb-3">Quick Actions</h5>

            <div className="d-flex flex-column gap-2">

                <UIButton
                    variant="outline-primary"
                    onClick={() => navigate('/staff/appointments') }
                >
                    View my schedule
                </UIButton>

                <UIButton
                    variant="outline-warning"
                    onClick={() => navigate('/staff/pending') }
                >
                    View pending requests
                </UIButton>

                <UIButton
                    variant="outline-secondary"
                    onClick={() => navigate('/staff/history') }
                >
                    View history
                </UIButton>

            </div>
        </UICard>
    );
};

export default QuickActions;
