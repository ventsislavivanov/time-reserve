import React, { useState, useEffect } from 'react';
import { getJobPositions, createJobPosition, updateJobPosition, deleteJobPosition } from '../../services/jobPositionService';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { toast } from 'react-toastify';

const ManageJobPositions = () => {
    const [positions, setPositions] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    const [isEditing, setIsEditing] = useState(false);
    const [currentPosition, setCurrentPosition] = useState({ name: '', description: '' });

    useEffect(() => {
        loadPositions();
    }, []);

    const loadPositions = async () => {
        try {
            setIsLoading(true);
            const data = await getJobPositions();
            setPositions(data);
        } catch (error) {
            toast.error('Failed to load job positions');
        } finally {
            setIsLoading(false);
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            if (isEditing) {
                await updateJobPosition(currentPosition.id, currentPosition);
                toast.success('Position updated successfully');
            } else {
                await createJobPosition(currentPosition);
                toast.success('Position created successfully');
            }
            setCurrentPosition({ name: '', description: '' });
            setIsEditing(false);
            loadPositions();
        } catch (error) {
            toast.error('Failed to save position');
        }
    };

    const handleEdit = (position) => {
        setCurrentPosition(position);
        setIsEditing(true);
    };

    const handleDelete = async (id) => {
        if (window.confirm('Are you sure you want to delete this position?')) {
            try {
                await deleteJobPosition(id);
                toast.success('Position deleted successfully');
                loadPositions();
            } catch (error) {
                toast.error('Failed to delete position');
            }
        }
    };

    return (
        <div className="container mt-4">
            <div className="row">
                <div className="col-md-4">
                    <div className="card shadow-sm">
                        <div className="card-header bg-primary text-white">
                            <h5 className="mb-0">
                                <FontAwesomeIcon icon={isEditing ? "edit" : "plus-circle"} className="me-2" />
                                {isEditing ? 'Edit Position' : 'Add New Position'}
                            </h5>
                        </div>
                        <div className="card-body">
                            <form onSubmit={handleSubmit}>
                                <div className="mb-3">
                                    <label className="form-label">Name</label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        value={currentPosition.name}
                                        onChange={(e) => setCurrentPosition({ ...currentPosition, name: e.target.value })}
                                        required
                                        placeholder="e.g. Hairdresser"
                                    />
                                </div>
                                <div className="mb-3">
                                    <label className="form-label">Description</label>
                                    <textarea
                                        className="form-control"
                                        value={currentPosition.description}
                                        onChange={(e) => setCurrentPosition({ ...currentPosition, description: e.target.value })}
                                        placeholder="Brief description of the role..."
                                        rows="3"
                                    ></textarea>
                                </div>
                                <div className="d-grid gap-2">
                                    <button type="submit" className="btn btn-primary">
                                        {isEditing ? 'Update Position' : 'Save Position'}
                                    </button>
                                    {isEditing && (
                                        <button
                                            type="button"
                                            className="btn btn-outline-secondary"
                                            onClick={() => {
                                                setIsEditing(false);
                                                setCurrentPosition({ name: '', description: '' });
                                            }}
                                        >
                                            Cancel
                                        </button>
                                    )}
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div className="col-md-8">
                    <div className="card shadow-sm">
                        <div className="card-header bg-white">
                            <h5 className="mb-0 text-primary">Job Positions List</h5>
                        </div>
                        <div className="card-body">
                            {isLoading ? (
                                <div className="text-center py-4">
                                    <div className="spinner-border text-primary" role="status">
                                        <span className="visually-hidden">Loading...</span>
                                    </div>
                                </div>
                            ) : positions.length === 0 ? (
                                <p className="text-center text-muted py-4">No job positions found. Create one to get started.</p>
                            ) : (
                                <div className="table-responsive">
                                    <table className="table table-hover align-middle">
                                        <thead className="table-light">
                                            <tr>
                                                <th>Name</th>
                                                <th>Description</th>
                                                <th className="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {positions.map((position) => (
                                                <tr key={position.id}>
                                                    <td className="fw-bold">{position.name}</td>
                                                    <td className="text-muted small">{position.description}</td>
                                                    <td className="text-end">
                                                        <button
                                                            className="btn btn-sm btn-outline-primary me-2"
                                                            onClick={() => handleEdit(position)}
                                                            title="Edit"
                                                        >
                                                            <FontAwesomeIcon icon="edit" />
                                                        </button>
                                                        <button
                                                            className="btn btn-sm btn-outline-danger"
                                                            onClick={() => handleDelete(position.id)}
                                                            title="Delete"
                                                        >
                                                            <FontAwesomeIcon icon="trash" />
                                                        </button>
                                                    </td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ManageJobPositions;
