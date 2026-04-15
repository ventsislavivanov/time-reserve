import { Component, input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AppointmentStatus } from '../../../shared/components/ui';

@Component({
  selector: 'appointment-timeline',
  imports: [CommonModule, AppointmentStatus],
  templateUrl: './appointment-timeline.html',
})
export class AppointmentTimeline {
  timeline = input.required<any[]>();
}
