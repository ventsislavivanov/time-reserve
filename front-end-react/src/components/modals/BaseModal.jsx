import React from 'react';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const BaseModal = ({
   id,
   title,
   icon,
   children,
   footer,
   size = "modal-md",
   centered = false,
   staticBackdrop = false,
   onClose
}) => {
	return (
		<div
			className="modal fade"
			id={id}
			tabIndex="-1"
			aria-hidden="true"
			data-bs-backdrop={staticBackdrop ? "static" : "true"}
			data-bs-keyboard={staticBackdrop ? "false" : "true"}
		>
			<div className={`modal-dialog ${size} ${centered ? 'modal-dialog-centered' : ''}`}>
				<div className="modal-content border-0 shadow">
					<div className="modal-header bg-primary text-white border-0">
						<h5 className="modal-title fw-bold text-white">
							{icon && <FontAwesomeIcon icon={icon} className="me-2" />}
							{title}
						</h5>
						<button
							type="button"
							className="btn-close btn-close-white"
							data-bs-dismiss="modal"
							aria-label="Close"
							onClick={onClose}
						></button>
					</div>

					<div className="modal-body p-4">
						{children}
					</div>

					{footer && (
						<div className="modal-footer border-top-0 pt-0 px-4 pb-4">
							{footer}
						</div>
					)}
				</div>
			</div>
		</div>
	);
};

export default BaseModal;