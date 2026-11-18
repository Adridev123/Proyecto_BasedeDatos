
<?php

session_start();

include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $usuario = $_POST["usuario"];
    $password = $_POST["password"];

    $consulta = "SELECT * FROM usuarios WHERE usuario = ?";
    $resultado = mysqli_prepare($conexion, $consulta);

    mysqli_stmt_bind_param($resultado, "s", $usuario);
    mysqli_stmt_execute($resultado);

    $datos = mysqli_stmt_get_result($resultado);

    if (mysqli_num_rows($datos) == 1) {

        $fila = mysqli_fetch_assoc($datos);

        if (password_verify($password, $fila["password"])) {

$_SESSION["usuario_id"] = $fila["id"];
$_SESSION["usuario"] = $fila["usuario"];
$_SESSION["nombre"] = $fila["nombre"];

echo "
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='refresh' content='3;url=../index.html'>
    <title>Bienvenido</title>

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
        }
    </style>
</head>

<body>
    <div class='mensaje'>
        <h1>¡Bienvenido a FERA MOTORS!</h1>
        <p>Hola, " . htmlspecialchars($fila["nombre"]) . ".</p>
        <p>Ingresaste correctamente. ¡Disfrutá de nuestra plataforma!</p>
        <p>En unos segundos vas a ingresar al inicio.</p>
    </div>
</body>
</html>
";

exit();


        } else {
            echo "Contraseña incorrecta.";
        }

    } else {
        echo "El usuario no existe.";
    }

}

?>
