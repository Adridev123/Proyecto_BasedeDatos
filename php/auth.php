<?php
// Se incluye al principio de cada página que requiere sesión
session_start();

if (!isset($_SESSION["usuario_id"])) {
    header("Location: IniciarSesion.php");
    exit();
}