import { GenericForm, GenericList } from '../../../components/common/ui';
import { useEntityManager } from '../../../hooks';
import * as jobService from '../services/jobService.js';
import { jobRules } from "../validations/jobRules.js";

console.log(jobService);

const ManageJobs = () => {
    const {
        items: jobs,
        isLoading,
        isEditing,
        currentItem,
        handleSubmit,
        handleEdit,
        handleDelete,
        resetForm
    } = useEntityManager(jobService, 'Job position', {
        name: '',
        description: ''
    });

    const rules = jobRules();

    const formFields = [
        {
            name: 'name',
            label: 'Name',
            placeholder: 'e.g. Job position',
            type: 'input'
        },
        {
            name: 'description',
            label: 'Description',
            placeholder: 'Brief description of the role...',
            type: 'textarea',
            rows: 3
        }
    ];

    const listColumns = [
        { key: 'name', label: 'Name', className: 'fw-bold' },
        { key: 'description', label: 'Description', className: 'text-muted small' }
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
                        title="Job Position"
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
                        title="Job Positions List"
                        columns={listColumns}
                        emptyMessage="No job positions found. Create one to get started."
                    />
                </div>
            </div>
        </div>
    );
};

export default ManageJobs;
