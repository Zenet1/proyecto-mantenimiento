<?php

include_once("../Clases/Query.Class.php");
include_once("../Clases/Conexion.Class.php");
include_once("Servicios/Usuarios/Autenticar.Servicio.php");

$jsonUsuario = file_get_contents('php://input');
$datos = (array) json_decode($jsonUsuario);

Conexion::ReconfigurarConexion($datos["cuenta"]->facultad);

$QueryControl = new Query();
$UsuariosControl = new Autenticar($QueryControl);

switch ($datos["accion"]) {
    case "validarINET":
        $UsuariosControl->ValidarCuenta((array) $datos["cuenta"]);
        break;
    case "validarSICAS":
        $UsuariosControl->ValidarCuenta((array) $datos["cuenta"]);
        break;
    
}
