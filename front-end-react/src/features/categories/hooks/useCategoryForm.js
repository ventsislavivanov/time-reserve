import { useMemo } from 'react';
import { categoryRules } from "../validations/categoryRules.js";

export const useCategoryForm = () => {
	const rules = useMemo(() => categoryRules(), []);

	const formFields = useMemo(() => [
		{
			name: 'name',
			label: 'Name',
			placeholder: 'e.g. Category name',
			type: 'input'
		}
	], []);

	const listColumns = useMemo(() => [
		{ key: 'name', label: 'Name', className: 'fw-bold' }
	], []);

	const initialFormState = useMemo(() => ({
		name: ''
	}), []);

	return {
		formFields,
		listColumns,
		rules,
		initialFormState
	};
};