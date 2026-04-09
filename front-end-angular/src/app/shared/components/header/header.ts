import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { NgClass } from '@angular/common';

import { NavLink} from '../ui/navigation/nav-link/nav-link';

@Component({
  selector: 'app-header',
  imports: [
    RouterLink,
    NavLink,
    NgClass
  ],
  templateUrl: './header.html',
  styleUrl: './header.css'
})
export class Header {}
