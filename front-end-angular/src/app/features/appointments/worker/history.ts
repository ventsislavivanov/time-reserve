import {Component, inject, OnInit, signal} from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToastrService } from 'ngx-toastr';
import { faEye } from '@fortawesome/free-solid-svg-icons';
import { FaIconComponent } from '@fortawesome/angular-fontawesome';

import { AppointmentStatus, Loading } from "../../../shared/components/ui";
import { AppointmentsService } from '../appointments.service';
import { Appointment, AppointmentsResponse } from '../appointment.model';

@Component({
  selector: 'history',
  imports: [
    CommonModule,
    Loading,
    AppointmentStatus,
    FaIconComponent
  ],
  templateUrl: './history.html',
})
export class History implements OnInit{
  private appointmentsService = inject(AppointmentsService);
  private toastr = inject(ToastrService);

  faEye = faEye;

  appointments  = signal<Appointment[]>([]);
  isLoading = signal<boolean>(true);

   ngOnInit() {
    this.isLoading.set(true);
    this.appointmentsService.getStaffAppointments().subscribe({
      next: (res: AppointmentsResponse) => {
        this.appointments.set(res.data);
      },
      error: () => this.toastr.error('Failed to load history'),
      complete: () => this.isLoading.set(false)
    })
  }

  onViewDetails(id: number) {
    console.log(id)
  }
}
