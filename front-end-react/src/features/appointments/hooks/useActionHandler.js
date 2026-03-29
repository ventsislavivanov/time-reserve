import { useState } from "react";
import { notify } from "../../../services/index.js";

export const useActionHandler = () => {
    const [isUpdating, setIsUpdating] = useState(false);
    const [activeActionId, setActiveActionId] = useState(null);
    const [activeActionType, setActiveActionType] = useState(null);

    const handleAction = async ({
        id,
        type,
        requestFn,
        optimisticUpdate,
        successMessage,
        refetchFn
    }) => {
        try {
            setIsUpdating(true);
            setActiveActionId(id);
            setActiveActionType(type);

            const response = await requestFn(id);

            if (optimisticUpdate) {
                optimisticUpdate(response?.data);
            }

            notify.success(successMessage);

            if (refetchFn) {
                refetchFn(true); // silent refresh
            }

        } catch (error) {
            notify.error(`Failed to ${type} appointment`);
        } finally {
            setIsUpdating(false);
            setActiveActionId(null);
            setActiveActionType(null);
        }
    };

    return {
        isUpdating,
        activeActionId,
        activeActionType,
        handleAction
    };
};
