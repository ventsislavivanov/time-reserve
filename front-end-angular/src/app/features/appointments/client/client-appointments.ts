import { Component, inject, OnInit, signal } from '@angular/core';
import { AppointmentsService } from '../appointments.service';
import { Appointment, AppointmentsResponse } from '../appointment.model';

@Component({
  selector: 'client-appointments',
  imports: [],
  templateUrl: './client-appointments.html',
})
export class ClientAppointments implements OnInit {
  private appointmentsService = inject(AppointmentsService) ;

  appointments = signal<Appointment[]>([]);
  isLoading = signal<boolean>(true);
  error = signal<string | null>(null);

  ngOnInit(): void {
    this.isLoading.set(true);
    this.appointmentsService.getClientAppointments().subscribe({
      next: (appointments: AppointmentsResponse): void => {
        this.appointments.set(appointments.data);
      },
      error: (err) => {
        this.error.set(err.message);
      },
      complete: () => {
        this.isLoading.set(false);
      },
    });
  }
}
