import { Routes } from '@angular/router';
import { NotFound } from './shared/components';

export const routes: Routes = [
  { path: '', loadComponent: () => import('./features/home/home').then(m => m.Home) },
  { path: 'about-us', loadComponent: () => import('./features/about/about').then(m => m.About) },
  { path: 'contact-us', loadComponent: () => import('./features/contact/contact').then(m => m.Contact) },

  { path: 'our-team', loadComponent: () => import('./features/workers/workers-list').then(m => m.WorkersList) },
  { path: 'services', loadComponent: () => import('./features/services/services-catalog').then(m => m.ServicesCatalog) },

  { path: 'sign-up', loadComponent: () => import('./features/auth/sign-up').then(m => m.SignUp) },
  { path: 'login', loadComponent: () => import('./features/auth/login').then(m => m.Login) },
  // Staff
  { path: 'staff/login', loadComponent: () => import('./features/auth/login').then(m => m.Login) },
  // NotFound
  {
    path: '**',
    component: NotFound
  }
];
