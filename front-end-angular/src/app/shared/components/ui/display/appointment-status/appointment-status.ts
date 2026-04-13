import { Component, input, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { IconProp } from '@fortawesome/fontawesome-svg-core';
import {
  faClock,
  faTimesCircle,
  faCheckCircle,
  faHourglassHalf,
  faHourglass,
  faCircle
} from '@fortawesome/free-solid-svg-icons';

interface AppointmentStatusConfig {
  bg: string;
  text: string;
  icon: IconProp;
  label: string;
}

const STATUS_CONFIG: Record<string, AppointmentStatusConfig> = {
  pending:      { bg: 'bg-warning-subtle',    text: 'text-warning',   icon: faClock as IconProp,          label: 'Pending' },
  cancelled:    { bg: 'bg-danger-subtle',     text: 'text-danger',    icon: faTimesCircle as IconProp,    label: 'Cancelled' },
  declined:     { bg: 'bg-danger-subtle',     text: 'text-danger',    icon: faTimesCircle as IconProp,    label: 'Declined' },
  confirmed:    { bg: 'bg-primary-subtle',    text: 'text-primary',   icon: faCheckCircle as IconProp,    label: 'Confirmed' },
  in_progress:  { bg: 'bg-danger-subtle',     text: 'text-warning',   icon: faHourglassHalf as IconProp,  label: 'In progress' },
  completed:    { bg: 'bg-success-subtle',    text: 'text-success',   icon: faCheckCircle as IconProp,    label: 'Completed' },
  no_show:      { bg: 'bg-secondary-subtle',  text: 'text-secondary', icon: faTimesCircle as IconProp,    label: 'No Show' },
  expired:      { bg: 'bg-secondary-subtle',  text: 'text-secondary', icon: faHourglass as IconProp,      label: 'Expired' },
  timed_out:    { bg: 'bg-secondary-subtle',  text: 'text-secondary', icon: faHourglass as IconProp,      label: 'Timed out' },
};

@Component({
  selector: 'appointment-status',
  standalone: true,
  imports: [CommonModule, FontAwesomeModule],
  templateUrl: './appointment-status.html',
})
export class AppointmentStatus {
  status = input.required<string>();
  config = computed(() => {
    const s = this.status();
    return STATUS_CONFIG[s] ?? {
      bg: 'bg-secondary-subtle',
      text: 'text-secondary',
      icon: faCircle as IconProp,
      label: s,
    };
  });
}
