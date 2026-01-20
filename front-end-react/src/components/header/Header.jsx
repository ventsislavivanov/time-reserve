import { Link } from "react-router";
import styles from './Header.module.css';

export default function Header({ children }) {

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
					data-bs-toggle="collapse"
					data-bs-target="#navbarColor01"
				>
					<span className="navbar-toggler-icon"></span>
				</button>

				<div id="navbarColor01" className="collapse navbar-collapse">
					{children}
				</div>
			</div>
		</nav>
	);
}