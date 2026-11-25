import { GenericForm, GenericList, SkeletonList } from '../../components/common/ui/index.js';
import { useEntityManager } from '../../hooks/index.js';
import * as jobService from './services/jobService.js';
import { useJobForm } from './hooks/useJobForm.js';

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
        <div className="mx-auto w-full max-w-7xl px-4 mt-6 pb-12">
            <div className="grid grid-cols-12 gap-4">
                <div className="col-span-12 md:col-span-4">
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

                <div className="col-span-12 md:col-span-8">
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