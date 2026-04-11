import {inject, Injectable, signal} from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { apiUrl } from '../../shared/constants';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AuthService {
  http = inject(HttpClient);

  login(data: object): Observable<any> {
    return this.http.post<any>(`${apiUrl}/login`, data, { withCredentials: false });
  }

  logout(): Observable<any> {
    return this.http.post(`${apiUrl}/logout`, {}, { withCredentials: true });
  }

  getMe(): Observable<any> {
    return this.http.get<any>(`${apiUrl}/me`);
  }

  register(data: object): Observable<any> {
    return this.http.post<any>(`${apiUrl}/register`, data, { withCredentials: false });
  }
}
