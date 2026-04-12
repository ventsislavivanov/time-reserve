import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthStore} from '../../features/auth/auth.store';

export const authGuard: CanActivateFn = (route, state) => {
  const auth = inject(AuthStore);
  const router = inject(Router);


  if (!auth.isAuthenticated()) {
    auth.redirectUrl.set(state.url);

    if (state.url.startsWith('/staff')) {
      router.navigate(['/staff/login']);
    } else {
      router.navigate(['/login']);
    }

    return false;
  }

  return true;
};
