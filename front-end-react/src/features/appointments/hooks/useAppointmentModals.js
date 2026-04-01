import { useState } from "react";
import { useBootstrapModal } from "../../../hooks";

export const useAppointmentModals = ({ confirm, decline, noShow }) => {
    const { showModal, hideModal } = useBootstrapModal();

    const [modalType, setModalType] = useState(null);
    const [modalTarget, setModalTarget] = useState(null);

    const openModal = (type, appointment) => {
        setModalType(type);
        setModalTarget(appointment);

        const modalId = {
            cancel:  "cancelAppointmentModal",
            decline: "declineAppointmentModal",
            confirm: "confirmAppointmentModal",
            no_show: "noShowAppointmentModal"
        }[type];

        setTimeout(() => showModal(modalId), 10);
    };

    const closeModal = () => {
        if (!modalType) return;

        const modalId = {
            confirm: "confirmAppointmentModal",
            decline: "declineAppointmentModal",
            no_show: "noShowAppointmentModal"
        }[modalType];

        hideModal(modalId);
        setModalType(null);
        setModalTarget(null);
    };

    const confirmModal = async (payload) => {
        if (!modalType || !modalTarget) return;

        if (modalType === "confirm") {
            await confirm(modalTarget.id);
        }

        if (modalType === "decline") {
            await decline(modalTarget.id, payload); // payload = reason
        }

        if (modalType === "no_show") {
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
