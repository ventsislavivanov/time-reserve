import React, { useState, useEffect } from 'react';
import { getServices } from '../../services/serviceService';
import { getUserServices, syncUserServices } from '../../services/userService';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { toast } from 'react-toastify';

const WorkerServicesManager = ({ workerId }) => {
    const [allServices, setAllServices] = useState([]);
    const [selectedServiceIds, setSelectedServiceIds] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    const [isSaving, setIsSaving] = useState(false);

    useEffect(() => {
        const loadData = async () => {
            try {
                setIsLoading(true);
                const [servicesData, workerServicesData] = await Promise.all([
                    getServices(),
                    getUserServices(workerId)
                ]);
                setAllServices(servicesData);
                setSelectedServiceIds(workerServicesData.map(s => s.id));
            } catch (error) {
                toast.error('Failed to load services');
            } finally {
                setIsLoading(false);
            }
        };

        if (workerId) {
            loadData();
        }
    }, [workerId]);

    const handleToggleService = (serviceId) => {
        setSelectedServiceIds(prev =>
            prev.includes(serviceId)
                ? prev.filter(id => id !== serviceId)
                : [...prev, serviceId]
        );
    };

    const handleSave = async () => {
        try {
            setIsSaving(true);
            await syncUserServices(workerId, selectedServiceIds);
            toast.success('Worker services updated successfully');
        } catch (error) {
            toast.error('Failed to save worker services');
        } finally {
            setIsSaving(false);
        }
    };

    if (isLoading) {
        return <div className="text-center py-3"><div className="spinner-border spinner-border-sm text-primary"></div></div>;
    }

    return (
        <div className="worker-services-manager mt-4">
            <h6 className="border-bottom pb-2 mb-3">
                <FontAwesomeIcon icon="concierge-bell" className="me-2 text-primary" />
                Assigned Services
            </h6>
            <div className="row g-2">
                {allServices.length === 0 ? (
                    <div className="col-12 text-muted">No active services available.</div>
                ) : (
                    allServices.map(service => (
                        <div key={service.id} className="col-md-6 col-lg-4">
                            <div className={`card h-100 service-selection-card ${selectedServiceIds.includes(service.id) ? 'border-primary bg-light' : ''}`} 
                                 onClick={() => handleToggleService(service.id)}
                                 style={{ cursor: 'pointer' }}>
                                <div className="card-body p-2 d-flex align-items-center">
                                    <div className="form-check mb-0">
                                        <input
                                            className="form-check-input"
                                            type="checkbox"
                                            checked={selectedServiceIds.includes(service.id)}
                                            onChange={() => {}} // Handled by card click
                                        />
                                    </div>
                                    <div className="ms-2">
                                        <div className="fw-bold small">{service.name}</div>
                                        <div className="text-muted" style={{ fontSize: '0.75rem' }}>{service.duration_minutes} min</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    ))
                )}
            </div>
            <div className="mt-3">
                <button 
                    className="btn btn-primary btn-sm" 
                    onClick={handleSave}
                    disabled={isSaving}
                >
                    {isSaving ? (
                        <><span className="spinner-border spinner-border-sm me-1"></span> Saving...</>
                    ) : (
                        <><FontAwesomeIcon icon="save" className="me-1" /> Save Assignments</>
                    )}
                </button>
            </div>
        </div>
    );
};

export default WorkerServicesManager;
