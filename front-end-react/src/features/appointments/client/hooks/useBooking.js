import { useState } from 'react';
import * as appointmentService from '../../services/appointmentService.js';
import { notify } from "../../../../services/index.js";

export const useBooking = (workerId) => {
	const [selectedService, setSelectedService] = useState(null);
	const [selectedDate, setSelectedDate] = useState(null);
	const [selectedSlot, setSelectedSlot] = useState(null);
	const [availableSlots, setAvailableSlots] = useState([]);
	const [isLoadingSlots, setIsLoadingSlots] = useState(false);
	const [isBooking, setIsBooking] = useState(false);

	const fetchSlots = async (serviceId, date) => {
		if (!serviceId || !date) return;

		try {
			setIsLoadingSlots(true);
			const response = await appointmentService.getAvailableSlots(
				workerId,
				serviceId,
				date
			);
			const { data } = response;

			setAvailableSlots(data.slots);
		} catch (error) {
			notify.error('Failed to load available slots', 'error');
			setAvailableSlots([]);
		} finally {
			setIsLoadingSlots(false);
		}
	};

	const bookAppointment = async (notes = '') => {
		if (!selectedService || !selectedSlot) {
			notify.error('Please complete all steps', 'error');
			return false;
		}

		try {
			setIsBooking(true);
			await appointmentService.createAppointment({
				worker_id: workerId,
				service_id: selectedService.id,
				starts_at: selectedSlot.start,
				notes
			});
			notify.success('Appointment booked successfully!', 'success');
			return true;
		} catch (error) {
			const message = error.response?.data?.message || 'Failed to book appointment';
			notify.error(message, 'error');
			return false;
		} finally {
			setIsBooking(false);
		}
	};

	const resetBooking = () => {
		setSelectedService(null);
		setSelectedDate(null);
		setSelectedSlot(null);
		setAvailableSlots([]);
	};

	return {
		selectedService,
		setSelectedService,
		selectedDate,
		setSelectedDate,
		selectedSlot,
		setSelectedSlot,
		availableSlots,
		isLoadingSlots,
		isBooking,
		fetchSlots,
		bookAppointment,
		resetBooking
	};
};