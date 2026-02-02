import { GenericForm, GenericList } from '../../../components/common/ui';
import { useEntityManager } from '../../../hooks';
import * as serviceService from '../services/serviceService.js';
import { getAll as getAllCategory  } from "../../categories";
import { serviceRules } from "../validations/serviceRules.js";
import { useEffect, useState } from "react";

const ManageServices = () => {
    const [categories, setCategories] = useState([]);
    const [isCategoriesLoading, setIsCategoriesLoading] = useState(true);

    const {
        items: jobs,
        isLoading,
        isEditing,
        currentItem,
        handleSubmit,
        handleEdit,
        handleDelete,
        resetForm
    } = useEntityManager(serviceService, 'Service', {
        name: '',
        description: '',
        category: '',
        duration: '',
        price: '',
        preparation_time: '',
        cleaning_time: '',
        is_active: true
    });

    const rules = serviceRules();

    const formFields = [
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
            name: 'category',
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
            name: 'cleaning_time',
            label: 'Cleaning time (minutes)',
            placeholder: 'e.g. 5',
            type: 'number'
        },
        {
            name: 'is_active',
            label: 'Is active',
            type: 'checkbox'
        },
    ];

    const listColumns = [
        { key: 'name', label: 'Name', className: 'fw-bold' },
        { key: 'description', label: 'Description', className: 'text-muted small' }
    ];


    useEffect(() => {
        const fetchCategories = async () => {
            try {
                setIsCategoriesLoading(true);
                const data = await getAllCategory();
                setCategories(data);
            } catch (error) {
                console.error('Error fetching categories:', error);
            } finally {
                setIsCategoriesLoading(false);
            }
        };
        fetchCategories();
    }, []);

    if (isCategoriesLoading) {
        return (
            <div className="container mt-4 pb-5">
                <div className="d-flex justify-content-center align-items-center" style={{ minHeight: '400px' }}>
                    <div className="spinner-border text-primary" role="status">
                        <span className="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        );
    }

    return (
        <div className="container mt-4 pb-5">
            <div className="row">
                <div className="col-md-4">
                    <GenericForm
                        isEditing={isEditing}
                        item={currentItem}
                        onSubmit={handleSubmit}
                        onCancel={resetForm}
                        title="Service"
                        fields={formFields}
                        rules={rules}
                    />
                </div>

                <div className="col-md-8">
                    <GenericList
                        items={jobs}
                        isLoading={isLoading}
                        onEdit={handleEdit}
                        onDelete={handleDelete}
                        title="Services List"
                        columns={listColumns}
                        emptyMessage="No services found. Create one to get started."
                    />
                </div>
            </div>
        </div>
    );
};

export default ManageServices;
