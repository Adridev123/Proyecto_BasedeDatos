<?php
include "php/auth.php";
include "php/logicaMiCuenta.php";
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/formularios.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar perfil</title>
</head>
<body>
    <!--NAVBAR-->
    <?php include 'navbar.php'; ?>
    <!--NAVBAR-->

    <div class="divtitle">
        <h1 id="title">Editar perfil</h1>
        <h2 id="subtitle">Cambiá tus datos. Si dejás la contraseña vacía, no se modifica.</h2>
    </div>

    <form class="containerpadre" action="php/Logicaeditar.php" method="POST">

        <div class="form-field">
            <label for="nombre" class="form-label">Nombre completo</label>
            <input type="text" class="form-control" id="nombre" name="nombre"
                   value="<?php echo htmlspecialchars($usuario["Nombre"]); ?>" required>
        </div>

        <div class="form-field">
            <label for="user" class="form-label">Direccion de Correo Electronico</label>
            <input type="email" class="form-control" id="user" name="user"
                   value="<?php echo htmlspecialchars($usuario["Correo"]); ?>" required>
        </div>

        <div class="form-field">
            <label for="pass" class="form-label">Nueva contraseña</label>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="Dejalo vacío para no cambiarla">
        </div>

        <div class="form-field">
            <label for="confirmar" class="form-label">Confirmar nueva contraseña</label>
            <input type="password" class="form-control" id="confirmar" name="confirmar" placeholder="Repetí la nueva contraseña">
        </div>

        <div class="text-center">
            <button type="submit" id="Btncontinue">Guardar cambios</button>
        </div>

        <div class="text-center">
            <a class="btn-accion btn-salir" href="MiCuenta.php">Volver a mi cuenta</a>
        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--Piedepagina-->
    <?php include 'PieDePagina.php'; ?>
    <!--Piedepagina-->
</body>
</html>