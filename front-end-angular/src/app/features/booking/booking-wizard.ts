import { Component, inject, OnInit, signal } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Worker } from '../workers/worker.model';
import { WorkersService } from '../workers/workers.service';

@Component({
  selector: 'booking-wizard',
  templateUrl: './booking-wizard.html',
})
export class BookingWizard implements OnInit {
  private route = inject(ActivatedRoute);
  private router = inject(Router);
  private workersService = inject(WorkersService);

  worker = signal<Worker | null>(null);
  isLoading = signal<boolean>(true);

  ngOnInit() {
    const navigation = this.router.lastSuccessfulNavigation();
    const previousUrl = navigation?.previousNavigation?.finalUrl?.toString();

    if (!previousUrl || !previousUrl.includes('/our-team')) {
      this.router.navigate(['/our-team']);
      return;
    }

    const workerIdParam = this.route.snapshot.paramMap.get('workerId');
    if (workerIdParam) {
      const id = Number(workerIdParam);
      this.isLoading.set(true);

      this.workersService.getWorker(id).subscribe({
        next: (response: any) => {
          if (response.data) {
            this.worker.set(response.data);
          } else {
            this.router.navigate(['/our-team']);
          }
        },
        error: () => this.router.navigate(['/our-team']),
        complete: () => this.isLoading.set(false)
      });
    }
  }
}
