
<?php

include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre = $_POST["nombre"];
    $usuario = $_POST["usuario"];
    $password = $_POST["password"];
    $confirmar = $_POST["confirmar"];

    if ($password != $confirmar) {
        die("Las contraseñas no coinciden.");
    }

    $consulta = "SELECT * FROM usuarios WHERE usuario = ?";
    $resultado = mysqli_prepare($conexion, $consulta);

    mysqli_stmt_bind_param($resultado, "s", $usuario);
    mysqli_stmt_execute($resultado);

    $datos = mysqli_stmt_get_result($resultado);

    if (mysqli_num_rows($datos) > 0) {
        die("Ese usuario ya existe. Elegí otro.");
    }

    $password_segura = password_hash($password, PASSWORD_DEFAULT);

    $consulta = "INSERT INTO usuarios (nombre, usuario, password) VALUES (?, ?, ?)";
    $resultado = mysqli_prepare($conexion, $consulta);

    mysqli_stmt_bind_param($resultado, "sss", $nombre, $usuario, $password_segura);

    if (mysqli_stmt_execute($resultado)) {

        echo "
        <!DOCTYPE html>
        <html lang='es'>
        <head>
            <meta charset='UTF-8'>
            <title>Registro exitoso</title>

            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #eeeeee;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: 100vh;
                    margin: 0;
                }

                .mensaje {
                    background-color: white;
                    padding: 50px;
                    border-radius: 15px;
                    text-align: center;
                    box-shadow: 0 5px 25px rgba(0,0,0,0.10);
                    max-width: 450px;
                }

                h1 {
                    color: #c8102e;
                    font-size: 30px;
                }

                p {
                    color: #666666;
                    font-size: 16px;
                    margin-bottom: 30px;
                }

                a {
                    display: inline-block;
                    background-color: #c8102e;
                    color: white;
                    padding: 14px 30px;
                    border-radius: 6px;
                    text-decoration: none;
                }

                a:hover {
                    background-color: #a50d26;
                }
            </style>
        </head>

        <body>
            <div class='mensaje'>
                <h1>¡Bienvenido a FERA MOTORS!</h1>
                <p>Tu cuenta fue creada correctamente. ¡Ya podés disfrutar de nuestra plataforma!</p>
                <a href='../index.html'>Ir al inicio</a>
            </div>
        </body>
        </html>
        ";

    } else {
        echo "Error al registrar el usuario.";
    }

}

?>
