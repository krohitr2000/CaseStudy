import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { TransactionService } from './transaction.service';
import { ActivatedRoute, Router } from '@angular/router';
import { AccountService } from '../account.service';

@Component({
  selector: 'app-transaction',
  templateUrl: './transaction.component.html',
  styleUrls: ['./transaction.component.css']
})
export class TransactionComponent {
  accountId:number;

  showDeposit = false;
  showWithdraw = false;
  showTransfer = false;
  showHistory = false;

  depositAmount: number;
  withdrawAmount: number;
  transferAccountId: number;
  transferAmount: number;
  customerID: number;
  requestBody = {
    "senderAccountId": -1,
    "receiverAccountId": -1,
    "amount": 500
  };

  constructor(private http: HttpClient, private srv: TransactionService,private route:ActivatedRoute, private router: Router, private accountService: AccountService) {
    this.depositAmount = null;
    this.withdrawAmount = null;
    this.transferAccountId = null;
    this.transferAmount = null;
  }
  ngOnInit(): void {
    this.accountId = this.route.snapshot.params['accountId'];
    console.log(this.accountId);
    
    this.route.params.subscribe(params => {
      this.customerID = params['customerId'];
      console.log(this.customerID, this.accountId);
      // You can call your service here if needed
      // this.custsrv.customertList();
    });
    this.accountService.getAccountById(this.accountId).subscribe({
      next: data => {
        this.customerID = data.customerId;
      }
    })
    }


  showDepositForm() {
    this.showDeposit = true;
    this.showWithdraw = false;
    this.showTransfer = false;
    this.showHistory = false;
  }

  showWithdrawForm() {
    this.showDeposit = false;
    this.showWithdraw = true;
    this.showTransfer = false;
    this.showHistory = false;
  }

  showTransferForm() {
    this.showDeposit = false;
    this.showWithdraw = false;
    this.showTransfer = true;
    this.showHistory = false;
  }

  showTransactionHistory() {
    this.showDeposit = false;
    this.showWithdraw = false;
    this.showTransfer = false;
    this.showHistory = true;
  }

  transfer() {
    this.srv.transfer(this.accountId,this.transferAmount,this.transferAccountId).subscribe(
      (res)=>{
  
        alert("Transaction Successful");
        window.location.reload();
      },
      (err)=> {
        alert("Transaction unsuccessful !!!");
        console.log(err);
      }
    )
  }

  withdraw() {
    this.srv.withdraw(this.accountId,this.withdrawAmount).subscribe(
      (res)=>
      {
        alert("Transaction Successful");
        window.location.reload();
      },
      (err)=> {
        alert("Transaction unsuccessful !!!");
        console.log(err);
      }
    )
    
  }

  deposit() {
    this.srv.deposit(this.accountId,this.depositAmount).subscribe(
    (res)=>
      {
        alert("Transaction Successful");
        window.location.reload();
      },
      (err)=> {
        alert("Transaction unsuccessful !!!");
        console.log(err);
      }
    )
  }

  navigateToCustomerPage()
  {
    this.router.navigate(['customer',this.accountId, "display-account", this.customerID]);
    
  }
}
