import { inject, Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AppointmentsResponse } from './appointment.model';
import { API_URL } from '../../app.config';


@Injectable({ providedIn: 'root' })
export class AppointmentsService {
  http = inject(HttpClient)

  getClientAppointments(perPage: number = 100): Observable<AppointmentsResponse> {
    const params = new HttpParams().set('per_page', perPage.toString());
    return this.http.get<AppointmentsResponse>(`${API_URL}/appointments`, { params });
  }

  getAvailableSlots(workerId: number, serviceId: number, date: string): Observable<any> {
    const params = new HttpParams()
      .set('worker_id', workerId.toString())
      .set('service_id', serviceId.toString())
      .set('date', date);

    return this.http.get<any>(`${API_URL}/availability/slots`, { params });
  }

  createAppointment(data: any): Observable<any> {
    return this.http.post<any>(`${API_URL}/appointments`, data);
  }

  cancelAppointment(id: number, reason: string | null = null): Observable<any> {
    return this.http.patch<any>(`${API_URL}/appointments/${id}/cancel`, { reason });
  }

  getAppointmentHistory(id: number): Observable<any> {
    return this.http.get<any>(`${API_URL}/appointments/${id}/history`);
  }

  appointmentStatuses(id: number): Observable<any> {
    return this.http.get<any>(`${API_URL}/appointments/${id}/appointment-statuses`);
  }

  getStaffAppointments(): Observable<AppointmentsResponse> {
    return this.http.get<AppointmentsResponse>(`${API_URL}/staff/appointments`,);
  }

  declineAppointment(id: number, reason: string | null = null): Observable<any> {
    return this.http.patch<any>(`${API_URL}/staff/appointments/${id}/decline`, { reason });
  }

  confirmAppointment(id: number): Observable<any> {
    return this.http.patch<any>(`${API_URL}/staff/appointments/${id}/confirm`, {});
  }

  startAppointment(id: number): Observable<any> {
    return this.http.patch<any>(`${API_URL}/staff/appointments/${id}/start`, {});
  }

  completeAppointment(id: number): Observable<any> {
    return this.http.patch<any>(`${API_URL}/staff/appointments/${id}/complete`, {});
  }

  noShowAppointment(id: number): Observable<any> {
    return this.http.patch<any>(`${API_URL}/staff/appointments/${id}/no-show`, {});
  }

}
