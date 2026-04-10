import {inject, Injectable} from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { apiUrl } from '../../../shared/constants/api';
import {WorkersResponse} from '../models/worker';

@Injectable({ providedIn: 'root' })
export class WorkersService {
  http = inject(HttpClient)
  getWorkers() {
    return this.http.get<WorkersResponse>(`${apiUrl}/workers`);
  }
}
