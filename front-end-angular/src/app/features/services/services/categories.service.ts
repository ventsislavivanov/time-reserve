import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { apiUrl } from '../../../shared/constants/';
import { CategoriesResponse } from '../models/categories.model';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class CategoriesService {
  http = inject(HttpClient)
  getAllCategories(): Observable<CategoriesResponse> {
    return this.http.get<CategoriesResponse>(`${apiUrl}/categories`);
  }
}
