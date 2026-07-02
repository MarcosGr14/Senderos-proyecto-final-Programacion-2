<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<%
    // SEGURIDAD EXTREMA: Bloqueo de página seguro
    Object usuarioObj = session.getAttribute("id_usuario");
    Object rolObj = session.getAttribute("id_rol");

    // Si no hay usuario, O si no hay rol guardado, O si el rol NO es 1 (Admin), lo expulsamos.
    if (usuarioObj == null || rolObj == null || !"1".equals(rolObj.toString())) {
        response.sendRedirect("jsp/login.jsp");
        return;
    }

    String nombreUsuario = (String) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Operativo - SendaViva</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<!-- Parte superior, Logo, Nombre, Menu (VERSIÓN ADMIN) -->
 	<header class="header-fijo">
        <div class="contenedor-logo">
            <a href="dashboard_admin.jsp">
                <img src="img/logo-sendavivaof.png" alt="Logo SendaViva" class="logo-oficial">
            </a>
            <h1>
                <a href="dashboard_admin.jsp" style="text-decoration: none; color: inherit;">SendaViva Admin</a>
            </h1>
        </div>
        
        <!-- Acciones -->
  		 <div class="contenedor-acciones">
            
            <!-- Como en esta página SIEMPRE hay sesión activa (por el bloqueo de arriba), 
                 mostramos directamente el nombre con un escudo de Admin -->
            <a href="#" class="btn-login-header" style="cursor: default; background-color: #2c3e50; color: white;">
                <i class="fas fa-user-shield"></i> <%= nombreUsuario %>
            </a>
            
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
            
            <!-- Cabecera del menú con tonos oscuros para diferenciarlo del panel de clientes -->
            <div class="cabecera-menu" style="background-color: #1a252f; border-bottom: 3px solid #2ecc71;">
                <img src="img/logo-sendavivaof.png" alt="Logo">
                <div>
                    <h3 style="color: #2ecc71;">SendaViva</h3>
                    <span style="color: white;">Portal Administrativo</span>
                </div>
            </div>
			
		    <!-- Lista de páginas exclusivas para el Trabajador / Admin -->
            <ul>
                <li class="titulo-menu">Gestión Operativa</li>
                <li><a href="dashboard_admin.jsp"><span class="icono">📋</span> Dashboard Principal</a></li>
                <li><a href="#"><span class="icono">📈</span> Estadísticas (Próximamente)</a></li>
                
                <li class="titulo-menu">Sitio Público</li>
                <li><a href="index.jsp" target="_blank"><span class="icono">🌍</span> Ver Página Principal</a></li>
                
                <!-- Opciones de la cuenta del Admin -->
                <li class="titulo-menu">Cuenta</li>
                <li style="padding: 10px 20px; color: #2c3e50; font-weight: bold;">
                    <span class="icono">🛡️</span> Hola, <%= nombreUsuario %>
                </li>
                <li><a href="jsp/logout.jsp" style="color: #e74c3c;"><span class="icono">🚪</span> Cerrar Sesión</a></li>
            </ul>
        </nav>
    </header>

    <!-- CONTENEDOR PRINCIPAL DEL DASHBOARD -->
    <main class="contenedor-dashboard">
        
        <div class="card">
            
            <!-- NAVEGACIÓN DE LAS PESTAÑAS -->
            <div class="tabs-header">
                <button class="tab-btn activo" onclick="abrirTab(event, 'tab-boletin')">
                    <i class="fas fa-bullhorn"></i> Boletín
                </button>
                <button class="tab-btn" onclick="abrirTab(event, 'tab-tareas')">
                    <i class="fas fa-tasks"></i> Objetivos Mensuales
                </button>
                <button class="tab-btn" onclick="abrirTab(event, 'tab-guias')">
                    <i class="fas fa-users"></i> Turnos de Guías
                </button>
            </div>

            <!-- CONTENIDO 1: BOLETÍN (Visible por defecto) -->
            <div id="tab-boletin" class="tab-content activo">
            
            	<!-- Noticia 1 -->
                <div class="noticia">
                    <img src="https://images.unsplash.com/photo-1448375240586-882707db888b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Mantenimiento">
                    <div>
                        <h4>Mantenimiento en Sendero Momótides</h4>
                        <p>Cierre parcial este viernes por trabajos de poda y limpieza de escombros en el kilómetro 2. Favor informar a los visitantes.</p>
                        <span class="fecha-noticia"><i class="far fa-clock"></i> Publicado: Hace 2 horas por Gerencia</span>
                    </div>
                </div>
                
                <!-- Noticia 2 -->
                <div class="noticia">
                    <img src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Clima">
                    <div>
                        <h4>Alerta Meteorológica: Lluvias Fuertes</h4>
                        <p>Se esperan tormentas eléctricas para el fin de semana. Protocolo de evacuación rápida activado para el Circuito Los Caobos.</p>
                        <span class="fecha-noticia"><i class="far fa-clock"></i> Publicado: Ayer por Seguridad</span>
                    </div>
                </div>
                
                <!-- Noticia 3 -->
                <div class="noticia">
                    <img src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Clima">
                    <div>
                        <h4>Alerta Meteorológica: Lluvias Fuertes</h4>
                        <p>Se esperan tormentas eléctricas para el fin de semana. Protocolo de evacuación rápida activado para el Circuito Los Caobos.</p>
                        <span class="fecha-noticia"><i class="far fa-clock"></i> Publicado: Ayer por Seguridad</span>
                    </div>
                </div>
            </div>

            <!-- CONTENIDO 2: TAREAS -->
            <div id="tab-tareas" class="tab-content">
                <ul class="lista-tareas">
                    <li><input type="checkbox"> <span>Revisión de botiquines.</span></li>
                    <li><input type="checkbox"> <span>Actualización de mapas GPS.</span></li>
                    <li><input type="checkbox"> <span class="tarea-urgente">Reparar barandal en La Cienaguita.</span></li>
                    <li><input type="checkbox"> <span>Inventario de radios de comunicación.</span></li>
                    <li><input type="checkbox"> <span>Reunión de staff mensual (Viernes 4PM).</span></li>
                    <li><input type="checkbox"> <span>Limpieza profunda zona de camping.</span></li>
                </ul>
            </div>

            <!-- CONTENIDO 3: GUÍAS -->
            <div id="tab-guias" class="tab-content">
                <table class="tabla-guias">
                    <thead>
                        <tr>
                            <th>Guía Asignado</th>
                            <th>Sendero / Ruta</th>
                            <th>Día</th>
                            <th>Fecha</th>
                            <th>Turno</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    
                    <!-- Guias turisticas y sus horarios -->
                    <tbody>
                    	<!-- Guia 1 -->
                        <tr>
                            <td><strong>Carlos Mendoza</strong></td>
                            <td>Circuito Los Caobos</td>
                            <td><span class="tag-dia">Lunes</span></td>
                            <td>2026-07-06</td>
                            <td>08:00 AM - 02:00 PM</td>
                            <td style="color: #2ecc71; font-weight: bold;"><i class="fas fa-check-circle"></i> Confirmado</td>
                        </tr>
                        <!-- Guia 2 -->
                        <tr>
                            <td><strong>Ana Patricia Ríos</strong></td>
                            <td>Sendero Momótides</td>
                            <td><span class="tag-dia">Martes</span></td>
                            <td>2026-07-07</td>
                            <td>06:00 AM - 12:00 PM</td>
                            <td style="color: #2ecc71; font-weight: bold;"><i class="fas fa-check-circle"></i> Confirmado</td>
                        </tr>
                        <!-- Guia 3 -->
                        <tr>
                            <td><strong>Miguel Lopez</strong></td>
                            <td>Sendero de Cerro Ancon</td>
                            <td><span class="tag-dia">Miercoles</span></td>
                            <td>2026-07-07</td>
                            <td>06:00 AM - 12:00 PM</td>
                            <td style="color: #2ecc71; font-weight: bold;"><i class="fas fa-check-circle"></i> Confirmado</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div> 
    </main>
    
	<!-- Footer (Versión Administrativa) -->
    <footer class="pie-pagina">
        <div class="contenido-footer">
            <!-- Menu de navegacion interno en el footer -->
            <nav class="menu-footer">
                <ul>
                    <li><a href="dashboard_admin.jsp">Dashboard Operativo</a></li>
                    <li><a href="#">Estadísticas</a></li>
                    <li><a href="index.jsp" target="_blank">Ver Sitio Público</a></li>
                    <li><a href="sobre_nosotros.jsp">Contacto</a></li>
                    
                    <!-- Cerrar sesion permanente -->
                    <li><a href="jsp/logout.jsp" style="color: #e74c3c; font-weight: 600;"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
                </ul>
            </nav>
            
            <!-- Copyright Administrativo -->
            <p>&copy; 2026 SendaViva - Sistema de Administración Operativa. Todos los derechos reservados.</p>
            <div class="enlaces-footer">
                <a href="#">Manual del Sistema</a> | <a href="#">Políticas de Uso Interno</a>
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
        overlay.addEventListener('click', alternarMenu)

        function abrirTab(evento, idTab) {
            // 1. Ocultar todos los contenidos
            let contenidos = document.getElementsByClassName("tab-content");
            for (let i = 0; i < contenidos.length; i++) {
                contenidos[i].classList.remove("activo");
            }

            // 2. Quitarle el color verde "activo" a todos los botones
            let botones = document.getElementsByClassName("tab-btn");
            for (let i = 0; i < botones.length; i++) {
                botones[i].classList.remove("activo");
            }

            // 3. Mostrar el contenido seleccionado
            document.getElementById(idTab).classList.add("activo");
            evento.currentTarget.classList.add("activo");
        }
    </script>
</body>
</html>