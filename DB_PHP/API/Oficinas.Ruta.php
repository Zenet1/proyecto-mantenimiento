<?php
if(session_status() !== PHP_SESSION_ACTIVE) session_start();
header("Access-Control-Allow-Origin:*");
include_once("../Clases/Sanitizador.func.php");
include_once("Servicios/Administrador/Edificio.Servicio.php");
include_once("Servicios/Administrador/Oficina.Servicio.php");
include_once("../Clases/Conexion.Class.php");
include_once("../Clases/Query.Class.php");

$datos = null;
$accion = null;

if (isset($_POST) && sizeof($_POST) > 0) {
    $accion = $_POST["accion"];
} else {
    $json = file_get_contents('php://input');
    $datos = json_decode($json);
    $accion = $datos->accion;
}

$Conexion = Conexion::ConexionInstacia("FMAT");
Conexion::ReconfigurarConexion("FMAT");

$QueryObj = new Query();
$EdificioControl = new Edificio($QueryObj);
$OficinaControl = new Oficina($QueryObj);

switch ($accion) {
    case "recuperarEdificios":
        $EdificioControl->recuperarEdificios();
        break;
    case "recuperarOficinas":
        $OficinaControl->recuperarOficinas();
        break;
    case "eliminarOficina":
        $OficinaControl->eliminarOficina((string)$datos->contenido);
        break;
    case "agregarOficina":
        $OficinaControl->insertarOficina((array)$datos->contenido);
        break;
}
