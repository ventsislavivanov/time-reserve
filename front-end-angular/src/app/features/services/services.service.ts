import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { apiUrl } from '../../shared/constants';
import { ServicesResponse } from './service.model';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class ServicesService {
  http = inject(HttpClient)
  getActive(): Observable<ServicesResponse> {
    return this.http.get<ServicesResponse>(`${apiUrl}/services/active`);
  }
}
