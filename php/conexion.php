<?php
// Base de datos Consecionario (importar SQL/Concesionaria(2+usuarios).sql)
$conexion = mysqli_connect("localhost", "root", "", "Consecionariase");

if (!$conexion) {
    die("Error al conectar con la base de datos: " . mysqli_connect_error());
}

mysqli_set_charset($conexion, "utf8mb4");