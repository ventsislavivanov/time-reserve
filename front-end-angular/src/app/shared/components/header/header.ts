import { Component, inject, computed } from '@angular/core';
import { Router, RouterLink, NavigationEnd } from '@angular/router';

import { NavLink} from '../ui/navigation/nav-link/nav-link';
import { AuthService } from '../../../features/auth';
import { AuthStore } from '../../../features/auth/auth.store';
import { toSignal } from '@angular/core/rxjs-interop';
import { filter, map } from 'rxjs';

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
  public auth = inject(AuthStore);
  private authService = inject(AuthService);
  private router = inject(Router);

  private urlSignal = toSignal(
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd),
      map(event => (event as NavigationEnd).urlAfterRedirects)
    ),
    { initialValue: this.router.url }
  );

  isStaff = computed(() => this.urlSignal().startsWith('/staff'));

  onLogout() {
    this.authService.logout().subscribe({
      next: () => this.auth.logout(),
      error: () => this.auth.logout()
    });
  }
}
