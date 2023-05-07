<?php
include_once("../Clases/Sanitizador.func.php");
include_once("../Clases/Query.Class.php");
include_once("../Clases/Conexion.Class.php");
include_once("Servicios/Externo/RegistroExterno.Servicio.php");

$jsonUsuario = file_get_contents('php://input');
$datos = json_decode($jsonUsuario);

Conexion::ReconfigurarConexion($datos->contenido->facultad);
$QueryControl = new Query();
$RegistroExterno = new RegistroExterno($QueryControl);

$RegistroExterno->inicializarSesionExterno($datos->contenido);
