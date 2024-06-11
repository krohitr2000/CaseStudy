import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { JwtModule } from '@auth0/angular-jwt';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { CustomerComponent } from './customer/customer.component';
import { LoanPlansComponent } from './loan-plans/loan-plans.component';
import { AboutusComponent } from './aboutus/aboutus.component';
import { SignupComponent } from './customer/signup/signup.component';
import { SigninComponent } from './customer/signin/signin.component';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RegisterComponent } from './customer/register/register.component';
import { EmpsigninComponent } from './employee/empsignin/empsignin.component';
import { AccountComponent } from './account/account.component';
import { CreateAccountComponent } from './account/create-account/create-account.component';
import { DisplayAccountComponent } from './account/display-account/display-account.component';
import { PendingAccountsComponent } from './account/pending-accounts/pending-accounts.component';
import { ApplyLoanComponent } from './account/create-account/apply-loan/apply-loan.component';
import { TransactionComponent } from './account/transaction/transaction.component';
import { TransactionHistoryComponent } from './account/transaction/transaction-history/transaction-history.component';
import { EmployeeComponent } from './employee/employee.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { ConfirmPasswordComponent } from './confirm-password/confirm-password.component';
import { AdminComponent } from './Admin/admin/admin.component';
import { AdminSigninComponent } from './Admin/admin-signin/admin-signin.component';
import { ViewemployeesComponent } from './viewemployees/viewemployees.component';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { AccountsforapprovalComponent } from './employee/accountsforapproval/accountsforapproval.component';
import { ClosecustomeraccountComponent } from './employee/closecustomeraccount/closecustomeraccount.component';
import { AllaccountsComponent } from './employee/allaccounts/allaccounts.component';
import { AlltransactionComponent } from './employee/alltransaction/alltransaction.component';
import { LoanactionsComponent } from './employee/loanactions/loanactions.component';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    CustomerComponent,
    EmployeeComponent,
    LoanPlansComponent,
    AboutusComponent,
    SignupComponent,
    SigninComponent,
    RegisterComponent,
    EmpsigninComponent,
    AccountComponent,
    CreateAccountComponent,
    DisplayAccountComponent,
    PendingAccountsComponent,
    ApplyLoanComponent,
    TransactionComponent,
    TransactionHistoryComponent,
    ForgotPasswordComponent,
    ConfirmPasswordComponent,
    AdminComponent,
    AdminSigninComponent,
    ViewemployeesComponent,
    AccountsforapprovalComponent,
    ClosecustomeraccountComponent,
    AllaccountsComponent,
    AlltransactionComponent,
    LoanactionsComponent, 
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    JwtModule.forRoot({
      config: {
        tokenGetter: () => {
          return localStorage.getItem('jwt');
        },
        skipWhenExpired: true 
      }
    })

  ],
  providers: [
    provideAnimationsAsync()
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
