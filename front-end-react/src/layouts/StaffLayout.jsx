import { Link, Navigate, Outlet, useNavigate } from "react-router";
import { useDispatch, useSelector } from "react-redux";
import { logout as logoutUser } from "../services/auth.js";
import { logout } from "../store/authSlice.js";
import Header from "../components/header/Header.jsx";

export default function StaffLayout() {
	const dispatch = useDispatch();
	const navigate = useNavigate();

	const { isAuthenticated, user } = useSelector((s) => s.auth);

	if (!isAuthenticated) {
		return <Navigate to="/staff/login" replace />;
	}

	if (user?.role !== 'admin' && user?.role !== 'worker') {
		return <Navigate to="/" replace />;
	}

	const handleLogout = async () => {
		try {
			await logoutUser();
			localStorage.removeItem("token");
			dispatch(logout());
			navigate('/staff/login');
		} catch (error) {
			console.log("Logout error", error);
		}
	};

	return (
		<>
			{isAuthenticated && (
				<Header>
					<ul className="navbar-nav me-auto">
						<li className="nav-item">
							<Link to="/staff" className="nav-link">Dashboard</Link>
						</li>

						<li className="nav-item">
							<Link to="/staff/appointments" className="nav-link">Appointments</Link>
						</li>
					</ul>
					<ul className="navbar-nav">
						<span className="navbar-text me-2">Role: {user?.role}</span>
						<span className="navbar-text me-2">Email: {user?.email}</span>
						<button className="btn btn-outline-light" onClick={handleLogout}>Logout</button>
					</ul>
				</Header>
			)}
			<main>
				<Outlet />
			</main>
		</>
	);
}