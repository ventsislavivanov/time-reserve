import { useSelector } from "react-redux";
import { Navigate, Outlet } from "react-router";

export default function RoleGuard({ allowedRoles }) {
	const { isAuthenticated, user } = useSelector((state) => state.auth);

	if (!isAuthenticated) {
		return <Navigate to="/staff/login" replace />;
	}


	if (!allowedRoles.includes(user?.role)) {
		return <Navigate to="/staff/dashboard" replace />;
	}

	return <Outlet />;
}