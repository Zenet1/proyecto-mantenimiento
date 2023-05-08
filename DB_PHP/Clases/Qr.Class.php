<?php
require("phpqrcode/qrlib.php");


/**
 * @abstract Generador
 * @method void GenerarImagen()
 * @method void setNombreImagen()
 */
abstract class Generador {
    abstract function GenerarImagen(string $contenido);
    abstract function setNombrePng(string $nombre);
}

class GeneradorQr extends Generador
{
    private $ecc;
    private $pixel_Size;
    private $frame_Size;
    private $path;
    private $file;

    public function __construct()
    {
        $this->ecc = 'Q';
        $this->pixel_Size = 10;
        $this->frame_Size = 5;
        $this->path = realpath(dirname(__FILE__, 2) . "/API/img/");
        $this->file;
    }

    public function GenerarImagen(string $contenido): void
    {
        QRcode::png($contenido,  $this->file, $this->ecc, $this->pixel_Size, $this->frame_Size);
        error_log("SE GENERA");
    }

    public function setNombrePng(string $nombre): void
    {
        $this->file = $this->path . "/" . $nombre . ".png";
    }
}

class APIQR extends Generador
{
    private $API;
    private $ecc;
    private $pixel_Size;
    //private $frame_Size;
    private $path;
    private $file;

    public function __construct()
    {
        $this->ecc = 'Q';
        $this->pixel_Size = 100;
        $this->path = realpath(dirname(__FILE__, 2) . "/API/img/");
        $this->API = "http://api.qrserver.com/v1/create-qr-code/?size=".$this->pixel_Size."x".$this->pixel_Size. "&ecc=$this->ecc&data=";
    }
/**
 * GenerarImagen guardara en el servidor una imagen QR
 * 
 * @param string $contenido Informacion que sera encapsulada en el codigo QR
 * @return void
 * 
 */
    public function GenerarImagen(string $contenido): void
    {
        $imagen = file_get_contents($this->API . $contenido);
        file_put_contents($this->path . "/" . $this->file, $imagen);
    }

    /**
 * <code>
 * Ejemplo
 * 
 * $nombre1 = "pepito" //nombre valido
 * $nombre2 = "pepito.png" //nombre invalido, ya que posee una extension
 * </code>
 * 
 * 
 * @param string $nombre Nombre a colocar en la imagen, este no debe contener ninguna extension
 * @return void
 * 
 */
    public function setNombrePng(string $nombre): void
    {
        //Antes de guardar asignar a la variable $file, primero se limpia el nombre por si existe alguna extension.
        $extension = pathinfo($nombre, PATHINFO_EXTENSION);
        $nombreSinExtension = str_replace("." . $extension, "", $nombre);
        $this->file =  $nombreSinExtension . ".png";
    }
}