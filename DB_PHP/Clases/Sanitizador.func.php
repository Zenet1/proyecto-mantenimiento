<?php
function Sanitizar(string $cadena){
    $comandosSQL = "/(select|drop|insert|update|delete|create|alter|truncate|grant|revoke|use|commit|rollback|begin|declare)\b/i";
    $noAlfaNum = "/[^a-zA-Z0-9@]/";

    $noComandos = preg_replace($comandosSQL, '', $cadena);
    $alfaNum = preg_replace($noAlfaNum, '', $noComandos);

    return $alfaNum;
}