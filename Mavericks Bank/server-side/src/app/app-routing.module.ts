import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { CustomerComponent } from './customer/customer.component';
import { LoanPlansComponent } from './loan-plans/loan-plans.component';
import { AboutusComponent } from './aboutus/aboutus.component';
import { SigninComponent } from './customer/signin/signin.component';
import { SignupComponent } from './customer/signup/signup.component';
import { EmpsigninComponent } from './employee/empsignin/empsignin.component';
import { CreateAccountComponent } from './account/create-account/create-account.component';
import { DisplayAccountComponent } from './account/display-account/display-account.component';
import { PendingAccountsComponent } from './account/pending-accounts/pending-accounts.component';
import { RegisterComponent } from './customer/register/register.component';
import { AccountComponent } from './account/account.component';
import { ApplyLoanComponent } from './account/create-account/apply-loan/apply-loan.component';
import { TransactionComponent } from './account/transaction/transaction.component';
import { TransactionHistoryComponent } from './account/transaction/transaction-history/transaction-history.component';
import { EmployeeComponent } from './employee/employee.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { ConfirmPasswordComponent } from './confirm-password/confirm-password.component';
import { AdminSigninComponent } from './admin/admin-signin/admin-signin.component';
import { AdminComponent } from './admin/admin/admin.component';
import { customerGuard } from './guards/customer.guard';
import { employeeGuard } from './guards/employee.guard';
import { AccountsforapprovalComponent } from './employee/accountsforapproval/accountsforapproval.component';
import { ClosecustomeraccountComponent } from './employee/closecustomeraccount/closecustomeraccount.component';
import { AllaccountsComponent } from './employee/allaccounts/allaccounts.component';
import { AlltransactionComponent } from './employee/alltransaction/alltransaction.component';
import { LoanactionsComponent } from './employee/loanactions/loanactions.component';
import { AddemployeeComponent } from './admin/addemployee/addemployee.component';
import { adminGuard } from './guards/admin.guard';
import { ViewemployeesComponent } from './viewemployees/viewemployees.component';

const routes: Routes = [
  {path:'',component:HomeComponent},
  {path:'employee/:employeeId',component:EmployeeComponent, canActivate:[employeeGuard]},
  {path:'loan-plans/:accountId',component:LoanPlansComponent},
  {path:'aboutus',component:AboutusComponent},
  {path:'signin',component:SigninComponent},
  {path:'signup',component:SignupComponent},
  {path:'empsignin',component:EmpsigninComponent},
 
  // {path:'customer/:customerId',component:CustomerComponent, canActivate:[customerGuard]},
  {
    path: 'customer/:customerId',
    component: CustomerComponent, canActivate: [customerGuard],
    children: [
      { path: '', redirectTo: 'customer', pathMatch: 'full' },
      {path:'create-account/:customerId',component:CreateAccountComponent, },
      {path:'display-account/:customerId',component:DisplayAccountComponent},
      {path:'pending-accounts/:customerId',component:PendingAccountsComponent},
    ]
  },
  {
    path:'employee/:employeeId',
    component: EmployeeComponent, canActivate:[employeeGuard],
    children:[
      {path:'', redirectTo:'employee', pathMatch:'full'},
      {path:'accountsforapproval/:employeeId',component:AccountsforapprovalComponent},
      {path:'closecustomeraccount/:employeeId', component:ClosecustomeraccountComponent},
      {path:'allaccounts/:employeeId',component:AllaccountsComponent},
      {path:'alltransaction/:employeeId',component:AlltransactionComponent},
      {path:'loanactions/:employeeId',component:LoanactionsComponent}
    ]
  },
  {
    path:'admin/:adminId',
    component:AdminComponent, canActivate:[adminGuard],
    children:[
      {path:'',redirectTo:'admin',pathMatch:'full'},
      {path:'allaccounts/:adminId',component:AllaccountsComponent},
      {path:'alltransaction/:employeeId',component:AlltransactionComponent},
      {path:'addemployee/:adminId',component:AddemployeeComponent},
      {path:'viewemployees',component:ViewemployeesComponent}
    ]
  },
  
  {path: 'account/:accountId/:customerId', component: AccountComponent },
  {path:'apply-loan/:accountId/:loanType',component:ApplyLoanComponent},
  {path:'transaction/:accountId',component:TransactionComponent},
  {path:'transaction-history/:accountId',component:TransactionHistoryComponent},
  {path:'forgot-password',component:ForgotPasswordComponent},
  {path:'confirm-password/:customerId',component:ConfirmPasswordComponent},
  {path:'admin-signin',component:AdminSigninComponent},
  {path:'admin/:adminId',component:AdminComponent},
  
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
