import { useEffect, useRef, useState } from "react";
import { UIButton } from "../../";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import styles from "./RowActions.module.css";

const UIRowActions = ({ actions = [], align = "end" }) => {
	const [open, setOpen] = useState(false);
	const ref = useRef(null);

	useEffect(() => {
		const handleClickOutside = (e) => {
			if (ref.current && !ref.current.contains(e.target)) {
				setOpen(false);
			}
		};

		const handleAnotherDropdownOpened = () => {
			setOpen(false);
		};

		document.addEventListener("mousedown", handleClickOutside);
		document.addEventListener("ui-row-actions-open", handleAnotherDropdownOpened);

		return () => {
			document.removeEventListener("mousedown", handleClickOutside);
			document.removeEventListener("ui-row-actions-open", handleAnotherDropdownOpened);
		};
	}, []);

	const toggle = () => {
		if (!open) {
			document.dispatchEvent(new CustomEvent("ui-row-actions-open"));
		}
		setOpen(!open);
	};

	if (!actions.length) return null;

	return (
		<div ref={ref}>
			{/* DESKTOP */}
			<div className={`d-none d-md-flex justify-content-${align} gap-2`}>
				{actions.map((action) => (
					<UIButton
						key={action.key || action.title}
						size={action.size || "sm"}
						variant={action.variant || "light"}
						className={`${action.className || ''} ${styles.actionButton}`}
						style={action.style}
						title={action.title}
						onClick={action.onClick}
						icon={action.icon}
						iconClassName={action.iconClassName}
					>
						{action.label}
					</UIButton>
				))}
			</div>

			{/* MOBILE */}
			<div className="d-md-none position-relative text-end">
				<UIButton
					size="sm"
					variant="light"
					className="border"
					onClick={toggle}
				>
					<FontAwesomeIcon icon="ellipsis-vertical" />
				</UIButton>

				{open && (
					<div
						className="dropdown-menu show mt-2 shadow-sm"
						style={{ right: 0, left: "auto" }}
					>
						{actions.map((action) => (
							<button
								key={action.key || action.title}
								className="dropdown-item d-flex align-items-center gap-2"
								onClick={() => {
									setOpen(false);
									action.onClick();
								}}
							>
								{action.icon && (
									<FontAwesomeIcon
										icon={action.icon}
										className={action.iconClassName}
										fixedWidth
									/>
								)}

								<span className="text-body">
                    				{action.label || action.title}
                				</span>
							</button>
						))}
					</div>
				)}

			</div>
		</div>
	);
};

export default UIRowActions;