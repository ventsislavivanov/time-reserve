import { Component, inject, OnInit, signal, effect } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { Worker, WorkersService } from '../workers';
import { AppointmentsService } from '../appointments';
import { Loading } from '../../shared/components/ui';

@Component({
  selector: 'booking-wizard',
  imports: [FormsModule, Loading],
  templateUrl: './booking-wizard.html',
})
export class BookingWizard implements OnInit {
  private route = inject(ActivatedRoute);
  private router = inject(Router);
  private workersService = inject(WorkersService);
  private appointmentsService = inject(AppointmentsService);

  worker = signal<Worker | null>(null);
  isLoading = signal<boolean>(true);

  step = signal<number>(1);
  selectedService = signal<any>(null);
  selectedDate = signal<string | null>(null);
  selectedSlot = signal<any>(null);
  availableSlots = signal<any[]>([]);
  isLoadingSlots = signal<boolean>(false);
  isBooking = signal<boolean>(false);
  notes = signal<string>('');

  constructor() {
    effect(() => {
      const service = this.selectedService();
      const date = this.selectedDate();
      const worker = this.worker();

      if (service && date && worker) {
        this.fetchSlots(worker.id, service.id, date);
      }
    });
  }

  ngOnInit() {
    const navigation = this.router.lastSuccessfulNavigation();
    const previousUrl = navigation?.previousNavigation?.finalUrl?.toString();

    if (!previousUrl || !previousUrl.includes('/our-team')) {
      this.router.navigate(['/our-team']);
      return;
    }

    const workerIdParam = this.route.snapshot.paramMap.get('workerId');
    if (workerIdParam) {
      const id = Number(workerIdParam);
      this.isLoading.set(true);

      this.workersService.getWorker(id).subscribe({
        next: (response: any) => {
          if (response.data) {
            this.worker.set(response.data);
          } else {
            this.router.navigate(['/our-team']);
          }
        },
        error: () => this.router.navigate(['/our-team']),
        complete: () => this.isLoading.set(false)
      });
    }
  }

  fetchSlots(workerId: number, serviceId: number, date: string) {
    this.isLoadingSlots.set(true);
    this.appointmentsService.getAvailableSlots(workerId, serviceId, date).subscribe({
      next: (res) => {
        this.availableSlots.set(res.data.slots || []);
        this.selectedSlot.set(null);
      },
      error: () => this.availableSlots.set([]),
      complete: () => this.isLoadingSlots.set(false)
    });
  }

  nextStep() {
    if (this.step() < 3) this.step.update(s => s + 1);
  }

  prevStep() {
    if (this.step() > 1) this.step.update(s => s - 1);
  }

  handleConfirm() {
    const worker = this.worker();
    const service = this.selectedService();
    const slot = this.selectedSlot();

    if (!worker || !service || !slot) return;

    this.isBooking.set(true);
    const bookingData = {
      worker_id: worker.id,
      service_id: service.id,
      starts_at: slot.start,
      notes: this.notes()
    };

    this.appointmentsService.createAppointment(bookingData).subscribe({
      next: () => {
        this.router.navigate(['/my-appointments']);
      },
      error: (err) => {
        console.error('Booking failed', err);
        this.isBooking.set(false);
      }
    });
  }
}
