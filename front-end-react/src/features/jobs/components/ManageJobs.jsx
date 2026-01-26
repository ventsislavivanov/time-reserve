import { useState, useEffect } from 'react';

import AddNewJob from './AddNewJob';
import JobsList from './JobsList.jsx';

import {
    getJobPositions,
    createJobPosition,
    updateJobPosition,
    deleteJobPosition
} from '../services/jobPositionService.js';
import { notify } from "../../../services";

const ManageJobs = () => {
    const [positions, setPositions] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    const [isEditing, setIsEditing] = useState(false);
    const [currentPosition, setCurrentPosition] = useState({
        name: '',
        description: ''
    });

    useEffect(() => {
        loadPositions();
    }, []);

    const loadPositions = async () => {
        try {
            setIsLoading(true);
            const data = await getJobPositions();
            setPositions(data);
        } catch {
            notify.error('Failed to load job positions');
        } finally {
            setIsLoading(false);
        }
    };

    const handleSubmit = async () => {
        try {
            if (isEditing) {
                await updateJobPosition(currentPosition.id, currentPosition);
                notify.success('Position updated successfully');
            } else {
                await createJobPosition(currentPosition);
                notify.success('Position created successfully');
            }

            resetForm();
            loadPositions();
        } catch {
            notify.error('Failed to save position');
        }
    };

    const handleEdit = (position) => {
        setCurrentPosition(position);
        setIsEditing(true);
    };

    const handleDelete = async (id) => {
        if (!window.confirm('Are you sure you want to delete this position?')) return;

        try {
            await deleteJobPosition(id);
            notify.success('Position deleted successfully');
            loadPositions();
        } catch {
            notify.error('Failed to delete position');
        }
    };

    const resetForm = () => {
        setCurrentPosition({ name: '', description: '' });
        setIsEditing(false);
    };

    return (
        <div className="container mt-4 pb-5">
            <div className="row">
                <div className="col-md-4">
                    <AddNewJob
                        isEditing={isEditing}
                        position={currentPosition}
                        setPosition={setCurrentPosition}
                        onSubmit={handleSubmit}
                        onCancel={resetForm}
                    />
                </div>

                <div className="col-md-8">
                    <JobsList
                        positions={positions}
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
