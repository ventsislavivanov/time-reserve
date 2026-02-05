import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const UINavTabLink = ({ tabKey, activeTab, onClick, icon, children }) => {
	const isActive = activeTab === tabKey;

	return (
		<li className="nav-item">
			<button
				type="button"
				className={`nav-link ${isActive ? "active" : ""}`}
				onClick={() => onClick(tabKey)}
			>
				{icon && <FontAwesomeIcon icon={icon} className="me-2" />}
				{children}
			</button>
		</li>
	);
}

export default UINavTabLink