import {
  ApplicationConfig,
  provideBrowserGlobalErrorListeners,
  provideAppInitializer,
  inject,
  importProvidersFrom
} from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { ANIMATION_MODULE_TYPE } from '@angular/platform-browser/animations';
import { RECAPTCHA_V3_SITE_KEY, RecaptchaV3Module } from 'ng-recaptcha';
import { provideToastr } from 'ngx-toastr';

import { routes } from './app.routes';
import { ErrorInterceptor, TokenInterceptor } from './core/interceptors';
import { AuthStore } from './features/auth/auth.store';

import { environment } from '../environments/environment';

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
    }),

    {
      provide: RECAPTCHA_V3_SITE_KEY,
      useValue: (environment as any).recaptchaSiteKey || '',
    },
    importProvidersFrom(RecaptchaV3Module),
  ]
};

export const API_URL = environment.apiUrl;
