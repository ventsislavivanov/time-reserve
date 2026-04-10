import { Component, input, output } from '@angular/core';
import { NgClass } from '@angular/common';

@Component({
  selector: 'service-filters',
  imports: [NgClass],
  templateUrl: './service-filters.html',
})
export class ServiceFilters {
  categories = input<any[]>([]);
  selectedCategory = input<string>('all');

  categoryChange = output<string>()

  onSelect(category: string) {
    this.categoryChange.emit(category);
  }
}
