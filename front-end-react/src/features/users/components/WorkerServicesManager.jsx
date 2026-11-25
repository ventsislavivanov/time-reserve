import { useState, useEffect } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { getAll as getServices } from '../../services';
import { getUserServices, syncUserServices } from '../';
import { Checkbox } from "@/components/ui/checkbox";
import { UILoading, UILoadingButton } from "../../../components/common/ui";
import { notify } from "../../../services";

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
                setAllServices(servicesData.data);
                setSelectedServiceIds(workerServicesData.map(s => s.id));
            } catch (error) {
                notify.error('Failed to load services');
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
            notify.success('Worker services updated successfully');
        } catch (error) {
            notify.error('Failed to save worker services');
        } finally {
            setIsSaving(false);
        }
    };

    if (isLoading) {
        return <UILoading />;
    }

    return (
        <div className="worker-services-manager mt-6">
            <h4 className="mb-4 border-b pb-2 text-base">
                <FontAwesomeIcon icon="concierge-bell" className="mr-2 text-primary" />
                Assigned Services
            </h4>
            <div className="grid grid-cols-12 gap-4">
                {allServices.length === 0 ? (
                    <div className="col-span-12 text-muted-foreground">No active services available.</div>
                ) : (
                    allServices.map(service => (
                        <div key={service.id} className="col-span-12 md:col-span-6 lg:col-span-4">
                            <div className={`h-full cursor-pointer rounded-xl border p-3 transition-colors ${selectedServiceIds.includes(service.id) ? "border-primary bg-primary/5" : "hover:border-primary/40"}`}
                                 onClick={() => handleToggleService(service.id)}>
                                <div className="flex items-center">
                                    <Checkbox checked={selectedServiceIds.includes(service.id)} onCheckedChange={() => handleToggleService(service.id)} onClick={(e) => e.stopPropagation()} />
                                    <div className="ml-2">
                                        <div className="font-bold text-sm">{service.name}</div>
                                        <div className="text-xs text-muted-foreground">{service.duration} min</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    ))
                )}
            </div>
            <div className="mt-4">
                <UILoadingButton size="sm" onClick={handleSave} loading={isSaving} loadingLabel="Saving..." disabled={selectedServiceIds.length === 0}>
                    <FontAwesomeIcon icon="save" className="mr-1" /> Save Assignments
                </UILoadingButton>
            </div>
        </div>
    );
};

export default WorkerServicesManager;
