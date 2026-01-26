import { useState } from "react";
import { Link } from "react-router";
import styles from './Header.module.css';

const Header = ({ children }) => {
	const [isNavCollapsed, setIsNavCollapsed] = useState(true);

	const handleNavCollapse = () => setIsNavCollapsed(!isNavCollapsed);

	return (
		<nav
			className={`navbar navbar-expand-lg bg-primary ${styles.navbarAnimated}`}
			data-bs-theme="dark"
		>
			<div className="container-fluid">
				<Link to="/" className="navbar-brand">Time Reserve</Link>

				<button
					className="navbar-toggler"
					type="button"
					onClick={handleNavCollapse}
					aria-expanded={!isNavCollapsed}
					aria-label="Toggle navigation"
				>
					<span className="navbar-toggler-icon"></span>
				</button>

				<div 
					id="navbarColor01" 
					className={`${isNavCollapsed ? 'collapse' : ''} navbar-collapse`}
				>
					{children}
				</div>
			</div>
		</nav>
	);
}

export default Header;