export interface UserResponse {
  token: string;
  user: User;
}

export interface User {
  id: number;
  email: string;
  role: 'client' | 'worker' | 'admin';
  status: 'active' | 'inactive';
}
