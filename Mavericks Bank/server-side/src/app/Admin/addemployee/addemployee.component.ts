import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { AdminService } from '../admin-signin/admin-signin.service';



@Component({
  selector: 'app-addemployee',
  templateUrl: './addemployee.component.html',
  styleUrl: './addemployee.component.css'
})
export class AddemployeeComponent {
  employeeForm: FormGroup;
  showAddEmployeePanel: boolean = false;
  employee: any;

  constructor(private fb: FormBuilder, private service: AdminService, private http: HttpClient) {
    this.employeeForm = this.fb.group({
      username: ['', Validators.required],
      name: ['', Validators.required],
      email: ['', Validators.required],
      password: ['', Validators.required],
      phone: ['', Validators.required],
    });

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
