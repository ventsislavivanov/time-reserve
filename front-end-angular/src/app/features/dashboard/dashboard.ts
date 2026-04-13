import { Component, inject, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthStore } from '../auth/auth.store';

import { AdminDashboard } from './admin-dashboard';
import { WorkerDashboard } from './worker-dashboard';

@Component({
  selector: 'dashboard-proxy',
  standalone: true,
  imports: [CommonModule, AdminDashboard, WorkerDashboard],
  template: `
    @if (role() === 'admin') {
      <admin-dashboard />
    } @else {
      <worker-dashboard />
    }
  `
})
export class Dashboard {
  private auth = inject(AuthStore);

  role = computed(() => this.auth.user()?.role);
}
