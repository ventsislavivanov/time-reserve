export interface AuthResponse {
  token: string;
  user: AuthUser;
}

export interface AuthUser {
  id: number;
  email: string;
  role: string;
}
