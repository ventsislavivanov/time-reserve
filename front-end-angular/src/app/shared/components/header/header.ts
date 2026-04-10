import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';

import { NavLink} from '../ui/navigation/nav-link/nav-link';

@Component({
  selector: 'app-header',
  imports: [
    RouterLink,
    NavLink,
  ],
  templateUrl: './header.html',
  styleUrl: './header.css'
})
export class Header {}
