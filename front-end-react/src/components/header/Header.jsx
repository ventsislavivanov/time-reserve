import { Link } from "react-router";
import styles from './Header.module.css';
import {  } from "../../services/auth.js";

const links = [
	{ name: '', label: 'Home' },
];

export default function Header() {

	return (
		<nav
			className={`navbar navbar-expand-lg bg-primary ${styles.navbarAnimated}`}
			data-bs-theme="dark"
		>
			<div className="container-fluid">
				<Link to="/"
					  className="navbar-brand"
				>Movie finder</Link>

				<button
					className="navbar-toggler"
					type="button"
					data-bs-toggle="collapse"
					data-bs-target="#navbarColor01"
					aria-controls="navbarColor01"
					aria-expanded="false"
					aria-label="Toggle navigation"
				>
					<span className="navbar-toggler-icon"></span>
				</button>

				<div id="navbarColor01" className="collapse navbar-collapse">
					<ul className="navbar-nav me-auto">
						{links.map((link) => (
							<li key={link.name} className="nav-item">
								<Link to={link.name} className="nav-link">{link.label}</Link>
							</li>
						))}
					</ul>

					<ul className="navbar-nav">
						{/*{isAuthenticated*/}
						{/*	? (*/}
						{/*		<div className="align-items-center d-flex">*/}
						{/*			<strong className="navbar-text p-1">{userEmail}</strong>*/}
						{/*			<button type="button" className="btn btn-outline-light btn-lg" onClick={logoutHandle}>Log out</button>*/}
						{/*		</div>*/}
						{/*	)*/}
						{/*	: (*/}
								<>
									<Link to="/login" className="btn btn-outline-light btn-lg m-1" role="button">Log In</Link>

									<Link to="/sign-up" className="btn btn-outline-light btn-lg m-1" role="button">Sign up</Link>
								</>
						{/*	)*/}
						{/*}*/}
					</ul>
				</div>
			</div>
		</nav>
	);
}