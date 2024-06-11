import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { CreatedAccountDetails } from '../../account/create-account/createdAccountDetails';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-accountsforapproval',
  templateUrl: './accountsforapproval.component.html',
  styleUrl: './accountsforapproval.component.css'
})
export class AccountsforapprovalComponent {
  accounts:CreatedAccountDetails[] = [];
  createdAccounts:CreatedAccountDetails[] = [];
  deletedAccounts:CreatedAccountDetails[] = [];
  employeeId:number;

  constructor(private http:HttpClient, private route: ActivatedRoute) { 
    this.http.get<CreatedAccountDetails[]>("http://localhost:5126/api/Accounts").subscribe(
      res=>{
        this.accounts = res;
        this.setCreatedAccounts();
        this.setDeletedAccounts();
        console.log(this.accounts);
        console.log(this.createdAccounts);
        console.log(this.deletedAccounts);
      }
    );
    
  }

  ngOnInit():void
  {
    this.employeeId = this.route.snapshot.params['employeeId'];
  }

  setCreatedAccounts() {
    this.createdAccounts = this.accounts.filter(a=>a.status=='PENDING');
  }
  setDeletedAccounts() {
    this.deletedAccounts = this.accounts.filter(a=>a.status=='tobedeleted');
  }

  approveNewCustomerAccount(accountId:number) {
    console.log(accountId);
    this.http.get<CreatedAccountDetails>("http://localhost:5126/api/Accounts/"+accountId).subscribe(
      res=>{
        res.status = "approved";
        this.http.put("http://localhost:5126/api/Accounts/"+accountId, res).subscribe(
          res=>this.refreshPage()
        );
      }
    );
    
  }

  disapproveNewCustomerAccount(accountId:number) {
    this.http.get<CreatedAccountDetails>("http://localhost:5126/api/Accounts/"+accountId).subscribe(
      res=>{
        res.status = "disapproved";
        this.http.put("http://localhost:5126/api/Accounts/"+accountId, res).subscribe(
          res=>this.refreshPage()
        );
      }
    );
    
  }
  
  
  
  refreshPage() {
    window.location.reload();
}
}

