import { useEffect, useState } from "react";
import { getUsers } from "../../../users/services/userService.js";

// Options of the "Worker" and "Updated by" dropdowns of the admin appointments filters.
export const useAdminFilterOptions = () => {
    const [workers, setWorkers] = useState([]);
    const [admins, setAdmins] = useState([]);

    useEffect(() => {
        let cancelled = false;

        const load = async () => {
            try {
                const [workersResponse, adminsResponse] = await Promise.all([
                    getUsers({ role: "worker", limit: 100 }),
                    getUsers({ role: "admin", limit: 100 })
                ]);

                if (cancelled) return;

                setWorkers(workersResponse.data ?? []);
                setAdmins(adminsResponse.data ?? []);
            } catch {
                // The dropdowns simply stay empty, the list itself still works.
            }
        };

        load();

        return () => {
            cancelled = true;
        };
    }, []);

    return {
        workers,
        // Changes made by the system (expired, timed out) have no user, the API filters them as "system".
        updatedByList: [{ id: "system", name: "System" }, ...admins, ...workers]
    };
};
