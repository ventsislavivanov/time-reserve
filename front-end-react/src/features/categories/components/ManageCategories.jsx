import { useState, useEffect } from 'react';

import AddNewCategory from './AddNewCategory.jsx';
import CategoriesList from './CategoriesList.jsx';

import {
    getAll,
    create,
    update,
    remove
} from '../services/categoryService.js';
import { notify } from "../../../services";

const ManageCategories = () => {
    const [categories, setCategories] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    const [isEditing, setIsEditing] = useState(false);
    const [currentCategory, setCurrentCategory] = useState({
        name: '',
        description: ''
    });

    useEffect(() => {
        loadCategories();
    }, []);

    const loadCategories = async () => {
        try {
            setIsLoading(true);
            const data = await getAll();
            setCategories(data);
        } catch {
            console.error('Failed to load categories');
        } finally {
            setIsLoading(false);
        }
    };

    const handleSubmit = async (data) => {
        try {
            if (isEditing) {
                await update(currentCategory.id, data);
                notify.success('Category updated successfully');
            } else {
                await create(data);
                notify.success('Category created successfully');
            }

            resetForm();
            loadCategories();
        } catch {
            console.error('Failed to save position');
        }
    };

    const handleEdit = (category) => {
        setCurrentCategory(category);
        setIsEditing(true);
    };

    const handleDelete = async (id) => {
        if (!window.confirm('Are you sure you want to delete this category?')) return;

        try {
            await remove(id);
            notify.success('Category deleted successfully');
            resetForm();
            loadCategories();
        } catch {
            console.error('Failed to delete category');
        }
    };

    const resetForm = () => {
        setCurrentCategory({ name: '', description: '' });
        setIsEditing(false);
    };

    return (
        <div className="container mt-4 pb-5">
            <div className="row">
                <div className="col-md-4">
                    <AddNewCategory
                        isEditing={isEditing}
                        category={currentCategory}
                        onSubmit={handleSubmit}
                        onCancel={resetForm}
                    />
                </div>

                <div className="col-md-8">
                    <CategoriesList
                        categories={categories}
                        isLoading={isLoading}
                        onEdit={handleEdit}
                        onDelete={handleDelete}
                    />
                </div>
            </div>
        </div>
    );
};

export default ManageCategories;
