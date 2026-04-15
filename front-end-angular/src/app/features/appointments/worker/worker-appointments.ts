import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { AppointmentsService } from '../appointments.service';
import { ToastrService } from 'ngx-toastr';
import { Appointment, AppointmentsResponse } from '../appointment.model';
import {AppointmentStatus, Loading} from '../../../shared/components/ui';

@Component({
  selector: 'worker',
  imports: [
    AppointmentStatus,
    Loading
  ],
  templateUrl: './worker-appointments.html'
})
export class WorkerAppointments implements OnInit {
  private appointmentsService = inject(AppointmentsService);
  private toastr = inject(ToastrService);

  appointments = signal<Appointment[]>([]);
  isLoading = signal<boolean>(true);
  isUpdating = signal<number | null>(null);

  confirmedAppointments = computed(() =>
    this.appointments().filter(a => a.status === 'confirmed' || a.status === 'in_progress')
  );

  ngOnInit(): void {
    this.loadAppointments();
  }

  loadAppointments() {
    this.isLoading.set(true);
    this.appointmentsService.getStaffAppointments().subscribe({
      next: (res: AppointmentsResponse) => {
        this.appointments.set(res.data);
      },
      error: () => this.toastr.error('Failed to load pending requests'),
      complete: () => this.isLoading.set(false)
    });
  }

  onDecline(id: number) {
    const reason = prompt('Please enter a reason for declining:');
    if (reason === null) return;

    this.isUpdating.set(id);
    this.appointmentsService.declineAppointment(id, reason).subscribe({
      next: () => {
        this.toastr.success('Appointment declined');
        this.appointments.update(prev => prev.filter(a => a.id !== id));
        this.isUpdating.set(null)
      }
    });
  }

  onStart(id: number) {
    if (!confirm('Are you sure you want to start this appointment?')) return;

    this.isUpdating.set(id);
    this.appointmentsService.startAppointment(id).subscribe({
      next: () => {
        this.toastr.success('Appointment started');
        this.appointments.update(prev => prev.filter(a => a.id !== id));
        this.isUpdating.set(null)
      }
    });
  }

  onComplete(id: number) {
    if (!confirm('Are you sure you want to complete this appointment?')) return;

    this.isUpdating.set(id);
    this.appointmentsService.completeAppointment(id).subscribe({
      next: () => {
        this.toastr.success('Appointment completed');
        this.appointments.update(prev => prev.filter(a => a.id !== id));
        this.isUpdating.set(null)
      }
    });
  }

  onNoShow(id: number) {
    if (!confirm('Are you sure you want to mark no-show?')) return;

    this.isUpdating.set(id);
    this.appointmentsService.noShowAppointment(id).subscribe({
      next: () => {
        this.toastr.success('Marked as no-show');
        this.appointments.update(prev => prev.filter(a => a.id !== id));
        this.isUpdating.set(null)
      }
    });
  }

  canShowNoShow(app: Appointment): boolean {
    if (app.status !== 'confirmed') return false;

    const now = new Date();
    const [year, month, day] = app.date.split('-').map(Number);
    const [hours, minutes] = app.time.split(':').map(Number);

    const startDate = new Date(year, month - 1, day, hours, minutes);
    const endDate = new Date(startDate.getTime() + (app.service.duration || 0) * 60000);
    const twoHoursAfterEnd = new Date(endDate.getTime() + 2 * 60 * 60 * 1000);

    return now >= twoHoursAfterEnd;
  }

  }
