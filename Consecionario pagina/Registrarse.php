<?php
session_start();
if (isset($_SESSION["usuario_id"])) {
    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/formularios.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
</head>
<body>
    <!--NAVBAR-->
    <?php include 'navbar.php'; ?>
    <!--NAVBAR-->

    <!--FORM DE REGISTRO-->
    <div class="divtitle">
        <h1 id="title">Registrarse</h1>
        <h2 id="subtitle">Completá tus datos para crear tu cuenta. ¿Ya tenés cuenta? <a href="IniciarSesion.php">Inicia sesión</a>.</h2>
    </div>

    <form class="containerpadre" action="php/logica_registrarse.php" method="POST">

        <div class="form-field">
            <label for="nombre" class="form-label">Nombre completo</label>
            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingresá tu nombre" required>
        </div>

        <div class="form-field">
            <label for="user" class="form-label">Direccion de Correo Electronico</label>
            <input type="email" class="form-control" id="user" name="user" placeholder="name@example.com" required>
        </div>

        <div class="form-field">
            <label for="pass" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="Creá una contraseña" required>
        </div>

        <div class="form-field">
            <label for="confirmar" class="form-label">Confirmar contraseña</label>
            <input type="password" class="form-control" id="confirmar" name="confirmar" placeholder="Repetí tu contraseña" required>
        </div>

        <div class="text-center">
            <button type="submit" id="Btncontinue">Registrarme</button>
        </div>

    </form>
    <!--FORM DE REGISTRO-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--Piedepagina-->
    <?php include 'PieDePagina.php'; ?>
    <!--Piedepagina-->
</body>
</html>