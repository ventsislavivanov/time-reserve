import {computed, Injectable, signal} from '@angular/core';
import { User} from '../../core/models';

@Injectable({ providedIn: 'root' })
export class AuthStore {
  private user$ = signal<User | null>(null);
  private isAuthenticated$ = signal<boolean>(false);

  user = computed(() => this.user$());
  isAuthenticated = computed(() => this.isAuthenticated$());

  login(data: User) {
    this.user$.set(data);
    this.isAuthenticated$.set(true);
  }

  logout() {
    this.user$.set(null);
    this.isAuthenticated$.set(false);
  }
}
