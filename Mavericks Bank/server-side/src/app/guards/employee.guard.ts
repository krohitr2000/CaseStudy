import { CanActivateFn } from '@angular/router';

export const employeeGuard: CanActivateFn = (route, state) => {
  if(localStorage.getItem("user-type")==="employee"){
    alert("unauthorized")
    return true;
  }
  return false;
};
