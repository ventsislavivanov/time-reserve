import { Navigate, Outlet, useLocation, useNavigate } from "react-router";
import { useAuth } from "../context";
import { logout as logoutUser } from "../features/auth";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import Header from "../components/layout/header/Header.jsx";
import { UINavLink } from "../components/common/ui";
import ThemeToggle from "../components/layout/theme/ThemeToggle.jsx";

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

	const actions = (
		<>
			<Badge variant="primary" className="capitalize">{user?.role}</Badge>
			<span className="truncate text-sm text-muted-foreground">{user?.email}</span>
			<Button variant="outline" size="sm" onClick={handleLogout}>Logout</Button>
		</>
	);

	return (
		<div className="flex min-h-screen flex-col">
			{isAuthenticated && (
				<Header actions={actions} homeTo="/staff/dashboard">
					<UINavLink to="/staff/dashboard">Dashboard</UINavLink>

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
				</Header>
			)}

			{!isAuthenticated && (
				<div className="absolute right-4 top-4"><ThemeToggle /></div>
			)}

			<main className="flex flex-1 flex-col">
				<Outlet />
			</main>
		</div>
	);
}
