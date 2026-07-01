<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Sesion activa para que salga el nombre del usuario arriba
    String nombreUsuario = (String) session.getAttribute("usuario");
    boolean sesionIniciada = (nombreUsuario != null);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Senderos - Inicio y Noticias</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <!-- Iconos de Fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

    <!-- Parte superior, Logo, Nombre, Menu -->
 	<header class="header-fijo">
        <div class="contenedor-logo">
            <a href="index.html">
                <img src="img/logo-sendavivaof.png" alt="Logo SendaViva" class="logo-oficial">
            </a>
            <h1>
                <a href="index.html" style="text-decoration: none; color: inherit;">SendaViva</a>
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
            <button class="btn-cerrar" id="btn-cerrar" aria-label="Cerrar Menu">&times;</button>
            
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
                <li><a href="dashboard_visitante.jsp"><span class="icono">🗺️</span> Catálogo de Senderos</a></li>
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

    <!-- Banner de inicio con imagen-->
    <section class="hero">
        <div class="contenido-hero">
            <h2>Bienvenido a la Naturaleza y Senderos de Panamá</h2>
            <p>Descubre, explora y conecta con las reservas naturales más impresionantes. Reserva tu recorrido guiado y vive la experiencia.</p>
        </div>
        
        <!-- Flecha deslizable -->
        <a href="#contenido-principal" class="scroll-down" style="display: flex; flex-direction: column; align-items: center; gap: 5px; text-decoration: none;">
            <span>Ver Noticias y Boletín</span>
            <i style="display: inline-block; transform: rotate(45deg); border-right: 2px solid currentColor; border-bottom: 2px solid currentColor; width: 12px; height: 12px; margin-top: 5px;"></i>
        </a>
    </section>

    <!-- Contenido-->
    <main class="contenedor-principal" id="contenido-principal">
        
        <!-- COLUMNA IZQUIERDA: Senderos, distancia y reservar-->
        <aside class="sidebar-senderos">
            <div class="banner-publicidad">
                <h3>¡Reserva tu recorrido ya!</h3>
            </div>
            <!-- Breve invitacion a reservar los senderos disponibles -->
            <ul class="lista-senderos">
            	<!-- Primer sendero -->
                <li>
                    <strong>Sendero Momótides: la Selva a tu Alcance </strong>
                    <span>Lugar: Parque Natural Metropolitano.
                            Distancia: 1 km (0,62 millas).<br>
                            Dificultad: baja.
                    </span>
                </li>
                
                <!-- Segundo sendero -->
                <li>
                    <strong>Circuito Los Caobos - El Roble: en Medio de Gigantes</strong>
                    <span>Lugar: Parque Natural Metropolitano.
                            Distancia: 1,45 km (0,9 millas).<br>
                            Dificultad: moderada.</span>
                </li>
                
                <!-- Tercer sendero -->
                <li>
                    <strong>Circuito la Cienaguita - Mirador y Cerro Cedro: Mirador de 360º</strong>
                    <span>Lugar: Parque Natural Metropolitano.
                            Distancia: 2,8 km (1,74 millas).<br>
                            Dificultad: moderada.
                    </span>
                </li>
                
                <!-- Cuarto sendero -->
                <li>
                    <strong>Sendero del Cerro Ancón: el Icónico</strong>
                    <span>Lugar: Corregimiento de Ancón.
                            Distancia: 2 km (1,24 millas).<br>
                            Dificultad: baja.
                    </span>
                </li>
                
                <!-- Quinto sendero -->
                <li>
                    <strong>Camino del Oleoducto o Pipeline Road</strong>
                    <span>Lugar: Parque Nacional Soberanía.
                            Distancia: 23 km (14.29 millas). <br>
                            Dificultad: de baja a alta.
                    </span>
                </li>
            </ul>
			
			<!-- Boton de reserva para ir a la pagina de realizar reservas -->
            <a href="dashboard_visitante.html" class="btn-reservar-sidebar">Ver Disponibilidad</a>
        </aside>

        <!-- Contenido principal de la pagina: Noticias -->
        <section class="seccion-noticias">
            <h2 class="titulo-seccion">Boletín y Noticias Destacadas</h2>

            <div class="grid-noticias">
            <!-- Noticia 1 -->
                <article class="tarjeta">
                    <img src="img/ave.jpg" alt="Aves">
                    <div class="contenido-tarjeta">
                        <span class="etiqueta">Observación</span>
                        <h3>Panamá celebró este sábado el Global Big Day</h3>
                        <p>Cientos de observadores recorrieron parques, bosques y comunidades rurales, reafirmando al país como destino imprescindible para la observación de aves.</p>
                        <a href="https://www.prensa.com/" target="_blank" class="enlace-fuente">Leer noticia completa</a>
                    </div>
                </article>
                
			<!-- Noticia 2 -->
                <article class="tarjeta">
                    <img src="img/ambiente.webp" alt="Grupo de senderistas">
                    <div class="contenido-tarjeta">
                        <span class="etiqueta">Conservación</span>
                        <h3>"Pacto de Panamá con la Naturaleza"</h3>
                        <p>El Ministerio de Ambiente iniciÃ³ el proceso de consulta pública para el documento borrador. La iniciativa busca la participación ciudadana.</p>
                        <a href="https://www.tvn-2.com/" target="_blank" class="enlace-fuente">Leer noticia completa â</a>
                    </div>
                </article>
                
				<!-- Noticia 3 Video-->
                <article class="tarjeta">
                <video src="img/naturaleza.mp4" title="La Naturaleza Nos Habla" controls style="width: 100%; height: 230px; object-fit: cover; border-bottom: 5px solid var(--color-tierra);"></video>
                    <div class="contenido-tarjeta">
                        <span class="etiqueta video">Video</span>
                        <h3>La Naturaleza Nos Habla | Salma Hayek</h3>
                        <p>Artistas unieron esfuerzos para darle una voz a la naturaleza y concientizar sobre la conservación de nuestros ecosistemas.</p>
                        <a href="https://www.youtube.com/watch?v=wTkMFSgqi1I" target="_blank" class="enlace-fuente">Descubre más</a>
                    </div>
                </article>
            </div>
            
            <!--Horario de atencion-->
             <div class="horario-banner">
                <div class="horario-titulo">
                    <h4>Horario de Atencion</h4>
                    <span class="nota">Ultimo ingreso 2 horas antes del cierre.</span>
                </div>
                
                <!-- Caja de horario de atencion -->
                <div class="horario-dias">
                    <div class="dia">
                        <strong>Lunes - Viernes</strong>
                        <span>8:00 AM - 4:00 PM</span>
                    </div>
                    <div class="dia">
                        <strong>Sabados - Domingos</strong>
                        <span>7:00 AM - 5:00 PM</span>
                    </div>
                </div>
            </div>
        </section>
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
                <a href="#">Políticas de Privacidad</a> | <a href="#">Trminos y Condiciones</a>
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