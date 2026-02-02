import { GenericForm, GenericList, SkeletonForm, SkeletonList  } from '../../../components/common/ui';
import { useEntityManager } from '../../../hooks';
import * as serviceService from '../services/serviceService.js';
import { useCategories } from "../../categories";
import { serviceRules } from "../validations/serviceRules.js";

const ManageServices = () => {
    const { categories, isLoading: isCategoriesLoading } = useCategories();

    const {
        items: services,
        isLoading: isServicesLoading,
        isEditing,
        currentItem,
        handleSubmit,
        handleEdit,
        handleDelete,
        resetForm
    } = useEntityManager(serviceService, 'Service', {
        name: '',
        description: '',
        category_id: '',
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

    return (
        <div className="container mt-4 pb-5">
            <div className="row">
                <div className="col-md-4">
                    {isCategoriesLoading ? (
                        <SkeletonForm fields={8} />
                    ) : (
                        <GenericForm
                            isEditing={isEditing}
                            item={currentItem}
                            onSubmit={handleSubmit}
                            onCancel={resetForm}
                            title="Service"
                            fields={formFields}
                            rules={rules}
                        />
                    )}
                </div>

                <div className="col-md-8">
                    {isServicesLoading ? (
                        <SkeletonList rows={5} />
                    ) : (
                        <GenericList
                            items={services}
                            onEdit={handleEdit}
                            onDelete={handleDelete}
                            title="Services List"
                            columns={listColumns}
                            emptyMessage="No services found. Create one to get started."
                        />
                    )}
                </div>
            </div>
        </div>
    );
};

export default ManageServices;
