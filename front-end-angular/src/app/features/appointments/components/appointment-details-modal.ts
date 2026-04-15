import { Component, input, output, inject, signal, effect } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { faCalendar } from '@fortawesome/free-solid-svg-icons';

import { AppointmentTimeline } from './appointment-timeline';
import { AppointmentsService } from '../appointments.service';
import { Appointment } from '../appointment.model';
import { Loading } from '../../../shared/components/ui';

@Component({
  selector: 'appointment-details-modal',
  standalone: true,
  imports: [CommonModule, Loading, AppointmentTimeline, FontAwesomeModule],
  templateUrl: './appointment-details-modal.html',
})
export class AppointmentDetailsModal {
  private appointmentsService = inject(AppointmentsService);

  appointment = input.required<Appointment | null>();
  close = output<void>();

  timeline = signal<any[]>([]);
  isLoading = signal<boolean>(false);
  faCalendar = faCalendar;

  constructor() {
    effect(() => {
      const app = this.appointment();
      if (app) {
        this.loadTimeline(app.id);
      } else {
        this.timeline.set([]);
      }
    });
  }

  loadTimeline(id: number) {
    this.isLoading.set(true);
    this.appointmentsService.getAppointmentHistory(id).subscribe({
      next: (res: any) => {
        const data = res.data || res;
        const normalized = Array.isArray(data)
          ? data.map((e: any) => ({ ...e, status: e.new_status }))
          : [];
        this.timeline.set(normalized);
      },
      error: () => this.timeline.set([]),
      complete: () => this.isLoading.set(false)
    });
  }

  onClose() {
    this.close.emit();
  }
}
