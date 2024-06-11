import { Component } from '@angular/core';
import { LoanDetails } from '../../account/create-account/apply-loan/loanDetails';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-loanactions',
  templateUrl: './loanactions.component.html',
  styleUrl: './loanactions.component.css'
})
export class LoanactionsComponent {
  employeeId:number;
  loans:LoanDetails[]=[];

  constructor(private http:HttpClient, private route: ActivatedRoute) { 
    this.http.get<LoanDetails[]>("http://localhost:5126/api/Loans").subscribe(
      res=>{
        this.loans=res;
        this.loans = this.loans.filter(loan=>loan.loanStatus === 'PENDING');
      }
    )
  }
  ngOnInit():void
  {
    this.employeeId = this.route.snapshot.params['employeeId'];
  }
    approveLoan(loanId:number)
    {
      this.http.get<LoanDetails>("http://localhost:5126/api/Loans/"+loanId).subscribe(
        res=>{
          res.loanStatus = "Approved";
          res.approvalDate=new Date();
          res.disbursementDate=new Date();
          this.http.put("http://localhost:5126/api/Loans/"+loanId, res).subscribe(
            res=>this.refreshPage()
          );
        }
      )
    }
    disapproveLoan(loanId:number)
    {
      this.http.get<LoanDetails>("http://localhost:5126/api/Loans/"+loanId).subscribe(
        res=>{
          res.loanStatus = "disapproved";
          this.http.put("http://localhost:5126/api/Loans/"+loanId, res).subscribe(
            res=>this.refreshPage()
          );
        }
      )
    }

  refreshPage() {
    window.location.reload();
}

}
