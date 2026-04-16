import { Component, inject, signal } from '@angular/core';
import { FormBuilder, Validators, ReactiveFormsModule, FormGroup } from '@angular/forms';
import {
  faUser,
  faEnvelope,
  faUnlock,
  faUnlockKeyhole,
  faIdCard,
  faPhoneVolume,
  faLocationPin,
  faCalendar
} from '@fortawesome/free-solid-svg-icons';
import { ToastrService } from 'ngx-toastr';
import { ReCaptchaV3Service } from 'ng-recaptcha';
import { firstValueFrom } from 'rxjs';

import { AuthService } from './auth.service';
import { FormField, RadioGroup } from '../../shared/components/ui';
import { passwordMatchValidator } from '../../core/validators';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'sign-up',
  imports: [ FormField, RadioGroup, ReactiveFormsModule ],
  templateUrl: './sign-up.html',
})
export class SignUp {
  faUser = faUser;
  faEnvelope = faEnvelope;
  faUnlock = faUnlock;
  faUnlockKeyhole = faUnlockKeyhole;
  faIdCard = faIdCard;
  faPhoneVolume = faPhoneVolume;
  faLocationPin = faLocationPin;
  faCalendar = faCalendar;

  genderOptions = signal<string[]>(['male', 'female', 'other']);

  private formBuilder = inject(FormBuilder);
  private authService = inject(AuthService);
  private toastr = inject(ToastrService);
  private recaptchaV3Service= inject(ReCaptchaV3Service);

  signUpForm: FormGroup = this.formBuilder.group({
    name: ['', [Validators.required, Validators.pattern(/^[A-Z][a-z]+ [A-Z][a-z]+$/)]],
    email: ['', [Validators.required, Validators.email]],
    gender: ['', Validators.required],
    birth_date: ['', Validators.required],
    phone: ['', [Validators.required, Validators.pattern(/^[0-9]{5,20}$/)]],
    address: ['', Validators.required],
    passwords: this.formBuilder.group({
      password: ['', [
        Validators.required,
        Validators.minLength(4),
        Validators.maxLength(10),
        Validators.pattern(/^[a-zA-Z0-9]*$/)]
      ],
      confirmPassword: ['', [Validators.required]]
    }, { validators: passwordMatchValidator() })
  });

  getErrors(controlName: string) {
    const control = this.signUpForm.get(controlName);

    if (control?.touched && control.invalid) {
      return Object.keys(control.errors || {}).map((key, i) => ({
        $uid: i,
        $message: this.getErrorMessage(key, control.errors?.[key])
      }));
    }

    return [];
  }

  getErrorMessage(errorKey: string, errorValue: any) {
    const messages: any = {
      required: 'This field is required',
      email: 'Please enter a valid email',
      pattern: 'Invalid format',
      minlength: `Minimum length is ${errorValue?.requiredLength}`,
      maxlength: `Maximum length is ${errorValue?.requiredLength}`,
      invalidEgn: 'Invalid EGN',
      passwordMismatch: 'Passwords do not match'
    };

    return messages[errorKey] || 'Invalid field';
  }

  onChangeGender(e: any) {
    this.signUpForm.get('gender')?.setValue(e);
    this.signUpForm.get('gender')?.updateValueAndValidity();
  }

  async onSubmit() {
    if (this.signUpForm.valid) {
      const data = this.signUpForm.getRawValue();
      data.password = data.passwords.password;
      data.guard = 'client';

      if (environment.production && (environment as any).recaptchaSiteKey) {
        data.recaptcha = await firstValueFrom(this.recaptchaV3Service.execute('login'));
      }

      this.authService.register(data).subscribe({
        next: (response) => {
          console.log('Success')
        },
        error: (error) => {
          console.error('Sign up failed', error);
          this.toastr.error(error.error?.message || 'Sign up failed');
        }
      });
    }
  }
}
