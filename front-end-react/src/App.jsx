import { Route, Routes } from "react-router";
import { useEffect, useState } from "react";

import { useAuth } from "./context";

import ClientLayout from "./layouts/ClientLayout.jsx";
import StaffLayout from "./layouts/StaffLayout.jsx";

import { Login, SignUp, RoleGuard, GuestGuard, getMe } from "./features/auth";
import { ManageUsers } from "./features/users";
import { ManageJobs } from "./features/jobs";
import { ManageCategories } from "./features/categories";
import { ManageServices, ServicesCatalog, ServiceDetails } from "./features/services";
import { WorkersList, WorkerDetails } from './features/workers';
import { Home, About, Contact } from './features/pages';
import {
	BookingWizard,
	ClientAppointments,
	WorkerAppointments,
	PendingRequests,
	HistoryAppointments,
	AdminAppointments
} from './features/appointments';

import { AdminDashboard, WorkerDashboard } from "./features/dashboard";
import { UILoading, UIToast } from "./components/common/ui";

function App() {
	const { login, logout, user } = useAuth();
	const role = user?.role;
	const [isLoading, setLoading] = useState(true);

	useEffect(() => {
		const checkAuth = async () => {
			const token = localStorage.getItem("token");

			if (token) {
				try {
					const user = await getMe();
					// Restore the session in place: the user stays on the URL they opened
					// (GuestGuard already redirects logged in users away from the login pages).
					login({
						uid: user.id,
						email: user.email,
						role: user.role
					});
				} catch (error) {
					console.error("Session expired or invalid token");
					localStorage.removeItem("token");
					logout();
				}
			}
			setLoading(false);
		};

		checkAuth();
	}, [login, logout]);

	if (isLoading) {
		return <UILoading fullscreen={true} color="#436d9a" size={60} />;
	}

	return (
		<>
			<Routes>
				<Route element={<ClientLayout />}>
					<Route path="/" element={<Home />} />
					<Route path="/about-us" element={<About />} />
					<Route path="/contact-us" element={<Contact />} />
					<Route path="/services" element={<ServicesCatalog/>} />
					<Route path="/services/:serviceId" element={<ServiceDetails />} />
					<Route path="/our-team" element={<WorkersList />} />
					<Route path="/our-team/:workerId" element={<WorkerDetails />} />

					<Route element={<RoleGuard allowedRoles={['client']} redirectTo="/login" />}>
						<Route path="/our-team/book/:workerId" element={<BookingWizard />} />
						<Route path="/my-appointments" element={<ClientAppointments />} />
					</Route>

					<Route element={<GuestGuard />}>
						<Route path="/login" element={<Login isClient={true} guard="client" />} />
						<Route path="/sign-up" element={<SignUp />} />
					</Route>
				</Route>

				<Route path="/staff">
					<Route element={<StaffLayout />}>
						<Route element={<GuestGuard />}>
							<Route path="login" element={<Login isClient={false} guard="staff" />} />
						</Route>

						<Route index element={ role === 'admin' ? <AdminDashboard /> : <WorkerDashboard /> } />

						<Route element={<RoleGuard allowedRoles={['admin', 'worker']} />}>
							<Route path="dashboard" element={ role === 'admin' ? <AdminDashboard /> : <WorkerDashboard /> } />
						</Route>

						<Route element={<RoleGuard allowedRoles={['admin']} />}>
							<Route path="admin-appointments" element={<AdminAppointments />} />
							<Route path="users" element={<ManageUsers />} />
							<Route path="jobs" element={<ManageJobs />} />
							<Route path="categories" element={<ManageCategories />} />
							<Route path="services" element={<ManageServices />} />
							<Route path="reports" element={<h1>Reports</h1>} />
						</Route>

						<Route element={<RoleGuard allowedRoles={['worker']} />}>
							<Route path="appointments" element={<WorkerAppointments />} />
							<Route path="pending" element={<PendingRequests />} />
							<Route path="history" element={<HistoryAppointments />} />
						</Route>
					</Route>
				</Route>
			</Routes>

			<UIToast/>
		</>
	);
}

export default App;
