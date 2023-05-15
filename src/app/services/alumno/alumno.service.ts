import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LoginService } from '../login/login.service';

@Injectable({
  providedIn: 'root',
})
export class AlumnoService {
  API_Alumnos: string =
    'http://localhost:80/proyecto-mantenimiento/DB_PHP/API/Alumnos.Ruta.php';
  cuenta!: string;

  constructor(private clienteHttp: HttpClient, login: LoginService) {
    this.cuenta = login.getUsuario();
  }

  enviarAsistencia(datosClases: any): Observable<any> {
    let datos = JSON.stringify({
      accion: 'insertarReservas',
      contenido: datosClases,
      cuenta: this.cuenta,
    });
    return this.clienteHttp.post<any>(this.API_Alumnos, datos);
  }

  obtenerClases() {
    let datos = JSON.stringify({
      accion: 'obtenerClases',
      cuenta: this.cuenta,
    });
    return this.clienteHttp.post<any>(this.API_Alumnos, datos);
  }

  combrobarReservacion() {
    let datos = JSON.stringify({
      accion: 'validacionReservas',
      cuenta: this.cuenta,
    });
    return this.clienteHttp.post(this.API_Alumnos, datos);
  }
}
