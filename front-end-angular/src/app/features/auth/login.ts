import { Component, inject, OnInit, signal } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { faUser, faLock } from '@fortawesome/free-solid-svg-icons';

import { AuthService } from './index';
import { AuthStore } from './auth.store';
import { FormField } from '../../shared/components';
import { LoginResponse } from '../../core/models';

@Component({
  selector: 'app-login',
  imports: [FormField, RouterLink, ReactiveFormsModule],
  templateUrl: './login.html',
})
export class Login implements OnInit{
  faUser = faUser;
  faLock = faLock;

  private formBuilder = inject(FormBuilder);
  private authService = inject(AuthService);
  private auth = inject(AuthStore);
  private router = inject(Router);

  loginForm: FormGroup = this.formBuilder.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', [Validators.required, Validators.minLength(3)]],
    remember: [false],
  });

  guard = signal<string>('client');
  isClient = signal<boolean>(true);

  ngOnInit() {
    const url = this.router.url;
    this.guard.set(url === '/login' ? 'client' : 'staff');
    this.isClient.set(url === '/login');
  }

  get emailErrors() {
    const control = this.loginForm.get('email');
    if (control?.touched && control.invalid) {
      return Object.keys(control.errors || {}).map((key, i) => ({
        $uid: i,
        $message: this.getErrorMessage(key, control.errors?.[key])
      }));
    }

    return [];
  }

  get passwordErrors() {
    const control = this.loginForm.get('password');
    if (control?.touched && control.invalid) {
      return Object.keys(control.errors || {}).map((key, i) => ({
        $uid: i,
        $message: this.getErrorMessage(key, control.errors?.[key])
      }));
    }

    return [];
  }

  private getErrorMessage(errorKey: string, errorValue: any): string {
    const messages: any = {
      required: 'This field is required',
      email: 'Please enter a valid email',
      minlength: `Minimum length is ${errorValue?.requiredLength}`
    };

    return messages[errorKey] || 'Invalid field';
  }

  onSubmit() {
    if (this.loginForm.valid) {
      const data = this.loginForm.getRawValue();
      data.guard = this.guard();

      this.authService.login(data).subscribe({
        next: (response: LoginResponse) => {
          this.auth.login(response);

          const target = response.user.role === 'client'
            ? '/'
            : '/staff/dashboard';

          this.router.navigate([target]);
        },
        error: (error) => {
          console.error('Login failed', error);
        }
      });
    }
  }
}
