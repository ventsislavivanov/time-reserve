import { Route, Routes } from "react-router";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";

import { login, logout } from "./store/authSlice.js";
import { getMe } from "./services/auth.js";

import ClientLayout from "./layouts/ClientLayout.jsx";
import StaffLayout from "./layouts/StaffLayout.jsx";

import Login from "./components/login/Login.jsx";
import SignUp from "./components/sign-up/SignUp.jsx";
import Dashboard from "./components/dashboard/Dashboard.jsx";
import Loading from "./components/loading/Loading.jsx";

function App() {
	const dispatch = useDispatch();
	const [loading, setLoading] = useState(true);

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

	if (loading) {
		return <Loading fullscreen={true} color="#436d9a" size={60} />;
	}

	return (
		<Routes>
			<Route element={<ClientLayout />}>
				<Route path="/" element={<h1>Home</h1>} />
				<Route path="/login" element={<Login guard="client" />} />
				<Route path="/sign-up" element={<SignUp />} />
			</Route>

			<Route path="/staff">
				<Route path="login" element={<Login isClient={false} guard="staff" />} />

				<Route element={<StaffLayout />}>
					<Route index element={<Dashboard />} />
					<Route path="dashboard" element={<Dashboard />} />
					<Route path="appointments" element={<h1>Appointments</h1>} />
				</Route>
			</Route>
		</Routes>
	)
}

export default App
