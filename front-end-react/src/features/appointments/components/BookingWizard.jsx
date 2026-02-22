import { useState, useEffect } from 'react';
import { useParams, useNavigate } from "react-router";
import {
	UICard,
	UIButton,
	UIStepper,
	SkeletonTimeSlots,
	SkeletonWizardServiceCard
} from '../../../components/common/ui';
import { useWorkers } from '../../workers';
import { useBooking } from '../hooks/useBooking';
import ServiceSelector from './ServiceSelector';
import DateSelector from './DateSelector';
import TimeSlotsSelector from './TimeSlotsSelector.jsx';

const STEPS = [
	{ id: 1, label: 'Service' },
	{ id: 2, label: 'Date & Time' },
	{ id: 3, label: 'Confirm' }
];

const BookingWizard = () => {
	const { workerId } = useParams();
	const navigate = useNavigate();
	const { workers, isLoading: isLoadingWorker } = useWorkers();
	const worker = workers.find(w => w.id === parseInt(workerId));

	const {
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
	} = useBooking(workerId);

	const [step, setStep] = useState(1);
	const [notes, setNotes] = useState('');

	useEffect(() => {
		if (selectedService && selectedDate) {
			fetchSlots(selectedService.id, selectedDate);
			setSelectedSlot(null);
		}
	}, [selectedService, selectedDate]);

	const handleNext = () => {
		if (step === 1 && !selectedService) return;
		if (step === 2 && (!selectedDate || !selectedSlot)) return;

		setStep(step + 1);
	};

	const handleBack = () => {
		setStep(step - 1);
	};

	const handleConfirm = async () => {
		const success = await bookAppointment(notes);
		if (success) {
			navigate('/my-appointments');
		}
	};

	if (isLoadingWorker) {
		return (
			<div className="container py-5">
				<div className="row justify-content-center">
					<div className="col-lg-10">
						<div className="placeholder-glow text-center mb-4">
							<span className="placeholder col-4"></span>
						</div>
						<UICard>
							<div className="row g-3">
								{[...Array(8)].map((_, i) => (
									<div key={i} className="col-md-6">
										<SkeletonWizardServiceCard />
									</div>
								))}
							</div>
						</UICard>
					</div>
				</div>
			</div>
		);
	}

	if (!worker) {
		return (
			<div className="container py-5">
				<div className="alert alert-danger">Worker not found</div>
			</div>
		);
	}

	return (
		<div className="container py-5">
			<div className="row justify-content-center">
				<div className="col-lg-10">
					<div className="text-center mb-4">
						<h2>Book Appointment with {worker.name}</h2>
						{worker.job_position && (
							<p className="text-muted">{worker.job_position.name}</p>
						)}
					</div>

					<UIStepper steps={STEPS} currentStep={step} />

					<UICard>
						{step === 1 && (
							<>
								<h4 className="mb-4">Select a Service</h4>
								<ServiceSelector
									services={worker.services}
									selectedService={selectedService}
									onSelect={setSelectedService}
								/>
							</>
						)}

						{step === 2 && (
							<>
								<h4 className="mb-4">Select Date &amp; Time</h4>
								<div className="row g-4">
									<div className="col-md-6">
										<DateSelector
											selectedDate={selectedDate}
											onSelect={setSelectedDate}
										/>
									</div>
									<div className="col-md-6">
										{!selectedDate ? (
											<p className="text-muted mt-2">Pick a date to see available times.</p>
										) : isLoadingSlots ? (
											<SkeletonTimeSlots />
										) : (
											<TimeSlotsSelector
												slots={availableSlots}
												selectedSlot={selectedSlot}
												onSelect={setSelectedSlot}
												isLoading={false}
											/>
										)}
									</div>
								</div>
							</>
						)}

						{step === 3 && (
							<>
								<h4 className="mb-4">Confirm Your Appointment</h4>
								<div className="mb-3">
									<strong>Worker:</strong> {worker.name}
								</div>
								<div className="mb-3">
									<strong>Service:</strong> {selectedService?.name} ({selectedService?.duration} min, {selectedService?.price} €)
								</div>
								<div className="mb-3">
									<strong>Date:</strong> {selectedDate}
								</div>
								<div className="mb-3">
									<strong>Time:</strong> {selectedSlot?.time}
								</div>
								<div className="mb-3">
									<label className="form-label">Notes (optional)</label>
									<textarea
										className="form-control"
										rows="3"
										value={notes}
										onChange={(e) => setNotes(e.target.value)}
										placeholder="Any special requests or notes..."
										maxLength={500}
									/>
									<small className="text-muted">{notes.length}/500</small>
								</div>
							</>
						)}

						<div className="d-flex justify-content-between mt-4">
							{step > 1 && (
								<UIButton
									variant="outline-secondary"
									onClick={step === 1 ? () => navigate('/workers') : handleBack}
								>
									Back
								</UIButton>
							)}

							{step < 3 ? (
								<UIButton
									onClick={handleNext}
									disabled={
										(step === 1 && !selectedService) ||
										(step === 2 && (!selectedDate || !selectedSlot))
									}
								>
									Next
								</UIButton>
							) : (
								<UIButton
									onClick={handleConfirm}
									disabled={isBooking}
								>
									{isBooking ? (
										<>
											<span className="spinner-border spinner-border-sm me-2"></span>
											Booking...
										</>
									) : (
										'Confirm Booking'
									)}
								</UIButton>
							)}
						</div>
					</UICard>
				</div>
			</div>
		</div>
	);
};

export default BookingWizard;