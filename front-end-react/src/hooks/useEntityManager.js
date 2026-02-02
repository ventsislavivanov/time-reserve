import { useState, useEffect } from 'react';
import { notify } from "../services";

export const useEntityManager = (service, entityName, initialState = {}) => {
	const [items, setItems] = useState([]);
	const [isLoading, setIsLoading] = useState(true);
	const [isEditing, setIsEditing] = useState(false);
	const [currentItem, setCurrentItem] = useState(initialState);

	useEffect(() => {
		loadItems();
	}, []);

	const loadItems = async () => {
		try {
			setIsLoading(true);
			const data = await service.getAll();
			setItems(data);
		} catch {
			console.error(`Failed to load ${entityName}`);
		} finally {
			setIsLoading(false);
		}
	};

	const handleSubmit = async (data) => {
		try {
			if (isEditing) {
				await service.update(currentItem.id, data);
				notify.success(`${entityName} updated successfully`);
			} else {
				await service.create(data);
				notify.success(`${entityName} created successfully`);
			}

			resetForm();
			loadItems();
		} catch {
			console.error(`Failed to save ${entityName}`);
		}
	};

	const handleEdit = (item) => {
		setCurrentItem(item);
		setIsEditing(true);
	};

	const handleDelete = async (id) => {
		if (!window.confirm(`Are you sure you want to delete this ${entityName}?`)) return;

		try {
			await service.remove(id);
			notify.success(`${entityName} deleted successfully`);
			resetForm();
			loadItems();
		} catch {
			console.error(`Failed to delete ${entityName}`);
		}
	};

	const resetForm = () => {
		setCurrentItem(initialState);
		setIsEditing(false);
	};

	return {
		items,
		isLoading,
		isEditing,
		currentItem,
		handleSubmit,
		handleEdit,
		handleDelete,
		resetForm
	};
};