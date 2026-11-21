<?php
// Barra de navegación: cambia según si hay sesión iniciada.
// Se incluye desde index.php, IniciarSesion.php, Registrarse.php, MiCuenta.php y EditarPerfil.php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$logueado     = isset($_SESSION["usuario_id"]);
$nombre       = $logueado ? ($_SESSION["nombre"] ?? "") : "";
$primerNombre = ($nombre !== "") ? explode(" ", $nombre)[0] : "Mi cuenta";
?>
<link rel="stylesheet" href="css/navbar.css">

<nav class="navbar navbar-expand-lg barra-principal">
    <div class="container-fluid">

        <a class="navbar-brand" href="index.php">FERA MOTORS</a>

        <div class="d-flex align-items-center ms-auto">

            <?php if ($logueado): ?>

                <div class="dropdown">
                    <button class="btn btn-perfil dropdown-toggle" type="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="icono-perfil">
                            <svg width="20" height="20" viewBox="0 0 16 16" fill="currentColor" aria-hidden="true">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                            </svg>
                        </span>
                        <span class="nombre-perfil"><?php echo htmlspecialchars($primerNombre); ?></span>
                    </button>

                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="MiCuenta.php">Mi cuenta</a></li>
                        <li><a class="dropdown-item" href="EditarPerfil.php">Editar perfil</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="php/logout.php">Cerrar sesión</a></li>
                    </ul>
                </div>

            <?php else: ?>

                <a class="nav-link-auth" href="IniciarSesion.php">Iniciar sesión</a>
                <a class="btn-registro" href="Registrarse.php">Registrarse</a>

            <?php endif; ?>

        </div>
    </div>
</nav>