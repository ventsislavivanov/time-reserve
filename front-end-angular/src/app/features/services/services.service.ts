import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ServicesResponse } from './service.model';
import { API_URL } from '../../app.config';

@Injectable({ providedIn: 'root' })
export class ServicesService {
  http = inject(HttpClient)

  getActive(): Observable<ServicesResponse> {
    return this.http.get<ServicesResponse>(`${API_URL}/services/active`);
  }
}
