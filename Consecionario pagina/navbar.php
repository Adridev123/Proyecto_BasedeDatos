<?php
// Barra de navegación de Fera Motors (negra, sin buscador)
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$logueado = isset($_SESSION["usuario_id"]);
?>
<link rel="stylesheet" href="css/navbar.css">

<div class="fm-barra">

    <a href="index.php" class="fm-logo">FERA MOTORS</a>

    <nav class="fm-menu">

        <details class="fm-item">
            <summary>Modelos <span class="fm-flecha">▾</span></summary>
            <div class="fm-desplegable">
                <a href="corolla.html">Corolla</a>
                <a href="yaris.html">Yaris Hatchback</a>
            </div>
        </details>

        <details class="fm-item">
            <summary>Compra <span class="fm-flecha">▾</span></summary>
            <div class="fm-desplegable">
                <a href="#">Financiación</a>
                <a href="#">Usados</a>
            </div>
        </details>

        <details class="fm-item">
            <summary>Alquilá <span class="fm-flecha">▾</span></summary>
            <div class="fm-desplegable">
                <a href="#">Alquiler mensual</a>
                <a href="#">Alquiler corto plazo</a>
            </div>
        </details>

        <details class="fm-item">
            <summary>Mi Fera <span class="fm-flecha">▾</span></summary>
            <div class="fm-desplegable">
                <a href="#">Servicios</a>
                <a href="#">Garantía</a>
            </div>
        </details>

        <details class="fm-item">
            <summary>Descubrí <span class="fm-flecha">▾</span></summary>
            <div class="fm-desplegable">
                <a href="#">Novedades</a>
                <a href="#">Concesionarios</a>
            </div>
        </details>

        <details class="fm-item">
            <summary>Contactanos <span class="fm-flecha">▾</span></summary>
            <div class="fm-desplegable">
                <a href="#">Teléfono</a>
                <a href="#">Correo</a>
            </div>
        </details>

    </nav>

    <div class="fm-usuario-zona">
        <?php if ($logueado): ?>
            <!-- Ícono de usuario con menú -->
            <details class="fm-item fm-usuario">
                <summary class="fm-icono" aria-label="Mi cuenta">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round">
                        <circle cx="12" cy="8" r="4"/>
                        <path d="M4 21c0-4 3.6-7 8-7s8 3 8 7"/>
                    </svg>
                </summary>
                <div class="fm-desplegable fm-desplegable-derecha">
                    <a href="MiCuenta.php">Mi cuenta</a>
                    <a href="EditarPerfil.php">Editar perfil</a>
                    <a href="php/logout.php" class="fm-salir">Cerrar sesión</a>
                </div>
            </details>
        <?php else: ?>
            <a href="IniciarSesion.php" class="fm-icono" aria-label="Iniciar sesión">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round">
                    <circle cx="12" cy="8" r="4"/>
                    <path d="M4 21c0-4 3.6-7 8-7s8 3 8 7"/>
                </svg>
            </a>
        <?php endif; ?>
    </div>

</div>

<script>
    // Solo un menú abierto a la vez: al abrir uno, se cierran los demás
    document.querySelectorAll('.fm-barra details').forEach(function (menu) {
        menu.addEventListener('toggle', function () {
            if (menu.open) {
                document.querySelectorAll('.fm-barra details').forEach(function (otro) {
                    if (otro !== menu) otro.open = false;
                });
            }
        });
    });

    // Tocar cualquier parte de la página fuera de la barra cierra los menús
    document.addEventListener('click', function (e) {
        if (!e.target.closest('.fm-barra')) {
            document.querySelectorAll('.fm-barra details').forEach(function (menu) {
                menu.open = false;
            });
        }
    });
</script>