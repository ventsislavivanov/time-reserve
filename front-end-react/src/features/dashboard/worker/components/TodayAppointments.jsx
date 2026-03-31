import { useWorkerDashboard } from "../hooks/useWorkerDashboard.js";
import DashboardMiniRow from "../../components/DashboardMiniRow.jsx";
import { UICard } from "../../../../components/common/ui/index.js";

const TodayAppointments = () => {
    const { today, isLoading } = useWorkerDashboard();

    return (
        <UICard className="p-4">
            <h5 className="mb-3">Today's Appointments</h5>

            {isLoading ? (
                <p>Loading...</p>
            ) : today.length === 0 ? (
                <p className="text-muted">No appointments today</p>
            ) : (
                today.map(app => (
                    <DashboardMiniRow key={app.id} app={app} />
                ))
            )}
        </UICard>
    );
};

export default TodayAppointments;
