<?php
/**
 * 
 * <code>
 * <?php
 * $contraseña = "-- SELECT * FROM 'users'";
 * echo Sanitizar($contraseña) //'users'
 * ?>
 * </code>
 * @return string retorna una cadena sin comandos SQL y caracteres no alfanumericos (excepcion del @)
 */
function Sanitizar(string $cadena){
    $comandosSQL = "/(select|drop|insert|update|delete|create|alter|truncate|grant|revoke|use|commit|rollback|begin|declare)\b/i";
    $noAlfaNum = "/[^a-zA-Z0-9@]/";

    $noComandos = preg_replace($comandosSQL, '', $cadena);
    $alfaNum = preg_replace($noAlfaNum, '', $noComandos);

    return $alfaNum;
}