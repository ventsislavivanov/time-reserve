import { GenericForm, GenericList, SkeletonForm, SkeletonList } from '../../../components/common/ui';
import { useEntityManager } from '../../../hooks';
import * as serviceService from '../services/serviceService';
import { useServiceForm } from '../hooks/useServiceForm';

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
