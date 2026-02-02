import { GenericForm, GenericList } from '../../../components/common/ui';
import { useEntityManager } from '../../../hooks';
import * as categoryService from '../services/categoryService.js';
import { categoryRules } from "../validations/categoryRules.js";

const ManageCategories = () => {
    const {
        items: categories,
        isLoading,
        isEditing,
        currentItem,
        handleSubmit,
        handleEdit,
        handleDelete,
        resetForm
    } = useEntityManager(categoryService, 'Category', { name: '' });

    const rules = categoryRules();

    const formFields = [
        {
            name: 'name',
            label: 'Name',
            placeholder: 'e.g. Category name',
            type: 'input'
        }
    ];

    const listColumns = [
        { key: 'name', label: 'Name', className: 'fw-bold' }
    ];

    return (
        <div className="container mt-4 pb-5">
            <div className="row">
                <div className="col-md-4">
                    <GenericForm
                        isEditing={isEditing}
                        item={currentItem}
                        onSubmit={handleSubmit}
                        onCancel={resetForm}
                        title="Category"
                        fields={formFields}
                        rules={rules}
                    />
                </div>

                <div className="col-md-8">
                    <GenericList
                        items={categories}
                        isLoading={isLoading}
                        onEdit={handleEdit}
                        onDelete={handleDelete}
                        title="Categories List"
                        columns={listColumns}
                        emptyMessage="No categories found. Create one to get started."
                    />
                </div>
            </div>
        </div>
    );
};

export default ManageCategories;