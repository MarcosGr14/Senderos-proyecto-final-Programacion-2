<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Senderos - Acceso y Registro</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

    <header class="header-fijo" style="background-color: var(--color-oscuro);">
        <div class="contenedor-logo">
            <img src="../img/logo.png" alt="Logo de Senderos" class="logo-img">
            <h1>Senderos</h1>
        </div>
        
        <button class="btn-menu" id="btn-menu" aria-label="Abrir Menú">
            <span class="linea"></span>
            <span class="linea"></span>
            <span class="linea"></span>
        </button>

        <div class="overlay-menu" id="overlay"></div>

        <nav class="menu-lateral" id="menu-lateral">
            <button class="btn-cerrar" id="btn-cerrar" aria-label="Cerrar Menú">&times;</button>
            <div class="cabecera-menu">
                <img src="../img/logo.png" alt="Logo">
                <div>
                    <h3>Senderos</h3>
                    <span>Portal Administrativo</span>
                </div>
            </div>
            <ul>
                <li class="titulo-menu">Principal</li>
                <li><a href="../index.html"><span class="icono">🏠</span> Inicio</a></li>
                <li><a href="dashboard_visitante.html"><span class="icono">🗺️</span> Catálogo de Senderos</a></li>
                <li><a href="historial_visitante.html"><span class="icono">🎒</span> Mis Visitas</a></li>
                <li class="titulo-menu">Cuenta</li>
                <li><a href="login.jsp" class="activo"><span class="icono">👤</span> Iniciar Sesión</a></li>
            </ul>
        </nav>
    </header>

    <main style="max-width: 600px; margin: 120px auto 60px; padding: 0 20px; width: 100%;">
        
        <div id="contenedor-login">
            <h2 class="titulo-seccion" style="text-align: left; margin-bottom: 20px;">Iniciar Sesión</h2>
            
            <form action="ControladorLogin" method="POST">
                <label for="correo_login"><strong>Correo Electrónico:</strong></label><br>
                <input type="email" id="correo_login" name="correo_login" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <label for="clave_login"><strong>Contraseña:</strong></label><br>
                <input type="password" id="clave_login" name="clave_login" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <button type="submit" style="background-color: var(--color-primario); color: white; padding: 12px 25px; border: none; border-radius: 8px; cursor: pointer; font-weight: bold; width: 100%;">Entrar</button>
            </form>
        </div>

        <hr style="margin: 40px 0; border: 0; border-top: 2px dashed #ccc;">

        <div id="contenedor-registro">
            <h2 class="titulo-seccion" style="text-align: left; margin-bottom: 20px; font-size: 26px;">¿No tiene cuenta? Regístrese</h2>
            
            <form action="ControladorRegistro" method="POST">
                
                <label for="nombre"><strong>Nombre:</strong></label><br>
                <input type="text" id="nombre" name="nombre" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <label for="apellido"><strong>Apellido:</strong></label><br>
                <input type="text" id="apellido" name="apellido" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <label for="cedula"><strong>Cédula:</strong></label><br>
                <input type="text" id="cedula" name="cedula" placeholder="Ej. 8-000-0000" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <label for="fecha_nacimiento"><strong>Fecha de Nacimiento:</strong></label><br>
                <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <label><strong>Sexo:</strong></label><br>
                <div style="margin-top: 5px; margin-bottom: 20px;">
                    <input type="radio" id="sexo_m" name="sexo" value="Masculino" required> 
                    <label for="sexo_m" style="margin-right: 20px;">Masculino</label>
                    
                    <input type="radio" id="sexo_f" name="sexo" value="Femenino" required> 
                    <label for="sexo_f">Femenino</label>
                </div>

                <label for="correo_registro"><strong>Correo Electrónico:</strong></label><br>
                <input type="email" id="correo_registro" name="correo_registro" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <label for="clave_registro"><strong>Cree una Contraseña:</strong></label><br>
                <input type="password" id="clave_registro" name="clave_registro" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <label><strong>¿Presenta alguna discapacidad?</strong></label><br>
                <div style="margin-top: 5px; margin-bottom: 20px;">
                    <input type="radio" id="disc_si" name="tiene_discapacidad" value="si" onclick="manejarDiscapacidad(true)" required>
                    <label for="disc_si" style="margin-right: 20px;">Sí</label>
                    
                    <input type="radio" id="disc_no" name="tiene_discapacidad" value="no" onclick="manejarDiscapacidad(false)" required>
                    <label for="disc_no">No</label>
                </div>

                <div id="caja_oculta_discapacidad" style="display: none; background-color: #f9f9f9; padding: 15px; border-left: 4px solid var(--color-tierra); margin-bottom: 20px;">
                    <label for="detalle_discapacidad"><strong>Especifique cuál discapacidad:</strong></label><br>
                    <input type="text" id="detalle_discapacidad" name="detalle_discapacidad" style="width: 100%; padding: 10px; margin-top: 5px;">
                </div>

                <button type="submit" style="background-color: var(--color-tierra); color: white; padding: 12px 25px; border: none; border-radius: 8px; cursor: pointer; font-weight: bold; width: 100%;">Enviar Información de Registro</button>

            </form>
        </div>
    </main>

    <footer class="pie-pagina">
        <div class="contenido-footer">
            <nav class="menu-footer">
                <ul>
                    <li><a href="/HTML/index.html">Inicio</a></li>
                    <li><a href="dashboard_visitante.html">Catálogo de Senderos</a></li>
                    <li><a href="historial_visitante.html">Mis Visitas</a></li>
                    <li><a href="/JSP/login.jsp">Iniciar Sesión</a></li>
                </ul>
            </nav>
            <p>&copy; 2026 Sistema de Gestión de Reservas Naturales y Senderos. Todos los derechos reservados.</p>
            <div class="enlaces-footer">
                <a href="#">Políticas de Privacidad</a> | <a href="#">Términos y Condiciones</a>
            </div>
        </div>
    </footer>

    <script>
        // SCRIPT DEL MENÚ HAMBURGUESA
        const btnMenu = document.getElementById('btn-menu');
        const btnCerrar = document.getElementById('btn-cerrar');
        const menuLateral = document.getElementById('menu-lateral');
        const overlay = document.getElementById('overlay');

        function alternarMenu() {
            menuLateral.classList.toggle('activo');
            overlay.classList.toggle('activo');
        }

        btnMenu.addEventListener('click', alternarMenu);
        btnCerrar.addEventListener('click', alternarMenu);
        overlay.addEventListener('click', alternarMenu);

        // SCRIPT DE LA DISCAPACIDAD
        function manejarDiscapacidad(tieneDiscapacidad) {
            const caja = document.getElementById('caja_oculta_discapacidad');
            const inputDetalle = document.getElementById('detalle_discapacidad');

            if (tieneDiscapacidad) {
                caja.style.display = 'block';
                inputDetalle.required = true;
            } else {
                caja.style.display = 'none';
                inputDetalle.required = false;
                inputDetalle.value = '';
            }
        }
    </script>
</body>
</html>