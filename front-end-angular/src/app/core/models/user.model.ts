export interface LoginResponse {
  token: string;
  user: UserLogin;
}

export interface UserLogin {
  id: number;
  email: string;
  role: string;
}

export interface User{
  id: number,
  email: string,
  role: string,
  name: string,
  email_verified_at: string,
  created_at: string,
  updated_at: string,
  phone: string,
  gender: string,
  birth_date: string,
  is_approved: boolean,
  is_active: boolean,
  job_position_id?: number,
  can_book_appointments: boolean,
  no_show_count: number,
  no_show_total_count: number,
  cancelled_count: number,
  completed_count: number
}
