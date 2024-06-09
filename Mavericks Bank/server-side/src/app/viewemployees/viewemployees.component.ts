import { Component, OnInit } from '@angular/core';
import { AdminService } from '../Admin/admin-signin/admin-signin.service';
import { EmployeeModel } from '../Admin/admin/admin.model';

@Component({
  selector: 'app-viewemployees',
  templateUrl: './viewemployees.component.html',
  styleUrl: './viewemployees.component.css'
})
export class ViewemployeesComponent implements OnInit{
  constructor(private service:AdminService)
  {
    
  }
  employees:EmployeeModel[];
  showTable:boolean=false;

  ngOnInit(): void {
    this.service.getAllEmployees().subscribe({
      next: data=>{
        this.employees=data;
      },
      error:err=>{
        alert("error");
      }
    })
  }

  deleteEmployee(employeeId: number)
  {
    if(confirm('Are you sure you want to delete this employee ?'))
      {
        this.service.deleteEmployee(employeeId).subscribe();
        this.ngOnInit();
        window.location.reload();
      }
  }
 


}
