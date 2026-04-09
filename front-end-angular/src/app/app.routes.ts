import { Routes } from '@angular/router';
import { NotFound } from './shared/components';


export const routes: Routes = [
  { path: '', loadComponent: () => import('./features/home/home').then(m => m.Home) },
  { path: 'about-us', loadComponent: () => import('./features/about/about').then(m => m.About) },
  { path: 'contact-us', loadComponent: () => import('./features/contact/contact').then(m => m.Contact) },
  { path: 'login', loadComponent: () => import('./features/auth/login/login').then(m => m.Login) },
  // Staff
  { path: 'staff/login', loadComponent: () => import('./features/auth/login/login').then(m => m.Login) },
  // NotFound
  {
    path: '**',
    component: NotFound
  }
];
