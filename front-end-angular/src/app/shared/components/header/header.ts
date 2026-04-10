import {Component, inject} from '@angular/core';
import { RouterLink } from '@angular/router';

import { NavLink} from '../ui/navigation/nav-link/nav-link';
import { AuthService } from '../../../core/services';

@Component({
  selector: 'app-header',
  imports: [
    RouterLink,
    NavLink,
  ],
  templateUrl: './header.html',
  styleUrl: './header.css'
})
export class Header {
  authService = inject(AuthService);
  user = this.authService.user;

  onLogout() {
    console.log('logout')
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    this.authService.setUser(null);
    this.authService.logout();
  }
}
