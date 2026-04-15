import {
  ApplicationConfig,
  provideBrowserGlobalErrorListeners,
  provideAppInitializer,
  inject
} from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { ANIMATION_MODULE_TYPE } from '@angular/platform-browser/animations';
import { provideToastr } from 'ngx-toastr';

import { environment } from '.././environments/environment';

import { routes } from './app.routes';
import { ErrorInterceptor, TokenInterceptor } from './core/interceptors';
import { AuthStore } from './features/auth/auth.store';

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideRouter(routes),
    provideHttpClient(
      withInterceptors([TokenInterceptor, ErrorInterceptor])
    ),
    {
      provide: ANIMATION_MODULE_TYPE,
      useValue: 'BrowserAnimations'
    },
    provideToastr({
      timeOut: 3500,
      positionClass: 'toast-bottom-right',
      preventDuplicates: true,
      closeButton: true,
      progressBar: true
    }),

    provideAppInitializer(() => {
      const authStore = inject(AuthStore);
      return authStore.restoreSession();
    })
  ]
};

export const API_URL = environment.apiUrl;
