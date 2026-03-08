import { Route, Routes, useNavigate } from "react-router";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";

import { login, logout } from "./store/authSlice.js";

import ClientLayout from "./layouts/ClientLayout.jsx";
import StaffLayout from "./layouts/StaffLayout.jsx";

import { Login, SignUp, RoleGuard, getMe } from "./features/auth";
import { ManageUsers } from "./features/users";
import { ManageJobs } from "./features/jobs";
import { ManageCategories } from "./features/categories";
import { ManageServices, ServicesCatalog } from "./features/services";
import { WorkersList } from './features/workers';
import { BookingWizard, MyAppointments } from './features/appointments';

import Dashboard from "./features/dashboard/components/Dashboard.jsx";
import { UILoading, UIToast } from "./components/common/ui";

function App() {
	const navigate = useNavigate();
	const dispatch = useDispatch();
	const [isLoading, setLoading] = useState(true);

	useEffect(() => {
		const checkAuth = async () => {
			const token = localStorage.getItem("token");

			if (token) {
				try {
					const user = await getMe();
					dispatch(login({
						uid: user.id,
						email: user.email,
						role: user.role
					}));
					user.role === 'client' ? navigate('/') : navigate('/staff/dashboard');
				} catch (error) {
					console.error("Session expired or invalid token");
					localStorage.removeItem("token");
					dispatch(logout());
				}
			}
			setLoading(false);
		};

		checkAuth();
	}, [dispatch]);

	if (isLoading) {
		return <UILoading fullscreen={true} color="#436d9a" size={60} />;
	}

	return (
		<>
			<Routes>
				<Route element={<ClientLayout />}>
					<Route path="/" element={<h1>Welcome to our website!</h1>} />
					<Route path="/about-us" element={<h1>About us page</h1>} />
					<Route path="/contact-us" element={<h1>Contact us page</h1>} />
					<Route path="/services" element={<ServicesCatalog/>} />
					<Route path="/our-team" element={<WorkersList />} />

					<Route element={<RoleGuard allowedRoles={['client']} redirectTo="/login" />}>
						<Route path="/our-team/book/:workerId" element={<BookingWizard />} />
						<Route path="/my-appointments" element={<MyAppointments />} />
					</Route>

					<Route path="/login" element={<Login isClient={true} guard="client" />} />
					<Route path="/sign-up" element={<SignUp />} />
				</Route>

				<Route path="/staff">
					<Route element={<StaffLayout />}>
						<Route path="login" element={<Login isClient={false} guard="staff" />} />

						<Route index element={<Dashboard />} />
						<Route path="dashboard" element={<Dashboard />} />

						<Route element={<RoleGuard allowedRoles={['admin']} />}>
							<Route path="users" element={<ManageUsers />} />
							<Route path="jobs" element={<ManageJobs />} />
							<Route path="categories" element={<ManageCategories />} />
							<Route path="services" element={<ManageServices />} />
							<Route path="reports" element={<h1>Reports</h1>} />
						</Route>

						<Route element={<RoleGuard allowedRoles={['worker']} />}>
							<Route path="appointments" element={<h1>My Appointments</h1>} />
						</Route>
					</Route>
				</Route>
			</Routes>

			<UIToast/>
		</>

	);
}

export default App;
