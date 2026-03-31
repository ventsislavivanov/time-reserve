import QuickActions from "./components/QuickActions.jsx";
import TodayAppointments from "./components/TodayAppointments.jsx";
import PendingRequestsPreview from "./components/PendingRequestsPreview.jsx";

const WorkerDashboard = () => {
	return (
		<div className="container py-5">
			<h2 className="mb-4">Dashboard</h2>

			<div className="mb-4">
				<QuickActions />
			</div>

			<div className="mb-4">
				<TodayAppointments />
			</div>

			<div className="mb-4">
				<PendingRequestsPreview />
			</div>
		</div>
	);
};

export default WorkerDashboard;