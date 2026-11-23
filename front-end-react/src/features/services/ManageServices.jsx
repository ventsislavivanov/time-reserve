import { GenericForm, GenericList, SkeletonForm, SkeletonList } from '../../components/common/ui/index.js';
import { useEntityManager } from '../../hooks/index.js';
import * as serviceService from './services/serviceService.js';
import { useServiceForm } from './hooks/useServiceForm.js';

const ManageServices = () => {
    const {
        formFields,
        listColumns,
        rules,
        initialFormState,
        isCategoriesLoading
    } = useServiceForm();

    const {
        items: services,
        isLoading: isServicesLoading,
        isEditing,
        currentItem,
        handleSubmit,
        handleEdit,
        handleDelete,
        resetForm
    } = useEntityManager(serviceService, 'Service', initialFormState);

    return (
        <div className="mx-auto w-full max-w-7xl px-4 mt-6 pb-12">
            <div className="grid grid-cols-12 gap-4">
                <div className="col-span-12 md:col-span-4">
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

                <div className="col-span-12 md:col-span-8">
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
