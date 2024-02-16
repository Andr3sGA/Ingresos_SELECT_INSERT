<?php
class ClaseConectar
{
    public $conexion;
    protected $db;
    private $host = "localhost";
    private $usu = "root";
    private $clave = "";
    private $base = "Ingresos";

    public function ProcedimientoConectar()
    {
        $this->conexion = new mysqli($this->host, $this->usu, $this->clave, $this->base);
        if ($this->conexion->connect_error) {
            die("Error al conectarse con MySQL: " . $this->conexion->connect_error);
        }
        $this->conexion->set_charset("utf8");
        $this->db = $this->conexion->select_db($this->base);
        if (!$this->db) {
            die("Error al conectar con la base de datos: " . $this->conexion->error);
        }
        return $this->conexion;
    }

    public function ruta()
    {
        define('BASE_PATH', realpath(dirname(__FILE__) . '/../') . '/');

        // Autoload para clases
    }
}

