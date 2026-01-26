import { Link, useLocation } from "react-router";

const UINavLink = ({ to, children }) => {
	const location = useLocation();
	const isActive = location.pathname === to;

	return (
		<li className="nav-item">
			<Link
				to={to}
				className={`nav-link ${isActive ? 'active fw-bold' : ''}`}
			>
				{children}
			</Link>
		</li>
	);
};

export default UINavLink;