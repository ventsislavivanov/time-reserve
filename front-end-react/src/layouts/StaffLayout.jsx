import { Link, Navigate, Outlet, useLocation, useNavigate } from "react-router";
import { useAuth } from "../context";
import { logout as logoutUser } from "../features/auth";
import Header from "../components/layout/header/Header.jsx";
import { UINavLink } from "../components/common/ui";

export default function StaffLayout() {
	const navigate = useNavigate();
	const location = useLocation();

	const { isAuthenticated, user, logout } = useAuth();
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
			logout();
			navigate('/staff/login');
		} catch (error) {
			console.log("Logout error", error);
		}
	};

	return (
		<div className="d-flex flex-column min-vh-100 bg-light">
			{isAuthenticated && (
				<Header>
					<ul className="navbar-nav me-auto">
						<li className="nav-item">
							<Link to="/staff" className="nav-link">Dashboard</Link>
						</li>

						{role === 'admin' && (
							<>
								<UINavLink to="/staff/admin-appointments">Appointments</UINavLink>
								<UINavLink to="/staff/users">Users</UINavLink>
								<UINavLink to="/staff/jobs">Jobs</UINavLink>
								<UINavLink to="/staff/categories">Categories</UINavLink>
								<UINavLink to="/staff/services">Services</UINavLink>
								<UINavLink to="/staff/reports">Reports</UINavLink>
							</>
						)}

						{role === 'worker' && (
							<>
								<UINavLink to="/staff/appointments">My Appointments</UINavLink>
								<UINavLink to="/staff/pending">Pending Requests</UINavLink>
								<UINavLink to="/staff/history">History</UINavLink>
							</>
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