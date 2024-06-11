import { Component } from '@angular/core';
import { CreatedAccountDetails } from '../../account/create-account/createdAccountDetails';
import { TransactionHistoryDetails } from '../../account/transaction/transaction-history/transaction';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-alltransaction',
  templateUrl: './alltransaction.component.html',
  styleUrl: './alltransaction.component.css'
})
export class AlltransactionComponent {
  accounts:CreatedAccountDetails[] = [];
  transactions:TransactionHistoryDetails[] =[];
  employeeId:number;

  constructor(private http:HttpClient, private route: ActivatedRoute) { 
    this.http.get<TransactionHistoryDetails[]>("http://localhost:5126/api/Transactions").subscribe(
      res=>this.transactions=res
    )
  }

  ngOnInit():void
  {
    this.employeeId = this.route.snapshot.params['employeeId'];
  }

  refreshPage() {
    window.location.reload();
}

}
