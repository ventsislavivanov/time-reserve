import { useWorkerDashboard} from "../hooks/useWorkerDashboard.js";
import DashboardMiniRow from "../../components/DashboardMiniRow.jsx";
import { UICard } from "../../../../components/common/ui/index.js";

const PendingRequestsPreview = () => {
    const { pending, isLoading } = useWorkerDashboard();

    return (
        <UICard className="p-4">
            <h5 className="mb-3">Pending Requests</h5>

            {isLoading ? (
                <p>Loading...</p>
            ) : pending.length === 0 ? (
                <p className="text-muted">No pending requests</p>
            ) : (
                pending.map(app => (
                    <DashboardMiniRow key={app.id} app={app} />
                ))
            )}
        </UICard>
    );
};

export default PendingRequestsPreview;
