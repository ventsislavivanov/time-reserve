import { computed, inject, Injectable, signal } from '@angular/core';
import { firstValueFrom } from 'rxjs';
import { LoginResponse, User, UserLogin } from '../../core/models';
import { AuthService } from './auth.service';

@Injectable({ providedIn: 'root' })
export class AuthStore {
  private authService = inject(AuthService);

  private userSig = signal<UserLogin | null>(null);
  private isAuthenticatedSig = signal<boolean>(false);

  user = computed(() => this.userSig());
  isAuthenticated = computed(() => this.isAuthenticatedSig());

  async restoreSession(): Promise<void> {
    const token = localStorage.getItem('token');
    if (!token) return;

    try {
      const response: User = await firstValueFrom(this.authService.getMe());
      this.userSig.set({
        id: response.id,
        email: response.email,
        role: response.role
      });
      this.isAuthenticatedSig.set(true);
    } catch {
      this.userSig.set(null);
      this.isAuthenticatedSig.set(false);

      localStorage.removeItem('token');
    }
  }

  login(data: LoginResponse) {
    this.userSig.set(data.user);
    this.isAuthenticatedSig.set(true);

    localStorage.setItem('token', data.token);
  }

  logout() {
    this.userSig.set(null);
    this.isAuthenticatedSig.set(false);

    localStorage.removeItem('token');
  }
}
