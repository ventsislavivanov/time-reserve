import { Component, inject, signal } from '@angular/core';
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { filter } from 'rxjs';

import { Header, Footer } from './shared/components';



@Component({
  selector: 'app-root',
  imports: [
    RouterOutlet,
    FontAwesomeModule,
    Header,
    Footer,
  ],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  private router = inject(Router);

  protected readonly title = signal('front-end-angular');
  hideHeader = signal(false);

  constructor() {
    this.router.events
      .pipe(filter(e => e instanceof NavigationEnd))
      .subscribe((e: NavigationEnd) => {
        this.hideHeader.set(e.urlAfterRedirects.startsWith('/staff/login'));
      });
  }
}
