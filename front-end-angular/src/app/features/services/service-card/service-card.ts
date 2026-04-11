import {Component, Input} from '@angular/core';

@Component({
  selector: 'service-card',
  imports: [],
  templateUrl: './service-card.html',
})
export class ServiceCard {
  @Input() service!: any;
  @Input() category!: any;
}
