import { Routes } from '@angular/router';
import { NotFound } from './shared/components';
import { authGuard } from './core/guards';
import {inject} from '@angular/core';
import {AuthStore} from './features/auth/auth.store';

export const routes: Routes = [
  {
    path: '',
    loadComponent: () => import('./features/home/home').then(m => m.Home)
  },
  {
    path: 'about-us',
    loadComponent: () => import('./features/about/about').then(m => m.About)
  },
  {
    path: 'contact-us',
    loadComponent: () => import('./features/contact/contact').then(m => m.Contact)
  },
  {
    path: 'our-team',
    children: [
      {
        path: '',
        loadComponent: () => import('./features/workers/workers-list').then(m => m.WorkersList),
      },
      {
        path: 'book/:workerId',
        loadComponent: () => import('./features/booking/booking-wizard').then(m => m.BookingWizard)
      }
    ]
  },
  {
    path: 'services',
    loadComponent: () => import('./features/services/services-catalog').then(m => m.ServicesCatalog)
  },
  {
    path: 'my-appointments',
    canActivate: [authGuard],
    loadComponent: () => import('./features/appointments/client/client-appointments').then(m => m.ClientAppointments)
  },

  {
    path: 'sign-up',
    loadComponent: () => import('./features/auth/sign-up').then(m => m.SignUp)
  },
  {
    path: 'login',
    loadComponent: () => import('./features/auth/login').then(m => m.Login)
  },


  // STAFF
  { path: 'staff/login',
    loadComponent: () => import('./features/auth/login').then(m => m.Login)
  },
  {
    path: 'staff',
    canActivate: [authGuard],
    children: [
      { path: 'dashboard',
        loadComponent: () => import('./features/dashboard/dashboard').then(m => m.Dashboard)
      },
      {
        path: 'categories',
        loadComponent: () => import('./features/categories/manage-categories').then(m => m.ManageCategories)
      },
      {
        path: 'appointments',
        loadComponent: () => import('./features/appointments/worker/worker-appointments').then(m => m.WorkerAppointments)
      },
      {
        path: 'pending',
        loadComponent: () => import('./features/appointments/worker/pending').then(m => m.Pending)
      },
      {
        path: 'history',
        loadComponent: () => import('./features/appointments/worker/history').then(m => m.History)
      },
    ]
  },
  // NotFound
  {
    path: '**',
    component: NotFound
  }
];
