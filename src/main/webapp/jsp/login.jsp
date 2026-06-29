<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Senderos - Acceso y Registro</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- Parte superior, Logo, Nombre, Menu -->
   <header class="header-fijo">
        <div class="contenedor-logo">
            <a href="index.html">
                <img src="../img/logo-sendavivaof.png" alt="Logo SendaViva" class="logo-oficial">
            </a>
            <h1>
                <a href="../index.html" style="text-decoration: none; color: inherit;">SendaViva</a>
            </h1>
        </div>
        
     	 <div class="contenedor-acciones">
            <!-- Iconos de redes sociales -->
            <div class="redes-sociales">
                <a href="#" title="Escríbenos en WhatsApp"><i class="fab fa-whatsapp"></i></a>
                <a href="#" title="Síguenos en Instagram"><i class="fab fa-instagram"></i></a>
            </div>
            
            
            <!-- Boton de busqueda -->
            <form action="https://www.google.com/search" method="GET" target="_blank" class="form-busqueda">
                <input type="text" name="q" placeholder="Buscar..." class="input-busqueda" required>
                <button type="submit" class="btn-busqueda" title="Buscar en Google">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            
            <!-- Botón de Hamburguesa (3 rayas) -->
            <button class="btn-menu" id="btn-menu" aria-label="Abrir Menú">
                <span class="linea"></span>
                <span class="linea"></span>
                <span class="linea"></span>
            </button>
        </div>
        
		<!-- Capa oscura de fondo al abrir el menú -->
        <div class="overlay-menu" id="overlay"></div>
        
		<!-- Menú de Navegación Lateral -->
        <nav class="menu-lateral" id="menu-lateral">
            <button class="btn-cerrar" id="btn-cerrar" aria-label="Cerrar Menú">&times;</button>
            <div class="cabecera-menu">
                <img src="../img/logo-sendavivaof.png" alt="Logo">
                <div>
                    <h3>SendaViva</h3>
                    <span>Portal Administrativo</span>
                </div>
            </div>
            <ul>
                <li class="titulo-menu">Principal</li>
                <li><a href="../index.html"><span class="icono">🏠</span> Inicio</a></li>
                <li><a href="dashboard_visitante.html"><span class="icono">🗺️</span> Catálogo de Senderos</a></li>
                <li><a href="historial_visitante.html"><span class="icono">🎒</span> Mis Visitas</a></li>
                <li class="titulo-menu">Nosotros</li>
                <li><a href="../sobre_nosotros.html"><span class="icono">👨‍💻</span> El Equipo</a></li>
                <li class="titulo-menu">Cuenta</li>
                <li><a href="login.jsp" class="activo"><span class="icono">👤</span> Iniciar Sesión</a></li>
                
            </ul>
        </nav>
    </header>
    
    <!-- Contenido Principal, Formulario -->
    <main style="max-width: 600px; margin: 120px auto 60px; padding: 0 20px; width: 100%;">
    
        <!-- Iniciar sesion -->
        <div id="contenedor-login">
            <h2 class="titulo-seccion" style="text-align: left; margin-bottom: 20px;">Iniciar Sesión</h2>
            
            <form action="ControladorLogin" method="POST">
                <label for="correo_login"><strong>Correo Electrónico:</strong></label><br>
                <input type="email" id="correo_login" name="correo_login" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <label for="clave_login"><strong>Contraseña:</strong></label><br>
                <input type="password" id="clave_login" name="clave_login" required style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 20px;">

                <button type="submit" style="background-color: var(--color-primario); color: white; padding: 12px 25px; border: none; border-radius: 8px; cursor: pointer; font-weight: bold; width: 100%;">Entrar</button>
            </form>

            <p style="text-align: center; margin-top: 25px; font-size: 14px;">
                ¿No está registrado? 
                <a href="javascript:void(0);" onclick="mostrarRegistro()" style="color: var(--color-tierra); font-weight: bold; text-decoration: none;">Regístrese aquí</a>
            </p>
        </div>
        
		<!-- Registrase -->
        <div id="contenedor-registro" style="display: none;">
            <h2 class="titulo-seccion" style="text-align: left; margin-bottom: 20px; font-size: 26px;">Crear una Cuenta</h2>
            
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

                <button type="submit" style="background-color: var(--color-tierra); color: white; padding: 12px 25px; border: none; border-radius: 8px; cursor: pointer; font-weight: bold; width: 100%;">Registrarme</button>

            </form>

            <p style="text-align: center; margin-top: 25px; font-size: 14px;">
                ¿Ya tiene una cuenta? 
                <a href="javascript:void(0);" onclick="mostrarLogin()" style="color: var(--color-tierra); font-weight: bold; text-decoration: none;">Inicie sesión aquí</a>
            </p>
        </div>
    </main>
    
	 <!-- Footer-->
     <footer class="pie-pagina">
        <div class="contenido-footer">
            <nav class="menu-footer">
                <ul>
                    <li><a href="../index.html">Inicio</a></li>
                    <li><a href="dashboard_visitante.html">Catálogo de Senderos</a></li>
                    <li><a href="historial_visitante.html">Mis Visitas</a></li>
                    <li><a href="../sobre_nosotros.html">Contactanos</a></li>
                    <li><a href="logout.jsp" style="color: #e74c3c; font-weight: 600;"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
                </ul>
            </nav>
            <!-- Copyright -->
            <p>&copy; 2026 SendaViva - Gestión de Reservas Naturales. Todos los derechos reservados.</p>
            <div class="enlaces-footer">
                <a href="#">Políticas de Privacidad</a> | <a href="#">Términos y Condiciones</a>
            </div>
        </div>
    </footer>
    
    <script>
    <!-- JS PARA EL MENÚ HAMBURGUESA -->
        const btnMenu = document.getElementById('btn-menu');
        const btnCerrar = document.getElementById('btn-cerrar');
        const menuLateral = document.getElementById('menu-lateral');
        const overlay = document.getElementById('overlay');
        
        // Función para abrir y cerrar el menú
        function alternarMenu() {
            menuLateral.classList.toggle('activo');
            overlay.classList.toggle('activo');
        }
        
     	// Eventos
        btnMenu.addEventListener('click', alternarMenu);
        btnCerrar.addEventListener('click', alternarMenu);
        overlay.addEventListener('click', alternarMenu);

        //Funcion para la seccion de discapacidad
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

      //Cambiar de Login a refistro
        function mostrarRegistro() {
            // Oculta el login y muestra el registro
            document.getElementById('contenedor-login').style.display = 'none';
            document.getElementById('contenedor-registro').style.display = 'block';
        }

        function mostrarLogin() {
            // Oculta el registro y muestra el login
            document.getElementById('contenedor-registro').style.display = 'none';
            document.getElementById('contenedor-login').style.display = 'block';
        }
    </script>
</body>
</html>