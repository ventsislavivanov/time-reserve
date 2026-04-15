import { Component, inject, OnInit, signal, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterModule } from '@angular/router';
import { AppointmentCard } from './appointment-card/appointment-card';
import { AppointmentsService } from '../appointments.service';
import { Appointment, AppointmentsResponse } from '../appointment.model';
import { Loading } from '../../../shared/components/ui';
import {AppointmentDetailsModal} from '../components/appointment-details-modal';

@Component({
  selector: 'client-appointments',
  standalone: true,
  imports: [CommonModule, RouterModule, AppointmentCard, Loading, AppointmentDetailsModal],
  templateUrl: './client-appointments.html',
})
export class ClientAppointments implements OnInit {
  private appointmentsService = inject(AppointmentsService);
  private router = inject(Router);

  appointments = signal<Appointment[]>([]);
  isLoading = signal<boolean>(true);
  activeTab = signal<'upcoming' | 'past'>('upcoming');
  upcoming = computed(() => {
    const now = new Date();
    return this.appointments().filter(a => new Date(a.date) >= now && a.status !== 'cancelled' && a.status !== 'declined');
  });
  past = computed(() => {
    const now = new Date();
    return this.appointments().filter(a => new Date(a.date) < now || a.status === 'cancelled' || a.status === 'declined');
  });
  displayed = computed(() => this.activeTab() === 'upcoming' ? this.upcoming() : this.past());

  selectedAppointment = signal<Appointment | null>(null);

  ngOnInit(): void {
    this.loadAppointments();
  }

  loadAppointments() {
    this.isLoading.set(true);
    this.appointmentsService.getClientAppointments().subscribe({
      next: (res: AppointmentsResponse) => this.appointments.set(res.data),
      error: (error) => console.error(error),
      complete: () => this.isLoading.set(false)
    });
  }

  setActiveTab(tab: 'upcoming' | 'past') {
    this.activeTab.set(tab);
  }

  onCancel(appointment: Appointment) {
    // TODO modalCancel
    console.log('Cancel', appointment);
  }

  onViewDetails(appointment: Appointment) {
    this.selectedAppointment.set(appointment);
  }

  goToTeam() {
    this.router.navigate(['/our-team']);
  }
}
