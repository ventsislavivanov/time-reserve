import { Component, inject, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

import { WorkersService } from './services/workers.service';
import { WorkerCard } from './components/worker-card/worker-card';
import { Worker, WorkersResponse } from './models/worker';

@Component({
  selector: 'workers-list',
  imports: [CommonModule, WorkerCard],
  templateUrl: './workers-list.html',
})
export class WorkersList implements OnInit {
  private workersService = inject(WorkersService);

  workers = signal<Worker[]>([]);
  isLoading = signal<boolean>(true);
  error = signal<string | null>(null);
  ngOnInit() {
    this.isLoading.set(true);

    this.workersService.getWorkers().subscribe({
      next: (response: WorkersResponse) => {
        this.workers.set(response.data);
      },
      error: (err) => {
        this.error.set(err.message);
      },
      complete: () => {
        this.isLoading.set(false);
      },
    });
  }
}
