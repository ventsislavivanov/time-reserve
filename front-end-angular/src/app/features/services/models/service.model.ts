import { Links, Meta } from '../../../core/models';

export interface ServicesResponse {
  data: Service[]
  links: Links,
  meta: Meta,
}

export interface Service {
  id: number;
  name: string;
  description: string;
  category_id: number;
  duration: number;
  price: number;
  is_active: boolean;
  preparation_time: number;
  cleanup_time: number;
  created_at: string;
  updated_at: string;
}


