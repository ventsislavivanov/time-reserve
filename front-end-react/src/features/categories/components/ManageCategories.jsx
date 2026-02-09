import { GenericForm, GenericList, SkeletonList } from '../../../components/common/ui';
import { useEntityManager } from '../../../hooks';
import * as categoryService from '../services/categoryService.js';
import { useCategoryForm } from '../hooks/useCategoryForm';

const ManageCategories = () => {
    const {
        formFields,
        listColumns,
        rules,
        initialFormState
    } = useCategoryForm();

    const {
        items: categories,
        isLoading,
        isEditing,
        currentItem,
        handleSubmit,
        handleEdit,
        handleDelete,
        resetForm
    } = useEntityManager(categoryService, 'Category', initialFormState);

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
                    {isLoading ? (
                        <SkeletonList rows={5} />
                    ) : (
                        <GenericList
                            items={categories}
                            onEdit={handleEdit}
                            onDelete={handleDelete}
                            title="Categories List"
                            columns={listColumns}
                            emptyMessage="No categories found. Create one to get started."
                        />
                    )}
                </div>
            </div>
        </div>
    );
};

export default ManageCategories;