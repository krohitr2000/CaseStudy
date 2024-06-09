import { Component, OnInit } from '@angular/core';
import { AccountService } from '../account.service';
import { Account } from '../accountmodel';
import { ActivatedRoute, Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';


@Component({
  selector: 'app-pending-accounts',
  templateUrl: './pending-accounts.component.html',
  styleUrls: ['./pending-accounts.component.css']
})
export class PendingAccountsComponent implements OnInit {
  customerId:number;
  pendingList:Account[];
  constructor(public srv: AccountService, private route: ActivatedRoute, private jwtHelper:JwtHelperService, private router:Router) {
    
  }
  accounts: Account[] = [];
  ngOnInit():void
  {
    console.log("STarted");
    this.customerId = this.route.snapshot.params['customerId'];
    this.srv.accountList(this.customerId).subscribe(
      (res)=>
      this.pendingList = res.filter(account => account.status === 'PENDING')
    );
  }
  authenticate() {
    const token = localStorage.getItem("jwt");
    console.log(token != null + " " + !this.jwtHelper.isTokenExpired(token))

    if (token != null && !this.jwtHelper.isTokenExpired(token)){
      return true;
    }
    return false;
  }
}
