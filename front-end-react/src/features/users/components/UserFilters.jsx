import { useState } from 'react';
import { SearchInput, Select, UIButton } from "../../../components/common/ui";

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

				<Select
					icon="user-tag"
					placeholder="All Roles"
					value={localFilters.role}
					options={roleOptions}
					onChange={(val) => setLocalFilters(prev => ({ ...prev, role: val }))}
				/>

				<Select
					icon="venn-diagram"
					placeholder="All Genders"
					value={localFilters.gender}
					options={genderOptions}
					onChange={(val) => setLocalFilters(prev => ({ ...prev, gender: val }))}
				/>

				<div className="col-md-2 d-flex gap-2">
					<UIButton size="sm"
							  className="w-100 shadow-sm"
							  onClick={handleApply}
							  icon="filter"
					>
						Apply
					</UIButton>

					<UIButton size="sm"
							  variant="outline-secondary"
							  className="shadow-sm"
							  onClick={handleReset}
							  title="Reset"
							  icon="undo"
					/>
				</div>
			</div>
		</div>
	);
}