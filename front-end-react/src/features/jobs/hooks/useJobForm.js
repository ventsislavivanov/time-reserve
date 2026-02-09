import { useMemo } from 'react';
import { jobRules } from "../validations/jobRules.js";

export const useJobForm = () => {
	const rules = useMemo(() => jobRules(), []);

	const formFields = useMemo(() => [
		{
			name: 'name',
			label: 'Name',
			placeholder: 'e.g. Job position',
			type: 'input'
		},
		{
			name: 'description',
			label: 'Description',
			placeholder: 'Brief description of the role...',
			type: 'textarea',
			rows: 3
		}
	], []);

	const listColumns = useMemo(() => [
		{ key: 'name', label: 'Name', className: 'fw-bold' },
		{ key: 'description', label: 'Description', className: 'text-muted small' }
	], []);

	const initialFormState = useMemo(() => ({
		name: '',
		description: ''
	}), []);

	return {
		formFields,
		listColumns,
		rules,
		initialFormState
	};
};