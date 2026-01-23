import React from 'react';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export default function Select({
	label,
	value,
	onChange,
	options = [],
	icon,
	placeholder = "Select option...",
	className = "col-md-3"
}) {
	return (
		<div className={className}>
			<div className="input-group">
				{icon && (
					<span className="input-group-text bg-white border-end-0">
                        <FontAwesomeIcon icon={icon} className="text-muted small" />
                    </span>
				)}
				<select
					className={`form-select ${icon ? 'border-start-0' : ''}`}
					value={value}
					onChange={(e) => onChange(e.target.value)}
				>
					{placeholder && <option value="">{placeholder}</option>}
					{options.map((opt) => (
						<option key={opt.value} value={opt.value}>
							{opt.label}
						</option>
					))}
				</select>
			</div>
		</div>
	);
};