import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterModule } from '@angular/router';
import { Worker } from '../../models/worker.model';

@Component({
  selector: 'worker-card',
  imports: [CommonModule, RouterModule],
  templateUrl: './worker-card.html',
})

export class WorkerCard {
  @Input() worker!: Worker;

  constructor(private router: Router) {}

  handleBooking() {
    this.router.navigate(['/our-team/book', this.worker.id]);
  }
}
