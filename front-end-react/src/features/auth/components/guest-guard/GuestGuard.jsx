import { Navigate, Outlet } from "react-router";
import { useAuth } from "../../../../context";

const GuestGuard = () => {
	const { isAuthenticated, user } = useAuth();

	if (isAuthenticated) {
		const home = user?.role === 'client' ? '/' : '/staff/dashboard';
		return <Navigate to={home} replace />;
	}

	return <Outlet />;
};

export default GuestGuard;
