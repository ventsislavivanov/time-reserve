import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { forkJoin } from 'rxjs';

import { ServiceCard, ServiceFilters } from './components';
import { ServicesService } from './services/services.service';
import { CategoriesService } from './services/categories.service';
import { Service, ServicesResponse } from './models/service.model';
import { Category, CategoriesResponse } from './models/categories.model';

@Component({
  selector: 'services-catalog',
  imports: [ServiceCard, ServiceFilters],
  templateUrl: './services-catalog.html',
})

export class ServicesCatalog implements OnInit {
  private servicesService = inject(ServicesService);
  private categoriesService = inject(CategoriesService);

  services = signal<Service[]>([]);
  categories = signal<Category[]>([]);

  selectedCategory = signal<string>('all')

  filteredServices = computed(() => {
    if (this.selectedCategory() === 'all') {
      return this.services();
    }

    return this.services().filter(service =>
      service.category_id === Number(this.selectedCategory())
    );
  });

  isLoading = signal<boolean>(true);
  error = signal<string | null>(null);

  ngOnInit(): void {
    this.isLoading.set(true);

    forkJoin({
      services: this.servicesService.getActive(),
      categories: this.categoriesService.getAllCategories()
    }).subscribe({
      next: (response: {
        services: ServicesResponse,
        categories: CategoriesResponse
      }) => {
        this.services.set(response.services.data);
        this.categories.set(response.categories.data);
      },
      error: (err) => {
        this.error.set(err.message);
        this.isLoading.set(false);
      },
      complete: () => {
        this.isLoading.set(false);
      }
    });
  }

  onCategoryChange(e: any) {
    this.selectedCategory.set(e);
  }
}
