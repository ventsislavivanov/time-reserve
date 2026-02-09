import { useMemo } from 'react';
import { useCategories } from "../../categories";
import { serviceRules } from "../validations/serviceRules.js";

export const useServiceForm = () => {
	const { categories, isLoading: isCategoriesLoading } = useCategories();
	const rules = useMemo(() => serviceRules(), []);

	const formFields = useMemo(() => [
		{
			name: 'name',
			label: 'Name',
			placeholder: 'e.g. Service',
			type: 'input'
		},
		{
			name: 'description',
			label: 'Description',
			placeholder: 'Brief description of the service...',
			type: 'textarea',
			rows: 3
		},
		{
			name: 'category_id',
			label: 'Category',
			placeholder: 'Select a category...',
			type: 'select',
			options: categories,
		},
		{
			name: 'duration',
			label: 'Duration (minutes)',
			placeholder: 'e.g. 15',
			type: 'number'
		},
		{
			name: 'price',
			label: 'Price',
			placeholder: 'e.g. 30 €',
			type: 'number'
		},
		{
			name: 'preparation_time',
			label: 'Preparation time (minutes)',
			placeholder: 'e.g. 5',
			type: 'number'
		},
		{
			name: 'cleanup_time',
			label: 'Cleaning time (minutes)',
			placeholder: 'e.g. 5',
			type: 'number'
		},
		{
			name: 'is_active',
			label: 'Is active',
			type: 'checkbox'
		},
	], [categories]);

	const listColumns = useMemo(() => [
		{ key: 'name', label: 'Name', className: 'fw-bold' },
		{ key: 'description', label: 'Description', className: 'text-muted small' }
	], []);

	const initialFormState = useMemo(() => ({
		name: '',
		description: '',
		category_id: '',
		duration: '',
		price: '',
		preparation_time: '',
		cleanup_time: '',
		is_active: true
	}), []);

	return {
		formFields,
		listColumns,
		rules,
		initialFormState,
		isCategoriesLoading
	};
};