<?php
// Valida correo y contraseña
session_start();
include __DIR__ . "/conexion.php";

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: ../IniciarSesion.php");
    exit();
}

$correo   = trim($_POST["user"] ?? "");
$password = $_POST["pass"] ?? "";

// Consulta preparada: evita inyección SQL
$stmt = mysqli_prepare($conexion,
    "SELECT IDUsuario, Nombre, Contrasenia FROM Usuarios WHERE correo = ?");
mysqli_stmt_bind_param($stmt, "s", $correo);
mysqli_stmt_execute($stmt);
$fila = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));

// password_verify compara la contraseña escrita con el hash guardado
if ($fila && password_verify($password, $fila["Contrasenia"])) {
    $_SESSION["usuario_id"] = $fila["IDUsuario"];
    $_SESSION["nombre"]     = $fila["Nombre"];
    header("Location: ../index.php");
    exit();
}

echo "<link rel='stylesheet' href='../css/formularios.css'>";
echo "<div class='containerpadre'><div class='mensaje-error'>Correo o contraseña incorrectos. <a href='../IniciarSesion.php'>Volver</a></div></div>";