import { Component, Input } from '@angular/core';
import { RouterLink, RouterLinkActive } from '@angular/router';

@Component({
  selector: 'nav-link',
  imports: [RouterLink, RouterLinkActive],
  templateUrl: './nav-link.html',
})
export class NavLink {
  @Input() to!: string;
  @Input() exact = false;
}

