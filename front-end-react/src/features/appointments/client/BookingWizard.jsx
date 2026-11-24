import { useState, useEffect } from 'react';
import { useParams, useNavigate } from "react-router";
import {
	UICard,
	UILoadingButton,
	UIButton,
	UIStepper,
	SkeletonTimeSlots,
	SkeletonWizardServiceCard
} from '../../../components/common/ui/index.js';
import { Skeleton } from '@/components/ui/skeleton';
import { Textarea } from '@/components/ui/textarea';
import { Label } from '@/components/ui/label';
import { useWorkers } from '../../workers/index.js';
import { useBooking } from './hooks/useBooking.js';
import ServiceSelector from './components/ServiceSelector.jsx';
import DateSelector from './components/DateSelector.jsx';
import TimeSlotsSelector from './components/TimeSlotsSelector.jsx';

const STEPS = [
	{ id: 1, label: 'Service' },
	{ id: 2, label: 'Date & Time' },
	{ id: 3, label: 'Confirm' }
];

const SummaryRow = ({ label, children }) => (
	<div className="flex justify-between gap-4 border-b py-3 last:border-0">
		<span className="text-muted-foreground">{label}</span>
		<span className="text-right font-medium">{children}</span>
	</div>
);

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
			<div className="mx-auto w-full max-w-4xl px-4 py-12">
				<div className="mb-8 flex flex-col items-center gap-2">
					<Skeleton className="h-8 w-72" />
					<Skeleton className="h-4 w-40" />
				</div>
				<UICard>
					<div className="grid gap-4 md:grid-cols-2">
						{[...Array(8)].map((_, i) => (
							<SkeletonWizardServiceCard key={i} />
						))}
					</div>
				</UICard>
			</div>
		);
	}

	if (!worker) {
		return (
			<div className="mx-auto w-full max-w-4xl px-4 py-12">
				<div className="rounded-lg border border-destructive/30 bg-destructive/10 px-4 py-3 text-sm text-destructive">Worker not found</div>
			</div>
		);
	}

	return (
		<div className="mx-auto w-full max-w-4xl px-4 py-12">
			<div className="mb-8 text-center">
				<h1>Book an appointment with {worker.name}</h1>
				{worker.job_position && (
					<p className="mt-1 text-muted-foreground">{worker.job_position.name}</p>
				)}
			</div>

			<UIStepper steps={STEPS} currentStep={step} />

			<UICard>
				{step === 1 && (
					<>
						<h3 className="mb-5">Select a service</h3>
						<ServiceSelector
							services={worker.services}
							selectedService={selectedService}
							onSelect={setSelectedService}
						/>
					</>
				)}

				{step === 2 && (
					<>
						<h3 className="mb-5">Select date &amp; time</h3>
						<div className="grid gap-8 md:grid-cols-2">
							<DateSelector
								selectedDate={selectedDate}
								onSelect={setSelectedDate}
							/>
							<div>
								{!selectedDate ? (
									<p className="mt-2 text-muted-foreground">Pick a date to see available times.</p>
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
						<h3 className="mb-5">Confirm your appointment</h3>
						<div className="mb-6 rounded-lg border px-4">
							<SummaryRow label="Specialist">{worker.name}</SummaryRow>
							<SummaryRow label="Service">
								{selectedService?.name} ({selectedService?.duration} min, {selectedService?.price} €)
							</SummaryRow>
							<SummaryRow label="Date">{selectedDate}</SummaryRow>
							<SummaryRow label="Time">{selectedSlot?.time}</SummaryRow>
						</div>

						<div className="space-y-1.5">
							<Label htmlFor="booking-notes">Notes (optional)</Label>
							<Textarea
								id="booking-notes"
								rows={3}
								value={notes}
								onChange={(e) => setNotes(e.target.value)}
								placeholder="Any special requests or notes..."
								maxLength={500}
							/>
							<p className="text-right text-xs text-muted-foreground">{notes.length}/500</p>
						</div>
					</>
				)}

				<div className="mt-8 flex justify-between">
					{step > 1 ? (
						<UIButton variant="outline-secondary" onClick={handleBack}>
							Back
						</UIButton>
					) : <span />}

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
						<UILoadingButton
							onClick={handleConfirm}
							loading={isBooking}
							loadingLabel="Booking..."
						>
							Confirm booking
						</UILoadingButton>
					)}
				</div>
			</UICard>
		</div>
	);
};

export default BookingWizard;
