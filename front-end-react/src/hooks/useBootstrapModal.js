import { useSyncExternalStore } from 'react';

// Tiny id-based modal store. Keeps the imperative showModal(id) / hideModal(id)
// API that the pages already use, now backed by React state instead of Bootstrap JS.
const openModals = new Set();
const listeners = new Set();
let snapshot = '';

const emit = () => {
	snapshot = [...openModals].join('|');
	listeners.forEach((l) => l());
};

const subscribe = (listener) => {
	listeners.add(listener);
	return () => listeners.delete(listener);
};

export const showModal = (id) => {
	if (!openModals.has(id)) {
		openModals.add(id);
		emit();
	}
};

export const hideModal = (id) => {
	if (openModals.delete(id)) emit();
};

export const toggleModal = (id) => (openModals.has(id) ? hideModal(id) : showModal(id));

export const useModalOpen = (id) => {
	const current = useSyncExternalStore(subscribe, () => snapshot);
	return current.split('|').includes(id);
};

// Kept under the old name so existing call sites do not change.
const modalApi = { showModal, hideModal, toggleModal };
export const useBootstrapModal = () => modalApi;
