import { Component, input, output, computed } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { faCalendarAlt, faClock, faCommentAlt } from '@fortawesome/free-solid-svg-icons';
import { Appointment } from '../../appointment.model';
import { AppointmentStatus } from '../../../../shared/components/ui';

@Component({
  selector: 'appointment-card',
  imports: [CommonModule, FontAwesomeModule, AppointmentStatus],
  providers: [DatePipe],
  templateUrl: './appointment-card.html',
})
export class AppointmentCard {
  appointment = input.required<Appointment>();
  cancel = output<Appointment>();
  viewDetails = output<Appointment>();

  faCalendar = faCalendarAlt;
  faClock = faClock;
  faComment = faCommentAlt;

  isPast = computed(() => {
    const a = this.appointment();
    const startTime = a.time?.split(' - ')[0];
    return new Date( )
    <new Date();
  });
  isCancellable = computed(() => {
    const a = this.appointment();
    return !this.isPast() && (a.status === 'pending' || a.status === 'confirmed');
  });
  canViewDetails = computed(() => {
    const s = this.appointment().status;
    return s === 'confirmed' || s === 'completed';
  });
}
