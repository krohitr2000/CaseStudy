import { CanActivateFn } from '@angular/router';

export const customerGuard: CanActivateFn = (route, state) => {
  if(localStorage.getItem("user-type") === "customer"){
    return true;
    }
  alert("Unauthorized")
  return false;

};
