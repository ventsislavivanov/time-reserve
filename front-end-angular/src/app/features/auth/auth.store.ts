import { computed, inject, Injectable, signal } from '@angular/core';
import { firstValueFrom } from 'rxjs';
import { AuthResponse, User, AuthUser } from '../../core/models';
import { AuthService } from './auth.service';
import { Router } from '@angular/router';

@Injectable({ providedIn: 'root' })
export class AuthStore {
  private authService = inject(AuthService);
  private router = inject(Router);

  private userSig = signal<AuthUser | null>(null);
  private isAuthenticatedSig = signal<boolean>(false);

  user = computed(() => this.userSig());
  isAuthenticated = computed(() => this.isAuthenticatedSig());
  redirectUrl = signal<string | null>(null);

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

  login(data: AuthResponse) {
    this.userSig.set(data.user);
    this.isAuthenticatedSig.set(true);

    localStorage.setItem('token', data.token);
  }

  logout() {
    this.userSig.set(null);
    this.isAuthenticatedSig.set(false);

    localStorage.removeItem('token');

    const loginUrl = this.router.url.startsWith('/staff')
      ? '/staff/login'
      : '/login';

    this.router.navigateByUrl('/', { skipLocationChange: true }).then(() => {
      this.router.navigateByUrl(loginUrl);
    });
  }
}
