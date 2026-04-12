import {Component, inject} from '@angular/core';
import { RouterLink } from '@angular/router';

import { NavLink} from '../ui/navigation/nav-link/nav-link';
import { AuthService } from '../../../features/auth';
import { AuthStore } from '../../../features/auth/auth.store';

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
  public auth = inject(AuthStore);

  onLogout() {
    this.auth.logout();

    this.authService.logout();
  }
}
