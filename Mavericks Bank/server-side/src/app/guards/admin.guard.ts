import { CanActivateFn } from '@angular/router';

export const adminGuard: CanActivateFn = (route, state) => {
  if(localStorage.getItem("user-type")==="admin"){
    alert("unauthorized")
    return true;
  }
  return false;
};
