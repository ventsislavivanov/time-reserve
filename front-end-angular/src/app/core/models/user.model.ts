export interface User {
  id: number;
  email: string;
  role: 'client' | 'worker' | 'admin'
}
