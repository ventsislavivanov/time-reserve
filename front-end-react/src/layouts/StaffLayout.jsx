import { Link, Navigate, Outlet, useLocation, useNavigate } from "react-router";
import { useDispatch, useSelector } from "react-redux";
import { logout as logoutUser } from "../services/auth.js";
import { logout } from "../store/authSlice.js";
import Header from "../components/header/Header.jsx";

export default function StaffLayout() {
	const dispatch = useDispatch();
	const navigate = useNavigate();
	const location = useLocation();

	const { isAuthenticated, user } = useSelector((s) => s.auth);
	const role = user?.role;

	const isLoginPage = location.pathname === "/staff/login";

	if (!isAuthenticated && !isLoginPage) {
		return <Navigate to="/staff/login" replace />;
	}

	if (!isLoginPage && user?.role !== 'admin' && user?.role !== 'worker') {
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
		<div className="d-flex flex-column min-vh-100">
			{isAuthenticated && (
				<Header>
					<ul className="navbar-nav me-auto">
						<li className="nav-item">
							<Link to="/staff" className="nav-link">Dashboard</Link>
						</li>

						{role === 'admin' && (
							<>
								<li className="nav-item">
									<Link to="/staff/users" className="nav-link">Manage Users</Link>
								</li>
								<li className="nav-item">
									<Link to="/staff/reports" className="nav-link">Reports</Link>
								</li>
							</>
						)}

						{role === 'worker' && (
							<li className="nav-item">
								<Link to="/staff/appointments" className="nav-link">My Calendar</Link>
							</li>
						)}
					</ul>
					<ul className="navbar-nav">
						<span className="navbar-text me-2">Role: {user?.role}</span>
						<span className="navbar-text me-2">Email: {user?.email}</span>
						<button className="btn btn-outline-light" onClick={handleLogout}>Logout</button>
					</ul>
				</Header>
			)}

			<main className="d-flex flex-column flex-grow-1">
				<Outlet />
			</main>
		</div>
	);
}