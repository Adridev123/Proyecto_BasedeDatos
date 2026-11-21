<?php
session_start();
include __DIR__ . "/conexion.php";

// Muestra un error con el estilo de la web
function mostrarError($mensaje) {
    echo "<link rel='stylesheet' href='../css/formularios.css'>";
    echo "<div class='containerpadre'><div class='mensaje-error'>" . $mensaje
       . " <a href='../EditarPerfil.php'>Volver</a></div></div>";
    exit();
}

if (!isset($_SESSION["usuario_id"])) {
    header("Location: ../IniciarSesion.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: ../EditarPerfil.php");
    exit();
}

$idActual  = $_SESSION["usuario_id"];
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

// Si escribió contraseña nueva, tienen que coincidir
if ($password !== "" && $password !== $confirmar) {
    mostrarError("Las contraseñas no coinciden.");
}

// ¿El correo lo usa otra persona?
$stmt = mysqli_prepare($conexion,
    "SELECT IDUsuario FROM Usuarios WHERE correo = ? AND IDUsuario <> ?");
mysqli_stmt_bind_param($stmt, "si", $correo, $idActual);
mysqli_stmt_execute($stmt);
if (mysqli_fetch_assoc(mysqli_stmt_get_result($stmt))) {
    mostrarError("Ese correo ya está registrado.");
}

if ($password === "") {
    $stmt = mysqli_prepare($conexion,
        "UPDATE Usuarios SET Nombre = ?, correo = ? WHERE IDUsuario = ?");
    mysqli_stmt_bind_param($stmt, "ssi", $nombre, $correo, $idActual);
} else {
    $hash = password_hash($password, PASSWORD_DEFAULT);
    $stmt = mysqli_prepare($conexion,
        "UPDATE Usuarios SET Nombre = ?, correo = ?, Contrasenia = ? WHERE IDUsuario = ?");
    mysqli_stmt_bind_param($stmt, "sssi", $nombre, $correo, $hash, $idActual);
}
mysqli_stmt_execute($stmt);

$_SESSION["nombre"] = $nombre;
header("Location: ../MiCuenta.php?ok=1");
exit();