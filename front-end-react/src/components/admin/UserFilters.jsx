import React, { useState } from 'react';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { FormSelect, SearchInput } from "../common/form-elements";

export default function UserFilters({ filters, onFilterChange, onReset }) {
	const [localFilters, setLocalFilters] = useState(filters);

	const roleOptions = [
		{ value: 'admin', label: 'Admin' },
		{ value: 'worker', label: 'Worker' },
		{ value: 'client', label: 'Client' },
	];

	const genderOptions = [
		{ value: 'male', label: 'Male' },
		{ value: 'female', label: 'Female' },
		{ value: 'other', label: 'Other' },
	];


	const handleApply = () => {
		Object.keys(localFilters).forEach(key => {
			onFilterChange(key, localFilters[key]);
		});
	};

	const handleReset = () => {
		const defaultFilters = { search: "", role: "", gender: "" };
		setLocalFilters(defaultFilters);
		onReset();
	};

	return (
		<div className="card shadow-sm border-0 mb-4 p-3 bg-white rounded-3">
			<div className="row g-3 align-items-end">
				<SearchInput
					placeholder="Search by name, email or phone..."
					value={localFilters.search}
					onChange={(val) => setLocalFilters(prev => ({ ...prev, search: val }))}
				/>

				<FormSelect
					icon="user-tag"
					placeholder="All Roles"
					value={localFilters.role}
					options={roleOptions}
					onChange={(val) => setLocalFilters(prev => ({ ...prev, role: val }))}
				/>

				<FormSelect
					icon="venn-diagram"
					placeholder="All Genders"
					value={localFilters.gender}
					options={genderOptions}
					onChange={(val) => setLocalFilters(prev => ({ ...prev, gender: val }))}
				/>

				<div className="col-md-2 d-flex gap-2">
					<button className="btn btn-sm btn-primary w-100 shadow-sm" onClick={handleApply}>
						<FontAwesomeIcon icon="filter" className="me-2" />
						Apply
					</button>
					<button className="btn btn-sm btn-outline-secondary shadow-sm" onClick={handleReset} title="Reset">
						<FontAwesomeIcon icon="undo" />
					</button>
				</div>
			</div>
		</div>
	);
}