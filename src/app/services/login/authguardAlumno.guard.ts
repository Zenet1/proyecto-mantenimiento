import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { LoginService } from './login.service'; 
 
@Injectable({
  providedIn: 'root'
})
export class AuthguardGuardAlumno   {
 
  constructor(private servicioLogin:LoginService, private router:Router) {}
 
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean | UrlTree {
    const routeurl: string = state.url;
    return this.isLogin(routeurl);
  }
  
  isLogin(routeurl: string) {
    if (this.servicioLogin.isLoggedIn() && (this.servicioLogin.getRol() == "Alumno")) {
      return true;
    } else {
      return this.router.navigateByUrl('login');
    }
  }
}