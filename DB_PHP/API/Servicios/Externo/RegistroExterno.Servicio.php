<?php
class RegistroExterno{

    public function inicializarSesionExterno($datos)
    {
        session_start();
        $_SESSION['Nombre'] = $datos->contenido->nombre;
        $_SESSION['ApellidosExterno'] = $datos->contenido->apellidos;
        $_SESSION['Empresa'] = $datos->contenido->empresa;
        $_SESSION['Correo'] = $datos->contenido->correo;
        $_SESSION['Conexion'] = $datos->facultad;
    }
}
?>