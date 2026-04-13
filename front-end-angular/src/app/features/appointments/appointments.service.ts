import { inject, Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { apiUrl } from '../../shared/constants';
import { AppointmentsResponse } from './appointment.model';


@Injectable({ providedIn: 'root' })
export class AppointmentsService {
  http = inject(HttpClient)

  getClientAppointments(perPage: number = 100): Observable<AppointmentsResponse> {
    const params = new HttpParams().set('per_page', perPage.toString());
    return this.http.get<AppointmentsResponse>(`${apiUrl}/appointments`, { params });
  }

  getAvailableSlots(workerId: number, serviceId: number, date: string): Observable<any> {
    const params = new HttpParams()
      .set('worker_id', workerId.toString())
      .set('service_id', serviceId.toString())
      .set('date', date);

    return this.http.get<any>(`${apiUrl}/availability/slots`, { params });
  }

  createAppointment(data: any): Observable<any> {
    return this.http.post<any>(`${apiUrl}/appointments`, data);
  }

  cancelAppointment(id: number, reason: string | null = null): Observable<any> {
    return this.http.patch<any>(`${apiUrl}/appointments/${id}/cancel`, { reason });
  }

  getAppointmentHistory(id: number): Observable<any> {
    return this.http.get<any>(`${apiUrl}/appointments/${id}/history`);
  }

  appointmentStatuses(id: number): Observable<any> {
    return this.http.get<any>(`${apiUrl}/appointments/${id}/appointment-statuses`);
  }

  getStaffAppointments(): Observable<AppointmentsResponse> {
    return this.http.get<AppointmentsResponse>(`${apiUrl}/staff/appointments`,);
  }

  declineAppointment(id: number, reason: string | null = null): Observable<any> {
    return this.http.patch<any>(`${apiUrl}/staff/appointments/${id}/decline`, { reason });
  }

  confirmAppointment(id: number): Observable<any> {
    return this.http.patch<any>(`${apiUrl}/staff/appointments/${id}/confirm`, {});
  }

  startAppointment(id: number): Observable<any> {
    return this.http.patch<any>(`${apiUrl}/staff/appointments/${id}/start`, {});
  }

  completeAppointment(id: number): Observable<any> {
    return this.http.patch<any>(`${apiUrl}/staff/appointments/${id}/complete`, {});
  }

  noShowAppointment(id: number): Observable<any> {
    return this.http.patch<any>(`${apiUrl}/staff/appointments/${id}/no-show`, {});
  }

}
