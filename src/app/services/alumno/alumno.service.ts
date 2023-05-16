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
    let datosAlumno = JSON.stringify({
      accion: 'insertarReservas',
      contenido: datosClases,
      cuenta: this.cuenta,
      conexion: "FMAT"
    });
    return this.clienteHttp.post<any>(this.API_Alumnos, datosAlumno);
  }

  obtenerClases() {
    let datosAlumno = JSON.stringify({
      accion: 'obtenerClases',
      cuenta: this.cuenta,
      conexion: "FMAT"
    });
    return this.clienteHttp.post<any>(this.API_Alumnos, datosAlumno);
  }

  combrobarReservacion() {
    let datosAlumno = JSON.stringify({
      accion: 'validacionReservas',
      cuenta: this.cuenta,
      conexion: "FMAT"
    });
    return this.clienteHttp.post(this.API_Alumnos, datosAlumno);
  }
}
