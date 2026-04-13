import { Component, inject, OnInit, signal, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToastrService } from 'ngx-toastr';

import { AppointmentsService } from '../appointments.service';
import { Appointment, AppointmentsResponse } from '../appointment.model';
import { AppointmentStatus, Loading } from '../../../shared/components/ui';

@Component({
  selector: 'pending',
  standalone: true,
  imports: [CommonModule, AppointmentStatus, Loading],
  templateUrl: './pending.html',
})
export class Pending implements OnInit {
  private appointmentsService = inject(AppointmentsService);
  private toastr = inject(ToastrService);

  appointments = signal<Appointment[]>([]);
  isLoading = signal<boolean>(true);
  isUpdating = signal<number | null>(null);

  pendingAppointments = computed(() =>
    this.appointments().filter(a => a.status === 'pending')
  );

  ngOnInit(): void {
    this.loadPendingRequests();
  }

  loadPendingRequests() {
    this.isLoading.set(true);
    this.appointmentsService.getStaffAppointments().subscribe({
      next: (res: AppointmentsResponse) => {
        this.appointments.set(res.data);
      },
      error: () => this.toastr.error('Failed to load pending requests'),
      complete: () => this.isLoading.set(false)
    });
  }

  onConfirm(id: number) {
    if (!confirm('Are you sure you want to confirm this appointment?')) return;

    this.isUpdating.set(id);
    this.appointmentsService.confirmAppointment(id).subscribe({
      next: () => {
        this.toastr.success('Appointment confirmed');
        this.appointments.update(prev => prev.filter(a => a.id !== id));
      },
      error: () => this.toastr.error('Failed to confirm appointment'),
      complete: () => this.isUpdating.set(null)
    });
  }

  onDecline(id: number) {
    const reason = prompt('Please enter a reason for declining (optional):');
    if (reason === null) return;

    this.isUpdating.set(id);
    this.appointmentsService.declineAppointment(id, reason).subscribe({
      next: () => {
        this.toastr.success('Appointment declined');
        this.appointments.update(prev => prev.filter(a => a.id !== id));
      },
      error: () => this.toastr.error('Failed to decline appointment'),
      complete: () => this.isUpdating.set(null)
    });
  }
}
