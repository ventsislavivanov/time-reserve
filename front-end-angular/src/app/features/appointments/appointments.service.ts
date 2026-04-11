import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { apiUrl } from '../../shared/constants';
import { AppointmentsResponse } from './appointment.model';


@Injectable({ providedIn: 'root' })
export class AppointmentsService {
  http = inject(HttpClient)

  getClientAppointments(): Observable<AppointmentsResponse> {
    return this.http.get<AppointmentsResponse>(`${apiUrl}/appointments`);
  }
}
