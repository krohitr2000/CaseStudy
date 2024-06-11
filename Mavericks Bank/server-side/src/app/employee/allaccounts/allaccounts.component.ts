import { Component } from '@angular/core';
import { CreatedAccountDetails } from '../../account/create-account/createdAccountDetails';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-allaccounts',
  templateUrl: './allaccounts.component.html',
  styleUrl: './allaccounts.component.css'
})
export class AllaccountsComponent {
  accounts:CreatedAccountDetails[] = [];
  createdAccounts:CreatedAccountDetails[] = [];
  employeeId:number;

  constructor(private http:HttpClient, private route: ActivatedRoute) { 
    this.http.get<CreatedAccountDetails[]>("http://localhost:5126/api/Accounts").subscribe(
      res=>{
        this.accounts = res;
        console.log(this.accounts);
        console.log(this.createdAccounts);
      }
    );
    
  }

  ngOnInit():void
  {
    this.employeeId = this.route.snapshot.params['employeeId'];
  }

  refreshPage() {
    window.location.reload();
}

}
