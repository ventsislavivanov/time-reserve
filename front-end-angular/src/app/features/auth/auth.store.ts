import {computed, Injectable, signal} from '@angular/core';
import { User } from '../../core/models';

@Injectable({ providedIn: 'root' })
export class AuthStore {
  private userSig = signal<User | null>(null);
  private isAuthenticatedSig = signal<boolean>(false);

  user = computed(() => this.userSig());
  isAuthenticated = computed(() => this.isAuthenticatedSig());

  // constructor() {
  //   this.restoreFromLocalStorage();
  // }
  //
  // private restoreFromLocalStorage() {
  //   const userJson = localStorage.getItem('user');
  //   const token = localStorage.getItem('token');
  //
  //   if (userJson && token) {
  //     const user = JSON.parse(userJson) as User;
  //     this.userSig.set(user);
  //     this.isAuthenticatedSig.set(true);
  //   }
  // }

  login(data: User) {
    this.userSig.set(data);
    this.isAuthenticatedSig.set(true);
  }

  logout() {
    this.userSig.set(null);
    this.isAuthenticatedSig.set(false);
  }
}
