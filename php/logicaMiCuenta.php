<?php
// Busca al usuario logueado y deja sus datos en $usuario
include __DIR__ . "/conexion.php";

$stmt = mysqli_prepare($conexion,
    "SELECT IDUsuario, Nombre, Correo FROM Usuarios WHERE IDUsuario = ?");
mysqli_stmt_bind_param($stmt, "i", $_SESSION["usuario_id"]);
mysqli_stmt_execute($stmt);
$usuario = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));

// Si el usuario ya no existe, cerramos la sesión
if (!$usuario) {
    $_SESSION = [];
    session_destroy();
    header("Location: IniciarSesion.php");
    exit();
}