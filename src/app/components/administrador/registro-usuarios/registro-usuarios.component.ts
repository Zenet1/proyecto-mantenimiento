import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder, UntypedFormGroup } from '@angular/forms';
import { AdministradorService } from 'src/app/services/administrador/administrador.service';

@Component({
  selector: 'app-registro-usuarios',
  templateUrl: './registro-usuarios.component.html',
  styleUrls: ['./registro-usuarios.component.css']
})
export class RegistroUsuariosComponent implements OnInit {
  
  formRegistro:UntypedFormGroup;
  roles:any;

  constructor(private servicioAdmin:AdministradorService, private formBuilder:UntypedFormBuilder) { }

  ngOnInit(): void {
    this.formRegistro = this.formBuilder.group({
      nombre:[""],
      apellidoPaterno: [""],
      apellidoMaterno: [""],
      usuario:[""],
      contrasena:[""],
      rol:[""]
    });
    this.obtenerRoles();
  }

  trimCampo(campo:any, valor:any){
    var textoTrim = valor.trim();
    campo.setValue(textoTrim);
  }

  trimForm(){
    this.trimCampo(this.formRegistro.controls["nombre"],this.formRegistro.controls["nombre"].value);
    this.trimCampo(this.formRegistro.controls["apellidoPaterno"],this.formRegistro.controls["apellidoPaterno"].value);
    this.trimCampo(this.formRegistro.controls["apellidoMaterno"],this.formRegistro.controls["apellidoMaterno"].value);
    this.trimCampo(this.formRegistro.controls["usuario"],this.formRegistro.controls["usuario"].value);
  }

  obtenerRoles(){
    this.servicioAdmin.obtenerRoles().subscribe(
      respuesta=>{
        this.roles = respuesta;
      }
    );
  }

  registrarUsuario(){
    this.trimForm();
    this.servicioAdmin.registrarUsuario(this.formRegistro.value).subscribe(
      respuesta=>{
        alert("Se registró el usuario correctamente");
        this.formRegistro.reset();
      },
      error=>{
        alert("Ocurrió un error al intentar registrar el usuario");
      }
    );
  }
}