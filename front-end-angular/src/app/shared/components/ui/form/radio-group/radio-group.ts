import {Component, EventEmitter, Input, Output} from '@angular/core';
import { TitleCasePipe } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'radio-group',
  imports: [
    TitleCasePipe,
    ReactiveFormsModule
  ],
  templateUrl: './radio-group.html',
})
export class RadioGroup {
  @Input() name!: string;
  @Input() options: string[] = [];
  @Input() formControlName?: string;
  @Output() radioValue = new EventEmitter();
}
