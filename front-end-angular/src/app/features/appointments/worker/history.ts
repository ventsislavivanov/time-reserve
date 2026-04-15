import { Component, inject, OnInit, signal, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { faEye } from '@fortawesome/free-solid-svg-icons';
import { FaIconComponent } from '@fortawesome/angular-fontawesome';

import { AppointmentDetailsModal } from '../components/appointment-details-modal';
import { AppointmentsService } from '../appointments.service';
import { Appointment, AppointmentsResponse } from '../appointment.model';
import { AppointmentStatus, Loading } from '../../../shared/components/ui';

@Component({
  selector: 'history',
  imports: [
    CommonModule,
    Loading,
    AppointmentStatus,
    FaIconComponent,
    FormsModule,
    AppointmentDetailsModal
  ],
  templateUrl: './history.html',
})
export class History implements OnInit {
  private appointmentsService = inject(AppointmentsService);

  faEye = faEye;
  historyStatuses = ['completed', 'cancelled', 'declined', 'no_show', 'expired', 'timed_out'];

  allAppointments = signal<Appointment[]>([]);
  isLoading = signal<boolean>(true);
  selectedAppointment = signal<Appointment | null>(null);

  filterStatus = signal<string>('');
  filterDateFrom = signal<string>('');
  filterDateTo = signal<string>('');
  filterSearch = signal<string>('');

  filteredAppointments = computed(() => {
    let items = this.allAppointments().filter(a => this.historyStatuses.includes(a.status));

    if (this.filterStatus()) {
      items = items.filter(a => a.status === this.filterStatus());
    }

    if (this.filterDateFrom()) {
      items = items.filter(a => new Date(a.date) >= new Date(this.filterDateFrom()));
    }

    if (this.filterDateTo()) {
      items = items.filter(a => new Date(a.date) <= new Date(this.filterDateTo()));
    }

    if (this.filterSearch()) {
      const search = this.filterSearch().toLowerCase();
      items = items.filter(a => a.client.name.toLowerCase().includes(search));
    }

    return items;
  });

  ngOnInit() {
    this.loadHistory();
  }

  loadHistory() {
    this.isLoading.set(true);
    this.appointmentsService.getStaffAppointments().subscribe({
      next: (res: AppointmentsResponse) => {
        this.allAppointments.set(res.data);
        this.isLoading.set(false)
      }
    });
  }

  onViewDetails(appointment: Appointment) {
    this.selectedAppointment.set(appointment);
  }

  resetFilters() {
    this.filterStatus.set('');
    this.filterDateFrom.set('');
    this.filterDateTo.set('');
    this.filterSearch.set('');
  }
}
