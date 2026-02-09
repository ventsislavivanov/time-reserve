import { GenericForm, GenericList, SkeletonList } from '../../../components/common/ui';
import { useEntityManager } from '../../../hooks';
import * as jobService from '../services/jobService.js';
import { useJobForm } from '../hooks/useJobForm';

const ManageJobs = () => {
    const {
        formFields,
        listColumns,
        rules,
        initialFormState
    } = useJobForm();

    const {
        items: jobs,
        isLoading,
        isEditing,
        currentItem,
        handleSubmit,
        handleEdit,
        handleDelete,
        resetForm
    } = useEntityManager(jobService, 'Job position', initialFormState);

    return (
        <div className="container mt-4 pb-5">
            <div className="row">
                <div className="col-md-4">
                    <GenericForm
                        isEditing={isEditing}
                        item={currentItem}
                        onSubmit={handleSubmit}
                        onCancel={resetForm}
                        title="Job Position"
                        fields={formFields}
                        rules={rules}
                    />
                </div>

                <div className="col-md-8">
                    {isLoading ? (
                        <SkeletonList rows={5} />
                    ) : (
                        <GenericList
                            items={jobs}
                            onEdit={handleEdit}
                            onDelete={handleDelete}
                            title="Job Positions List"
                            columns={listColumns}
                            emptyMessage="No job positions found. Create one to get started."
                        />
                    )}
                </div>
            </div>
        </div>
    );
};

export default ManageJobs;