import { Link, Outlet, useNavigate } from "react-router";
import { useAuth } from "../context";
import { logout as logoutUser } from "../features/auth";
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

	return (
		<div className="d-flex flex-column min-vh-100 bg-light">
			<Header>
				<ul className="navbar-nav me-auto">
					<UINavLink to="/">Home</UINavLink>
					<UINavLink to="/our-team">Our team</UINavLink>
					<UINavLink to="/services">Services</UINavLink>
					<UINavLink to="/my-appointments">My appointments</UINavLink>
					<UINavLink to="/about-us">About us</UINavLink>
					<UINavLink to="/contact-us">Contact</UINavLink>
				</ul>

				<ul className="navbar-nav">
					{isAuthenticated ? (
						<div className="align-items-center d-flex">
							<span className="navbar-text me-2">{user?.email}</span>
							<button className="btn btn-outline-light" onClick={handleLogout}>Logout</button>
						</div>
					) : (
						<>
							<Link to="/login" className="btn btn-outline-light m-1">Log In</Link>
							<Link to="/sign-up" className="btn btn-outline-light m-1">Sign up</Link>
						</>
					)}
				</ul>
			</Header>

			<main className="d-flex flex-column flex-grow-1">
				<Outlet />
			</main>

			<Footer />
		</div>
	);
}