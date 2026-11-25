import { GenericForm, GenericList, SkeletonList } from '../../components/common/ui/index.js';
import { useEntityManager } from '../../hooks/index.js';
import * as categoryService from './services/categoryService.js';
import { useCategoryForm } from './hooks/useCategoryForm.js';

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
        <div className="mx-auto w-full max-w-7xl px-4 mt-6 pb-12">
            <div className="grid grid-cols-12 gap-4">
                <div className="col-span-12 md:col-span-4">
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

                <div className="col-span-12 md:col-span-8">
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