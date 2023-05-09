<?php
function CorreoValidacion(String $correo){
    $patron = '/^(?=.{1,64}@)(?=.{5,}@((gmail\.com)|(outlook\.com)|(yahoo\.com)|(icloud\.com)|(aol\.com))$)[A-Za-z0-9._%+-]+@((gmail\.com)|(outlook\.com)|(yahoo\.com)|(icloud\.com)|(aol\.com))$/';

    return preg_match($patron, $correo);
}