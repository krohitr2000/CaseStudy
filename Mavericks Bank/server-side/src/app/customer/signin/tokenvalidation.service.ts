import { Injectable, ɵprovideZonelessChangeDetection } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { HttpHeaders } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class TokenvalidationService {
  userType:string = 'user';
  constructor(private router:Router){}

  getToken() {
    return localStorage.getItem("jwt");
  }
  setToken(token) {
    console.log(token);
    localStorage.setItem("jwt", token);
    localStorage.setItem("user-type","customer");
  }
  removeToken(){
    localStorage.removeItem("jwt");
    localStorage.removeItem("user-type");
  }

  getHttpOptions() {
    const token = this.getToken();
    if (token) {
      return {
        headers: new HttpHeaders({
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        })
      };
    } else {
      return {
        headers: new HttpHeaders({
          'Content-Type': 'application/json'
        })
      };
    }
  }

  getEmployeeToken(): string {
    return localStorage.getItem("employeeToken");
  }

  setEmployeeToken(token: string): void {
    localStorage.setItem("employeeToken", token);
    localStorage.setItem("user-type","employee");
  }

  removeEmployeeToken(): void {
    localStorage.removeItem("employeeToken");
    localStorage.removeItem("user-type");
  }

  getAdminToken(): string {
    return localStorage.getItem("adminToken");
  }

  setAdminToken(token: string): void {
    localStorage.setItem("adminToken", token);
    localStorage.setItem("user-type","admin");
  }

  removeAdminToken(): void {
    localStorage.removeItem("adminToken");
    localStorage.removeItem("user-type");
  }

   getUserType() {
    // Retrieve user type from local storage
    const userType = localStorage.getItem('user-type');

    // Check if user type is found in local storage
    if (userType) {
        return userType; // Return user type if found
    } else {
        return "user"; // Return "User" if user type is not found
    }
}

}
