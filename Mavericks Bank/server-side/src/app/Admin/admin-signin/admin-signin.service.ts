import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { EmployeeModel } from '../admin/admin.model';
import { TransactionHistoryDetails } from '../../account/transaction/transaction-history/transaction';
import { CreatedAccountDetails } from '../../account/create-account/createdAccountDetails';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AdminService {
  readonly adminloginurl = 'http://localhost:5126/api/Admins/Login';
  readonly adminurl = 'http://localhost:5126/api/Employees';

  list:EmployeeModel[];
  employeeData:EmployeeModel=new EmployeeModel();

  constructor(private http: HttpClient) { }

  authenticate(username: string, password: string) {
    return this.http.post(this.adminloginurl, { username, password });
  }

  addEmployee(employeeData: any) {
    return this.http.post(this.adminurl, employeeData);
  }

  getTransactionHistory(): Observable<TransactionHistoryDetails[]> {
    return this.http.get<TransactionHistoryDetails[]>("http://localhost:5126/api/Transactions");
  }

  getAccountDetails(): Observable<CreatedAccountDetails[]> {
    return this.http.get<CreatedAccountDetails[]>("http://localhost:5126/api/Accounts");
  }

 
}
