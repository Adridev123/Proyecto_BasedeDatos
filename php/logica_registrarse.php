<?php
// Registra un usuario nuevo y lo deja logueado
session_start();
include __DIR__ . "/conexion.php";

// Muestra un error con el estilo de la web
function mostrarError($mensaje) {
    echo "<link rel='stylesheet' href='../css/formularios.css'>";
    echo "<div class='containerpadre'><div class='mensaje-error'>" . $mensaje
       . " <a href='../Registrarse.php'>Volver</a></div></div>";
    exit();
}

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: ../Registrarse.php");
    exit();
}

$nombre    = trim($_POST["nombre"] ?? "");
$correo    = trim($_POST["user"] ?? "");
$password  = $_POST["pass"] ?? "";
$confirmar = $_POST["confirmar"] ?? "";

if ($nombre === "") {
    mostrarError("Completá tu nombre.");
}

if (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
    mostrarError("Ingresá un correo electrónico válido.");
}

if ($password === "") {
    mostrarError("La contraseña es obligatoria.");
}

if ($password !== $confirmar) {
    mostrarError("Las contraseñas no coinciden.");
}

// ¿El correo ya existe?
$stmt = mysqli_prepare($conexion, "SELECT IDUsuario FROM Usuarios WHERE correo = ?");
mysqli_stmt_bind_param($stmt, "s", $correo);
mysqli_stmt_execute($stmt);
if (mysqli_fetch_assoc(mysqli_stmt_get_result($stmt))) {
    mostrarError("Ese correo ya está registrado.");
}

$hash = password_hash($password, PASSWORD_DEFAULT);
$stmt = mysqli_prepare($conexion,
    "INSERT INTO Usuarios (Nombre, correo, Contrasenia) VALUES (?, ?, ?)");
mysqli_stmt_bind_param($stmt, "sss", $nombre, $correo, $hash);
mysqli_stmt_execute($stmt);

$_SESSION["usuario_id"] = mysqli_insert_id($conexion);
$_SESSION["nombre"]     = $nombre;
header("Location: ../index.php");
exit();