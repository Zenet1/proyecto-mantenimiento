<?php

include_once("../Clases/Sanitizador.func.php");
include_once("Autenticacion.Query.php");


class Autenticar
{
    private Query $objQuery;
    private AutentcacionQuery $objAunQ;

    public function __construct(Query $objQuery)
    {
        $this->objQuery = $objQuery;
        $this->objAunQ = new AutentcacionQuery();
    }

/**
 * @param array $contenido Contiene la informacion para validar una cuenta de usuario {usuario, contrasena}
 * @return string Si cuenta con una cuenta, devolvera una objeto en cadena (json_encode), de lo contrario, devulve una cadena con una advertencia
 */
    public function ValidarCuenta(array $contenido)
    {
        $incognitas = array("ctn" => Sanitizar($contenido["usuario"]), "pss" => Sanitizar($contenido["contrasena"]) );
        $resultado = $this->objQuery->ejecutarConsulta($this->objAunQ->VerificarLocal(), $incognitas);

        if (sizeof($resultado) !== 0) {
            $this->ObtenerDatosPorRol($resultado[0]);
            $CuentaUsuario = array("Cuenta" => $resultado[0]["Cuenta"], "Rol" => $resultado[0]["Rol"]);
            echo json_encode($CuentaUsuario);
            exit();
        }
        echo json_encode("Sin cuenta valida");
        exit();
    }

    /**
     * @param array $contenido
     * @deprecated 0.0.1
     * @Annotation La funcion fue deprecada debido a que no cuenta con ningun metodo u API ara validar las cuentas pasadas.
     */
     public function ValidarCuentaINET(array $contenido)
     {
    //     if (validar_ldap($contenido["usuario"], $contenido["contrasena"]) === 1) {
    //         $this->ActualizarDatos($contenido);
    //         $this->ValidarCuenta($contenido);
    //     } else {
    //         $this->ValidarCuenta($contenido);
    //     }
     }

    private function ObtenerDatosPorRol(array $datos)
    {
        switch ($datos["Rol"]) {
            case "Alumno":
                $this->AlumnosDatos($datos);
                break;
            case "Personal":
                $this->PersonalDatos($this->objAunQ->DatosPersonal(), $datos);
                break;
            case "Profesor":
                $this->PersonalDatos($this->objAunQ->DatosProfesor(), $datos);
                break;
        }
    }

    private function AlumnosDatos(array $datosCuenta)
    {
        $incognitas = array("idu" => $datosCuenta["IDUsuario"]);
        $resultado = $this->objQuery->ejecutarConsulta($this->objAunQ->DatosAlumno(), $incognitas);
        
        $nombreCompleto = $resultado[0]["NombreAlumno"] . " ";
        $nombreCompleto .= $resultado[0]["ApellidoPaternoAlumno"] . " ";
        $nombreCompleto .= $resultado[0]["ApellidoMaternoAlumno"];
        
        $_SESSION["Nombre"] = $nombreCompleto;
        $_SESSION["IDAlumno"] = $resultado[0]["IDAlumno"];
        $_SESSION["Matricula"] = $resultado[0]["Matricula"];
        $_SESSION["Correo"] = $resultado[0]["CorreoAlumno"];
        
    }

    private function PersonalDatos(string $sql, array $datosCuenta)
    {
        $incognitas = array("idu" => $datosCuenta["IDUsuario"]);
        $resultado = $this->objQuery->ejecutarConsulta($sql, $incognitas);

        $nombreCompleto = $resultado[0]["NOMBRE"] . " " . $resultado[0]["APP"];
        
        $_SESSION["Correo"] = $resultado[0]["CORREO"];
        $_SESSION["Nombre"] = $nombreCompleto;
        $_SESSION["ID"] = $resultado[0]["ID"];
    }

    private function ActualizarDatos(array $contenido)
    {
        $incognitas = array($contenido["cuenta"], $contenido["contrasena"]);
        $this->objQuery->ejecutarConsulta($this->objAunQ->ActualizarCuenta(), $incognitas);
    }
}
