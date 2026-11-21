<?php
include "php/auth.php";
include "php/logicaMiCuenta.php";
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/micuenta.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi cuenta</title>
</head>
<body>
    <!--NAVBAR-->
    <?php include 'navbar.php'; ?>
    <!--NAVBAR-->

    <div class="divtitle">
        <h1 id="title">Mi cuenta</h1>
        <h2 id="subtitle">Hola, <?php echo htmlspecialchars($usuario["Nombre"]); ?></h2>
    </div>

    <div class="containerpadre">

        <?php if (isset($_GET["ok"])): ?>
            <div class="mensaje-ok">Datos guardados correctamente.</div>
        <?php endif; ?>

        <div class="perfil-datos">
            <p><strong>Nombre:</strong> <?php echo htmlspecialchars($usuario["Nombre"]); ?></p>
            <p><strong>Correo:</strong> <?php echo htmlspecialchars($usuario["Correo"]); ?></p>
        </div>

        <a class="btn-accion" href="EditarPerfil.php">Editar perfil</a>
        <a class="btn-accion btn-salir" href="php/logout.php">Cerrar sesión</a>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--Piedepagina-->
    <?php include 'PieDePagina.php'; ?>
    <!--Piedepagina-->
</body>
</html>