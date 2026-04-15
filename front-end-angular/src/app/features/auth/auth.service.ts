import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { API_URL } from '../../app.config';

@Injectable({ providedIn: 'root' })
export class AuthService {
  http = inject(HttpClient);

  login(data: object): Observable<any> {
    return this.http.post<any>(`${API_URL}/login`, data, { withCredentials: false });
  }

  logout(): Observable<any> {
    return this.http.post(`${API_URL}/logout`, {});
  }

  getMe(): Observable<any> {
    return this.http.get<any>(`${API_URL}/me`);
  }

  register(data: object): Observable<any> {
    return this.http.post<any>(`${API_URL}/register`, data, { withCredentials: false });
  }
}
