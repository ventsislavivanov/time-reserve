import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import { WorkersResponse } from './worker.model';
import { API_URL } from '../../app.config';

@Injectable({ providedIn: 'root' })
export class WorkersService {
  http = inject(HttpClient)
  getWorkers(): Observable<WorkersResponse> {
    return this.http.get<WorkersResponse>(`${API_URL}/workers`);
  }

  getWorker(id: number): Observable<WorkersResponse> {
    return this.http.get<WorkersResponse>(`${API_URL}/workers/${id}`);
  }
}
