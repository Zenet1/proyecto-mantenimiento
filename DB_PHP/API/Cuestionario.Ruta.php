<?php
if(session_status() !== PHP_SESSION_ACTIVE) session_start();
header("Access-Control-Allow-Origin:*");
include_once("../Clases/Sanitizador.func.php");
include_once("Servicios/Administrador/Pregunta.Servicio.php");
include_once("Servicios/Usuarios/Cuestionario.Servicio.php");
include_once("../Clases/Query.Class.php");
include_once("../Clases/Email.Class.php");
include_once("../Clases/Conexion.Class.php");

$Conexion = Conexion::ConexionInstacia("FMAT");
Conexion::ReconfigurarConexion("FMAT");

$QueryObj = new Query();
$PreguntaControl = new Pregunta($QueryObj);
$CuestionarioControl = new CuestionarioControl($QueryObj);

$json = file_get_contents('php://input');
$datos = json_decode($json);

switch ($datos->accion) {
    case "recuperarPreguntas":
        $PreguntaControl->FiltrarPreguntas();
        break;
    case "enviarCorreo":
        Conexion::ReconfigurarConexion("CAMPUS");
        $CuestionarioControl->EnviarRechazo(Conexion::ConexionInstacia("CAMPUS"));
        break;
}
