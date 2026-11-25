import { useWorkerDashboard } from "../hooks/useWorkerDashboard.js";
import DashboardMiniRow from "../../components/DashboardMiniRow.jsx";
import { UICard } from "../../../../components/common/ui/index.js";

const TodayAppointments = () => {
    const { today, isLoading } = useWorkerDashboard();

    return (
        <UICard>
            <h5 className="mb-4">Today's Appointments</h5>

            {isLoading ? (
                <p>Loading...</p>
            ) : today.length === 0 ? (
                <p className="text-muted-foreground">No appointments today</p>
            ) : (
                today.map(app => (
                    <DashboardMiniRow key={app.id} app={app} />
                ))
            )}
        </UICard>
    );
};

export default TodayAppointments;
