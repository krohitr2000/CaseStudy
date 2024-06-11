import { Component } from '@angular/core';
import { CreatedAccountDetails } from '../../account/create-account/createdAccountDetails';
import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-closecustomeraccount',
  templateUrl: './closecustomeraccount.component.html',
  styleUrl: './closecustomeraccount.component.css'
})
export class ClosecustomeraccountComponent {

  accounts:CreatedAccountDetails[] = [];
  deletedAccounts:CreatedAccountDetails[] = [];
  employeeId:number;

  constructor(private http:HttpClient, private route: ActivatedRoute) { 
    this.http.get<CreatedAccountDetails[]>("http://localhost:5126/api/Accounts").subscribe(
      res=>{
        this.accounts = res;
        this.setDeletedAccounts();
        console.log(this.accounts);
        console.log(this.deletedAccounts);
      }
    );
    
  }

  ngOnInit():void
  {
    this.employeeId = this.route.snapshot.params['employeeId'];
  }
  setDeletedAccounts() {
    this.deletedAccounts = this.accounts.filter(a=>a.status=='tobedeleted');
  }


  disapproveCloseCustomerAccount(accountId:number) {
    this.http.get<CreatedAccountDetails>("http://localhost:5126/api/Accounts/"+accountId).subscribe(
      res=>{
        res.status = "approved";
        this.http.put("http://localhost:5126/api/Accounts/"+accountId, res).subscribe(
          res=>this.refreshPage()
        );
      }
    );
  }
  approveCloseCustomerAccount(accountId:number)
  {
    this.http.delete("http://localhost:5126/api/Accounts/"+accountId).subscribe(
      res=>this.refreshPage()
    );
  }
  refreshPage() {
    window.location.reload();
}
}
