import { useState } from 'react';
import { SearchInput, Select, UIButton, UICard } from "../../../components/common/ui";

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
		<UICard className="mb-6" bodyClassName="p-4">
			<div className="flex flex-col gap-3 md:flex-row md:items-center">
				<SearchInput
					className="md:max-w-sm md:flex-1"
					placeholder="Search by name, email or phone..."
					value={localFilters.search}
					onChange={(val) => setLocalFilters(prev => ({ ...prev, search: val }))}
				/>

				<Select
					icon="user-tag"
					placeholder="All roles"
					value={localFilters.role}
					options={roleOptions}
					onChange={(val) => setLocalFilters(prev => ({ ...prev, role: val }))}
				/>

				<Select
					icon="venn-diagram"
					placeholder="All genders"
					value={localFilters.gender}
					options={genderOptions}
					onChange={(val) => setLocalFilters(prev => ({ ...prev, gender: val }))}
				/>

				<div className="flex gap-2 md:ml-auto">
					<UIButton onClick={handleApply} icon="filter">
						Apply
					</UIButton>

					<UIButton
						variant="outline-secondary"
						onClick={handleReset}
						title="Reset"
						icon="undo"
					/>
				</div>
			</div>
		</UICard>
	);
}
