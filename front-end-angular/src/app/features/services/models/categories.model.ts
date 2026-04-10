import { Links, Meta } from '../../../core/models';

export interface CategoriesResponse {
  data: Category[];
  links: Links;
  meta: Meta;
}

export interface Category {
  id: number;
  name: string;
  description?: string;
  created_at: string;
  updated_at: string;
}
