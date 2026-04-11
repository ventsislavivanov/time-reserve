import { Links, Meta } from '../../core/models';

export interface AppointmentsResponse {
  data: Appointment[],
  links: Links,
  meta: Meta,
}

export interface Appointment {
  id: number;
  date: string,
  time: string,
  status: string,
  notes?: string,
  reason?: string,
  service: {
    id: number,
    name: string,
    duration: number,
    price: number
  },
  "worker": {
    id: number,
    name: string
  },
  "client": {
    id: number,
    name: string
  },
  created_at?: null,
  updated_at?: null
}
