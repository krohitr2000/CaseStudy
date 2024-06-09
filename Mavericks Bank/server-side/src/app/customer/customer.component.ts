import { Component } from '@angular/core';
import { SeriveService } from './signup/signupserive.service';
import { ActivatedRoute, Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrl: './customer.component.css'
})
export class CustomerComponent {
  customerId:number;
  private routeSub: Subscription;

  constructor(public custsrv:SeriveService, private route: ActivatedRoute, private jwtHelper: JwtHelperService,private router:Router)
  {

  }
  ngOnInit(): void {
    this.routeSub = this.route.params.subscribe(params => {
      this.customerId = params['customerId'];
      console.log(this.customerId);
      // You can call your service here if needed
      // this.custsrv.customertList();
    });
  }

  ngOnChange() {
    console.log("Customer ID...",this.customerId);
  }

  authenticate() {
    const token = localStorage.getItem("jwt");
    console.log(this.jwtHelper.isTokenExpired(token) && token != null);
    if (token != null && !this.jwtHelper.isTokenExpired(token)){
      return true;
    }
    return false;
  }
}
