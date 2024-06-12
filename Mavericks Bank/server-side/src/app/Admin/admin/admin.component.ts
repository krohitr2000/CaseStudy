import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AdminService } from '../admin-signin/admin-signin.service';
import { TransactionHistoryDetails } from '../../account/transaction/transaction-history/transaction';
import { CreatedAccountDetails } from '../../account/create-account/createdAccountDetails';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
  isExpanded = false;
  
  toggleMenu() {
    this.isExpanded = !this.isExpanded;
    console.log(this.isExpanded);
    
  }
  
  employeeForm: FormGroup;
  transactions: TransactionHistoryDetails[] = [];
  accounts: CreatedAccountDetails[] = [];
  showAddEmployeePanel: boolean = false;
  showTransactionHistoryPanel: boolean = false;
  showAccountDetailsPanel: boolean = false; 
  employee: any;
  adminId:number;

  constructor(private fb: FormBuilder, private service: AdminService, private http: HttpClient, private route:ActivatedRoute) {
    
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
    this.adminId=this.route.snapshot.params['adminId']
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
