import { useState, useEffect } from 'react';

import AddNewJob from './AddNewJob';
import JobsList from './JobsList.jsx';

import {
    getJobs,
    createJob,
    updateJob,
    deleteJob
} from '../services/jobService.js';
import { notify } from "../../../services";

const ManageJobs = () => {
    const [jobs, setJobs] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    const [isEditing, setIsEditing] = useState(false);
    const [currentJob, setCurrentJob] = useState({
        name: '',
        description: ''
    });

    useEffect(() => {
        loadJobs();
    }, []);

    const loadJobs = async () => {
        try {
            setIsLoading(true);
            const data = await getJobs();
            setJobs(data);
        } catch {
            notify.error('Failed to load job positions');
        } finally {
            setIsLoading(false);
        }
    };

    const handleSubmit = async (data) => {
        try {
            if (isEditing) {
                await updateJob(currentJob.id, data);
                notify.success('Position updated successfully');
            } else {
                await createJob(data);
                notify.success('Position created successfully');
            }

            resetForm();
            loadJobs();
        } catch {
            notify.error('Failed to save position');
        }
    };

    const handleEdit = (job) => {
        setCurrentJob(job);
        setIsEditing(true);
    };

    const handleDelete = async (id) => {
        if (!window.confirm('Are you sure you want to delete this job position?')) return;

        try {
            await deleteJob(id);
            notify.success('Job position deleted successfully');
            resetForm();
            loadJobs();
        } catch {
            notify.error('Failed to delete job position');
        }
    };

    const resetForm = () => {
        setCurrentJob({ name: '', description: '' });
        setIsEditing(false);
    };

    return (
        <div className="container mt-4 pb-5">
            <div className="row">
                <div className="col-md-4">
                    <AddNewJob
                        isEditing={isEditing}
                        job={currentJob}
                        onSubmit={handleSubmit}
                        onCancel={resetForm}
                    />
                </div>

                <div className="col-md-8">
                    <JobsList
                        jobs={jobs}
                        isLoading={isLoading}
                        onEdit={handleEdit}
                        onDelete={handleDelete}
                    />
                </div>
            </div>
        </div>
    );
};

export default ManageJobs;
