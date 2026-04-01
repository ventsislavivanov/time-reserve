import { useState } from "react";
import { useBootstrapModal } from "../../../hooks";

export const useAppointmentModals = ({
                                         cancel,
                                         decline,
                                         confirm,
                                         start,
                                         complete,
                                         noShow
                                     }) => {
    const { showModal, hideModal } = useBootstrapModal();

    const [modalType, setModalType] = useState(null);
    const [modalTarget, setModalTarget] = useState(null);

    const modalIds = {
        cancel:   "cancelAppointmentModal",
        decline:  "declineAppointmentModal",
        confirm:  "confirmAppointmentModal",
        start:    "startAppointmentModal",
        complete: "completeAppointmentModal",
        no_show:  "noShowAppointmentModal",
    };

    const openModal = (type, appointment) => {
        setModalType(type);
        setModalTarget(appointment);

        setTimeout(() => showModal(modalIds[type]), 10);
    };

    const closeModal = () => {
        if (!modalType) return;

        hideModal(modalIds[modalType]);
        setModalType(null);
        setModalTarget(null);
    };

    const confirmModal = async (payload) => {
        if (!modalTarget) return;

        if (modalType === "cancel" && cancel) {
            await cancel(modalTarget.id, payload);
        }

        if (modalType === "decline" && decline) {
            await decline(modalTarget.id, payload);
        }

        if (modalType === "confirm" && confirm) {
            await confirm(modalTarget.id);
        }

        if (modalType === "start" && start) {
            await start(modalTarget.id);
        }

        if (modalType === "complete" && complete) {
            await complete(modalTarget.id);
        }

        if (modalType === "no_show" && noShow) {
            await noShow(modalTarget.id);
        }

        closeModal();
    };

    return {
        modalType,
        modalTarget,
        openModal,
        closeModal,
        confirmModal
    };
};
