import { HttpInterceptorFn } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { inject } from '@angular/core';
import { catchError } from 'rxjs';

export const ErrorInterceptor: HttpInterceptorFn = (req, next) => {
  const toastr = inject(ToastrService);

  return next(req).pipe(
    catchError((error) => {
      const message =
        error?.error?.message ||
        error?.error?.error ||
        'Something went wrong';

      toastr.error(message, 'Error');

      throw error;
    })
  );
};
