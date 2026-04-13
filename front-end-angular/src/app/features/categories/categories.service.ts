import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import { CategoriesResponse, Category } from './categories.model';
import { apiUrl } from '../../shared/constants';

@Injectable({ providedIn: 'root' })
export class CategoriesService {
  http = inject(HttpClient)
  getAll(): Observable<CategoriesResponse> {
    return this.http.get<CategoriesResponse>(`${apiUrl}/categories`);
  }

  getById(id:number) {
    return this.http.get(`${apiUrl}/staff/categories/${id}`)
  }

  create(data: Category) {
    return this.http.post(`${apiUrl}/staff/categories`, data)
  }

  update(id: number, data: Category) {
    return this.http.put(`${apiUrl}/staff/categories/${id}`, data)
  }

  remove(id: number) {
    return this.http.delete(`${apiUrl}/staff/categories/${id}`)
  }
}
