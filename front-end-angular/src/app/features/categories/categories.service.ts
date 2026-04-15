import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import { CategoriesResponse, Category } from './categories.model';
import { API_URL } from '../../app.config';

@Injectable({ providedIn: 'root' })
export class CategoriesService {
  http = inject(HttpClient)
  getAll(): Observable<CategoriesResponse> {
    return this.http.get<CategoriesResponse>(`${API_URL}/categories`);
  }

  getById(id:number) {
    return this.http.get(`${API_URL}/staff/categories/${id}`)
  }

  create(data: Category) {
    return this.http.post(`${API_URL}/staff/categories`, data)
  }

  update(id: number, data: Category) {
    return this.http.put(`${API_URL}/staff/categories/${id}`, data)
  }

  remove(id: number) {
    return this.http.delete(`${API_URL}/staff/categories/${id}`)
  }
}
