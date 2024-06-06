import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AdminService } from '../admin-signin/admin-signin.service';
import { TransactionHistoryDetails } from '../../account/transaction/transaction-history/transaction';
import { CreatedAccountDetails } from '../../account/create-account/createdAccountDetails';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
  employeeForm: FormGroup;
  transactions: TransactionHistoryDetails[] = [];
  accounts: CreatedAccountDetails[] = [];
  showAddEmployeePanel: boolean = false;
  showTransactionHistoryPanel: boolean = false; // Add this line
  showAccountDetailsPanel: boolean = false; // Add this line

  constructor(private fb: FormBuilder, private service: AdminService, private http: HttpClient) {
    this.employeeForm = this.fb.group({
      username: ['', Validators.required],
      name: ['', Validators.required],
      email: ['', Validators.required],
      password: ['', Validators.required],
      phone: ['', Validators.required],
    });

    this.http.get<CreatedAccountDetails[]>("http://localhost:5126/api/Accounts").subscribe(
      res => {
        this.accounts = res;

      }
    );
    this.http.get<TransactionHistoryDetails[]>("http://localhost:5126/api/Transactions").subscribe(
      res => this.transactions = res
    )

  }

  ngOnInit(): void {
    this.resetForm();
  }

  toggleAddEmployeeForm() {
    this.showAddEmployeePanel = !this.showAddEmployeePanel;
  }

  onSubmit() {
    if (this.employeeForm.valid) {
      const employeeData = this.employeeForm.value;
      this.service.addEmployee(employeeData).subscribe(
        (response: any) => {
          console.log('Employee added successfully:', response);
          alert('Employee registered successfully');
          window.location.reload();
        },
        error => {
          alert("Invalid Details");
          window.location.reload();
        }
      );
    }
  }

  resetForm() {
    this.employeeForm.reset();
  }
}
