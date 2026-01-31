import { useCallback } from 'react';
import { Modal } from 'bootstrap';

export const useBootstrapModal = () => {
	const showModal = useCallback((modalId) => {
		const el = document.getElementById(modalId);
		el && new Modal(el).show();
	}, []);

	const hideModal = useCallback((modalId) => {
		const el = document.getElementById(modalId);
		if (el) {
			const modalInstance = Modal.getInstance(el);
			if (modalInstance) {
				modalInstance.hide();
			} else {
				const modal = new Modal(el);
				modal.hide();
			}
		}
	}, []);

	const toggleModal = useCallback((modalId) => {
		const el = document.getElementById(modalId);
		if (el) {
			const modalInstance = Modal.getInstance(el);
			if (modalInstance) {
				modalInstance.toggle();
			} else {
				const modal = new Modal(el);
				modal.toggle();
			}
		}
	}, []);

	return { showModal, hideModal, toggleModal };
};