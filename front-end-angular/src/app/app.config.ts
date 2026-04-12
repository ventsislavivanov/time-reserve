import {
  ApplicationConfig,
  provideBrowserGlobalErrorListeners,
  provideAppInitializer,
  inject
} from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { routes } from './app.routes';
import { TokenInterceptor } from './core/interceptors/token.interceptor';
import { AuthStore } from './features/auth/auth.store';

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideRouter(routes),
    provideHttpClient(
      withInterceptors([TokenInterceptor])
    ),

    provideAppInitializer(() => {
      const authStore = inject(AuthStore);
      return authStore.restoreSession();
    })
  ]
};
