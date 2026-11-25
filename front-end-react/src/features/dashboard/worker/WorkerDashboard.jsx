import QuickActions from "./components/QuickActions.jsx";
import TodayAppointments from "./components/TodayAppointments.jsx";
import PendingRequestsPreview from "./components/PendingRequestsPreview.jsx";

const WorkerDashboard = () => {
	return (
		<div className="mx-auto w-full max-w-7xl px-4 py-12">
			<h2 className="mb-6">Dashboard</h2>

			<div className="mb-6">
				<QuickActions />
			</div>

			<div className="mb-6">
				<TodayAppointments />
			</div>

			<div className="mb-6">
				<PendingRequestsPreview />
			</div>
		</div>
	);
};

export default WorkerDashboard;