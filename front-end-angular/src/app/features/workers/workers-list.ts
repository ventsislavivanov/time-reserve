import { Component, inject, OnInit, signal } from '@angular/core';

import { WorkersService } from './workers.service';
import { WorkerCard } from './worker-card/worker-card';
import { Worker, WorkersResponse } from './worker.model';
import { Loading } from '../../shared/components/ui';

@Component({
  selector: 'workers-list',
  imports: [WorkerCard, Loading],
  templateUrl: './workers-list.html',
})
export class WorkersList implements OnInit {
  private workersService = inject(WorkersService);

  workers = signal<Worker[]>([]);
  isLoading = signal<boolean>(true);
  error = signal<string | null>(null);
  ngOnInit():void {
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
