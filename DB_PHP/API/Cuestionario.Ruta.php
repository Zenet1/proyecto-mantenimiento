<?php
session_start();
include_once("../Clases/Sanitizador.func.php");
include_once("Servicios/Administrador/Pregunta.Servicio.php");
include_once("Servicios/Usuarios/Cuestionario.Servicio.php");
include_once("../Clases/Query.Class.php");
include_once("../Clases/Email.Class.php");
include_once("../Clases/Conexion.Class.php");

$json = file_get_contents('php://input');
$datos = json_decode($json);

$conexion = isset($_SESSION["Conexion"]) ? $_SESSION["Conexion"] : "FMAT";

Conexion::ReconfigurarConexion($conexion);
$QueryObj = new Query();
$PreguntaControl = new Pregunta($QueryObj);
$CuestionarioControl = new CuestionarioControl($QueryObj);


switch ($datos->accion) {
    case "recuperarPreguntas":
        $PreguntaControl->FiltrarPreguntas();
        break;
    case "enviarCorreo":
        Conexion::ReconfigurarConexion("CAMPUS");
        $CuestionarioControl->EnviarRechazo(Conexion::ConexionInstacia("CAMPUS"));
        break;
}
