import { Link, Outlet, useNavigate } from "react-router";
import { useAuth } from "../context";
import { logout as logoutUser } from "../features/auth";
import { Button } from "@/components/ui/button";
import Header from "../components/layout/header/Header.jsx";
import Footer from "../components/layout/footer/Footer.jsx";
import { UINavLink } from "../components/common/ui/index.js";

export default function ClientLayout() {
	const navigate = useNavigate();

	const { isAuthenticated, user, logout } = useAuth();

	const handleLogout = async () => {
		try {
			await logoutUser();
			localStorage.removeItem("token");
			logout();
			navigate('/');
		} catch (error) {
			console.log("Logout error", error);
		}
	};

	const actions = isAuthenticated ? (
		<>
			<span className="truncate text-sm text-muted-foreground">{user?.email}</span>
			<Button variant="outline" size="sm" onClick={handleLogout}>Logout</Button>
		</>
	) : (
		<>
			<Button variant="ghost" size="sm" asChild><Link to="/login">Log in</Link></Button>
			<Button size="sm" asChild><Link to="/sign-up">Sign up</Link></Button>
		</>
	);

	return (
		<div className="flex min-h-screen flex-col">
			<Header actions={actions}>
				<UINavLink to="/">Home</UINavLink>
				<UINavLink to="/our-team">Our team</UINavLink>
				<UINavLink to="/services">Services</UINavLink>
				<UINavLink to="/my-appointments">My appointments</UINavLink>
				<UINavLink to="/about-us">About us</UINavLink>
				<UINavLink to="/contact-us">Contact</UINavLink>
			</Header>

			<main className="flex flex-1 flex-col">
				<Outlet />
			</main>

			<Footer />
		</div>
	);
}
