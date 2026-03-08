import { useSelector } from "react-redux";
import { Navigate, Outlet } from "react-router";

const RoleGuard = ({ allowedRoles, redirectTo }) => {
	const { isAuthenticated, user } = useSelector((state) => state.auth);

	if (!isAuthenticated) {
		return <Navigate to={redirectTo ?? '/staff/login'} replace />;
	}


	if (!allowedRoles.includes(user?.role)) {
		return <Navigate to={redirectTo ?? '/staff/dashboard'} replace />;
	}

	return <Outlet />;
}

export default RoleGuard;