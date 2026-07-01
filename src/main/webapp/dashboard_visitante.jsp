<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	//Sesion activa para que salga el nombre del usuario arriba
    String nombreUsuario = (String) session.getAttribute("usuario");
    boolean sesionIniciada = (nombreUsuario != null);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Senderos - Catálogo de Recorridos</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <!-- Iconos de Fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

	<!-- Parte superior, Logo, Nombre, Menu -->
    <header class="header-fijo">
        <div class="contenedor-logo">
            <a href="index.jsp">
                <img src="img/logo-sendavivaof.png" alt="Logo SendaViva" class="logo-oficial">
            </a>
            <h1>
                <a href="index.jsp" style="text-decoration: none; color: inherit;">SendaViva</a>
            </h1>
        </div>
      
       <!-- Acciones -->
        <div class="contenedor-acciones">
        	<!-- Iconos de redes sociales traidos -->
            <div class="redes-sociales">
                <a href="#" title="Escríbenos en WhatsApp"><i class="fab fa-whatsapp"></i></a>
                <a href="#" title="Síguenos en Instagram"><i class="fab fa-instagram"></i></a>
            </div>
          	
          	<!-- Logica para que salga el nombre de usuario en vez de entrar si la sesion esta activa -->
            <% if (sesionIniciada) { %>
                <a href="#" class="btn-login-header" style="cursor: default;">
                    <i class="fas fa-user-circle"></i> <%= nombreUsuario %>
                </a>
            <% } else { %>
                <a href="jsp/login.jsp" class="btn-login-header">
                    <i class="fas fa-user-circle"></i> Entrar
                </a>
            <% } %>
			
			<!-- Icono de busqueda, caja de texto y busqueda en Google -->
            <form action="https://www.google.com/search" method="GET" target="_blank" class="form-busqueda">
                <input type="text" name="q" placeholder="Buscar..." class="input-busqueda" required>
                <button type="submit" class="btn-busqueda" title="Buscar en Google">
                    <i class="fas fa-search"></i>
                </button>
            </form>
			
			<!-- Menu de navegacion 3 lineas -->
            <button class="btn-menu" id="btn-menu" aria-label="Abrir Menú">
                <span class="linea"></span>
                <span class="linea"></span>
                <span class="linea"></span>
            </button>
        </div>
		
		<!-- Capa oscura de fondo al abrir el menú -->
        <div class="overlay-menu" id="overlay"></div>
        
        <!-- Menú de Navegacion Lateral -->
        <nav class="menu-lateral" id="menu-lateral">
            <button class="btn-cerrar" id="btn-cerrar" aria-label="Cerrar Menú">&times;</button>
            <div class="cabecera-menu">
                <img src="img/logo-sendavivaof.png" alt="Logo">
                <div>
                    <h3>SendaViva</h3>
                    <span>Portal Administrativo</span>
                </div>
            </div>
            
            <!-- Lista de todas las paginas que se pueden acceder en este manu de navegacion -->
            <ul>
                <li class="titulo-menu">Principal</li>
                <li><a href="index.jsp"><span class="icono">🏠</span> Inicio</a></li>
                <li><a href="dashboard_visitante.jsp" class="activo"><span class="icono">🗺️</span> Catálogo de Senderos</a></li>
                <li><a href="historial_visitante.jsp"><span class="icono">🎒</span> Mis Visitas</a></li>
                <li class="titulo-menu">Nosotros</li>
                <li><a href="sobre_nosotros.jsp"><span class="icono">👨‍💻</span> El Equipo</a></li>
                
                <!-- Logica de cambiar el iniciar sesion a un Hola User -->
                <li class="titulo-menu">Cuenta</li>
                <% if (sesionIniciada) { %>
                    <li style="padding: 10px 20px; color: var(--color-primario); font-weight: bold;">
                        <span class="icono">👋</span> Hola, <%= nombreUsuario %>
                    </li>
                    <li><a href="jsp/logout.jsp" style="color: #e74c3c;"><span class="icono">🚪</span> Cerrar Sesión</a></li>
                <% } else { %>
                    <li><a href="jsp/login.jsp"><span class="icono">👤</span> Iniciar Sesión</a></li>
                <% } %>
            </ul>
        </nav>
    </header>

	<!-- Contendido -->
    <main class="contenedor-catalogo">
        <h2 class="titulo-seccion">Catálogo de Senderos Disponibles</h2>
        <p style="text-align: center; color: #666; margin-bottom: 40px;">Explore nuestras rutas naturales y reserve su próxima aventura.</p>
        <div class="grid-catalogo">
            
            <!-- Contenedor de Senderos: Primer Sendero -->
            <article class="tarjeta-sendero">
                <img src="img/momotides.avif" alt="Sendero Momótides" class="img-sendero">
                <div class="contenido-sendero">
                    <h3>Sendero Momótides: La Selva a tu Alcance</h3>
                    <ul class="lista-datos">
                        <li>📍 <strong>Ubicación:</strong> P. N. Metropolitano</li>
                        <li>📏 <strong>Distancia:</strong> 1 km (0,62 millas)</li>
                        <li>⏱️ <strong>Duración Aprox:</strong> 45 minutos</li>
                        <li>🟢 <strong>Dificultad:</strong> Baja</li>
                    </ul>
                    <!-- Caja de horarios -->
                    <div class="horarios-caja">
                        <strong>Horarios Disponibles:</strong>
                        Lunes a Viernes: 8:00 AM - 2:00 PM<br>
                        Fines de Semana: 7:00 AM - 3:00 PM
                    </div>
                    <!-- Boton de reserva que lleva a la pagina de reservas -->
                    <a href="jsp/reservar.jsp?sendero=Momotides" class="btn-reserva">Reservar Ahora</a>
                </div>
            </article>
			
			<!-- Contenedor de Senderos: Segundo Sendero -->
            <article class="tarjeta-sendero">
                <img src="img/caobos.jpg" alt="Circuito Los Caobos" class="img-sendero">
                <div class="contenido-sendero">
                    <h3>Circuito Los Caobos - El Roble</h3><br>
                    <ul class="lista-datos">
                        <li>📍 <strong>Ubicación:</strong> P. N. Metropolitano</li>
                        <li>📏 <strong>Distancia:</strong> 1.45 km (0,9 millas)</li>
                        <li>⏱️ <strong>Duración Aprox:</strong> 1 hora</li>
                        <li>🟡 <strong>Dificultad:</strong> Moderada</li>
                    </ul>
                    <!-- Caja de horarios -->
                    <div class="horarios-caja">
                        <strong>Horarios Disponibles:</strong>
                        Lunes a Viernes: 8:00 AM - 2:00 PM<br>
                        Fines de Semana: 7:00 AM - 3:00 PM
                    </div>
                    <!-- Boton de reserva que lleva a la pagina de reservas -->
                    <a href="jsp/reservar.jsp?sendero=Caobos" class="btn-reserva">Reservar Ahora</a>
                </div>
            </article>
			
			<!-- Contenedor de Senderos: Tercer Sendero -->
            <article class="tarjeta-sendero">
                <img src="img/cieneguita.jpg" alt ="Circuito la Cieneguita" class="img-sendero">
                <div class="contenido-sendero">
                    <h3>Circuito la Cienaguita: Mirador de 360º</h3>
                    <ul class="lista-datos">
                        <li>📍 <strong>Ubicación:</strong> P. N. Metropolitano</li>
                        <li>📏 <strong>Distancia:</strong> 2.8 km (1,74 millas)</li>
                        <li>⏱️ <strong>Duración Aprox:</strong> 2 horas</li>
                        <li>🟡 <strong>Dificultad:</strong> Moderada</li>
                    </ul>
                    <!-- Caja de horarios -->
                    <div class="horarios-caja">
                        <strong>Horarios Disponibles:</strong>
                        Lunes a Viernes: 8:00 AM - 1:00 PM<br>
                        Fines de Semana: 7:00 AM - 2:00 PM
                    </div>
                    <!-- Boton de reserva que lleva a la pagina de reservas -->
                    <a href="jsp/reservar.jsp?sendero=Cieneguita" class="btn-reserva">Reservar Ahora</a>
                </div>
            </article>
            
            <!-- Contenedor de Senderos: Cuarto Sendero -->
            <article class="tarjeta-sendero">
                <img src="img/ancon.jpg" alt ="Sendero del Cerro Ancon" class="img-sendero">
                <div class="contenido-sendero">
                    <h3>Sendero del Cerro Ancón: El Icónico</h3>
                    <ul class="lista-datos">
                        <li>📍 <strong>Ubicación:</strong> Corregimiento de Ancón</li>
                        <li>📏 <strong>Distancia:</strong> 2 km (1,24 millas)</li>
                        <li>⏱️ <strong>Duración Aprox:</strong> 1.5 horas</li>
                        <li>🟢 <strong>Dificultad:</strong> Baja</li>
                    </ul>
                    <!-- Caja de horarios -->
                    <div class="horarios-caja">
                        <strong>Horarios Disponibles:</strong>
                        Lunes a Domingo: 6:00 AM - 4:00 PM<br>
                        (Acceso libre condicionado)
                    </div>
                    <!-- Boton de reserva que lleva a la pagina de reservas -->
                    <a href="jsp/reservar.jsp?sendero=Ancon" class="btn-reserva">Reservar Ahora</a>
                </div>
            </article>
			
			<!-- Contenedor de Senderos: Quinto Sendero -->
            <article class="tarjeta-sendero">
                <img src="img/camino.jpg" alt ="Camino del Oleoducto" class="img-sendero">
                <div class="contenido-sendero">
                    <h3>Camino del Oleoducto (Pipeline Road)</h3>
                    <ul class="lista-datos">
                        <li>📍 <strong>Ubicación:</strong> P. N. Soberanía</li>
                        <li>📏 <strong>Distancia:</strong> 23 km (14.29 millas)</li>
                        <li>⏱️ <strong>Duración Aprox:</strong> 4 a 6 horas</li>
                        <li>🔴 <strong>Dificultad:</strong> De Baja a Alta</li>
                    </ul>
                    <!-- Caja de horarios -->
                    <div class="horarios-caja">
                        <strong>Horarios Disponibles:</strong>
                        Lunes a Domingo: 6:00 AM - 4:00 PM<br>
                        (Ideal para observación de aves temprano)
                    </div>
                    <!-- Boton de reserva que lleva a la pagina de reservas -->
                    <a href="jsp/reservar.jsp?sendero=Oleoducto" class="btn-reserva">Reservar Ahora</a>
                </div>
            </article>
			
			<!-- Contenedor igual que los senderos, pero con proximamente mas senderos disponibles -->
            <article class="tarjeta-sendero tarjeta-proximamente">
                <div class="contenido-proximamente">
                    <h3>¡Próximamente!</h3>
                    <p>Nuevos senderos por descubrir en nuestra próxima actualización</p>
                    <i class="fas fa-map-signs icono-proximamente"></i>
                </div>
            </article>
        </div>
    </main>
	
	<!-- Footer-->
    <footer class="pie-pagina">
        <div class="contenido-footer">
         <!-- Menu de navegacion en el footer -->
            <nav class="menu-footer">
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="dashboard_visitante.jsp">Catálogo de Senderos</a></li>
                    <li><a href="historial_visitante.jsp">Mis Visitas</a></li>
                    <li><a href="sobre_nosotros.jsp">Contáctanos</a></li>
                    
                    <!-- Logica para la sesion activa cambiar el Iniciar sesion a Cerrar sesion -->
                    <% if (sesionIniciada) { %>
                        <li><a href="jsp/logout.jsp" style="color: #e74c3c; font-weight: 600;"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
                    <% } else { %>
                        <li><a href="jsp/login.jsp">Iniciar Sesión</a></li>
                    <% } %>
                </ul>
            </nav>
            
            <!-- Copyright -->
            <p>&copy; 2026 SendaViva - Gestión de Reservas Naturales. Todos los derechos reservados.</p>
            <div class="enlaces-footer">
                <a href="#">Políticas de Privacidad</a> | <a href="#">Términos y Condiciones</a>
            </div>
        </div>
    </footer>
	
	<!-- JS PARA EL MENÚ HAMBURGUESA -->
    <script>
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
    </script>
</body>
</html>