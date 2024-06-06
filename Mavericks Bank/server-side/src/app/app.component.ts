import { Component } from '@angular/core';
import { TokenvalidationService } from './customer/signin/tokenvalidation.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'bankfrontend';

  constructor(private tokenservice: TokenvalidationService, private router: Router) {}

  isAuthenticated(): boolean {
    return !!this.tokenservice.getToken();
  }

  isEmployeeAuthenticated(): boolean {
    return !!this.tokenservice.getEmployeeToken();
  }

  isAdminAuthenticated(): boolean {
    return !!this.tokenservice.getAdminToken();
  }

  logout() {
    this.tokenservice.removeToken();
    this.router.navigate(['/']);
  }

  logoutEmployee() {
    this.tokenservice.removeEmployeeToken();
    this.router.navigate(['/empsignin']);
  }

  logoutAdmin() {
    this.tokenservice.removeAdminToken();
    this.router.navigate(['/admin-signin']);
  }

  getType() {
    return this.tokenservice.getUserType();
  }
}
