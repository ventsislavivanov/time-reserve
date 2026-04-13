import { Component, inject, OnInit, signal } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Worker } from '../workers/worker.model';
import { WorkersService } from '../workers/workers.service';

@Component({
  selector: 'booking-wizard',
  imports: [],
  templateUrl: './booking-wizard.html',
})
export class BookingWizard implements OnInit {
  private route = inject(ActivatedRoute);
  private workersService = inject(WorkersService);

  worker = signal<Worker | null>(null);
  isLoading = signal<boolean>(true);
  error = signal<string | null>(null);

  ngOnInit() {
    const id = Number(this.route.snapshot.paramMap.get('workerId'));

    if (id !== null) {
      this.workersService.getWorker(id).subscribe({
        next: (response: any) => this.worker.set(response.data),
        error: (err) => this.error.set(err.message),
        complete: () => this.isLoading.set(false)
      });
    }
  }
}
