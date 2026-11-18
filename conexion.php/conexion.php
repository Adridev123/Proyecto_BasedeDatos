
<?php

$conexion = mysqli_connect("localhost", "root", "", "Consecionario");

if (!$conexion) {
    die("Error al conectar con la base de datos: " . mysqli_connect_error());
}

mysqli_set_charset($conexion, "utf8mb4");

?>
