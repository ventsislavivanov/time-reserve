import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { apiUrl } from '../../shared/constants';
import { WorkersResponse } from './worker.model';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class WorkersService {
  http = inject(HttpClient)
  getWorkers(): Observable<WorkersResponse> {
    return this.http.get<WorkersResponse>(`${apiUrl}/workers`);
  }

  getWorker(id: number): Observable<WorkersResponse> {
    return this.http.get<WorkersResponse>(`${apiUrl}/workers/${id}`);
  }
}
