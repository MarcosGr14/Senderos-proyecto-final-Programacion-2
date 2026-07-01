<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	//Evalua si la sesion esta activa, si no te manda a Login
    if (session.getAttribute("id_usuario") == null) {
        response.sendRedirect("jsp/login.jsp");
        return;
    }

    String nombreUsuario = (String) session.getAttribute("usuario");
    String idUsuario = session.getAttribute("id_usuario").toString();
    boolean sesionIniciada = true;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Visitas - SendaViva</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <!-- Iconos de Fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
    
    	/*Estilo y colores para la tabla de futuras reservas*/
        .tabla-contenedor { max-width: 1000px; margin: 20px auto 40px auto; background: white; padding: 25px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .tabla-reservas { width: 100%; border-collapse: collapse; margin-top: 15px; }
        .tabla-reservas th { padding: 15px; text-align: left; color: white; }
        .tabla-reservas td { padding: 15px; border-bottom: 1px solid #eee; color: #555; }
        .tabla-reservas tr:hover { background-color: #f9f9f9; }
        .mensaje-vacio { text-align: center; padding: 30px; color: #888; font-size: 1.1em; }
        
        /* Estilos y colores distintos para diferenciar la tablas de reservas pasadas */
        .th-futuras { background-color: #2e7d32; } 
        .th-pasadas { background-color: #7f8c8d; } 
        .titulo-seccion-pequeno { text-align: center; color: #333; margin-top: 30px; font-size: 1.5em; }
    </style>
</head>
<body style="background-color: #f4f7f6;">
	
	<!-- Parte superior, Logo, Nombre, Menu -->
    <header class="header-fijo">
        <div class="contenedor-logo">
            <a href="index.jsp"><img src="img/logo-sendavivaof.png" alt="Logo SendaViva" class="logo-oficial"></a>
            <h1><a href="index.jsp" style="text-decoration: none; color: inherit;">SendaViva</a></h1>
        </div>
      	
      	<!-- Acciones -->
        <div class="contenedor-acciones">
        	<!-- Iconos de redes sociales traidos -->
            <div class="redes-sociales">
                <a href="#"><i class="fab fa-whatsapp"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
            
            <!-- Logica para que salga el nombre de usuario en vez de entrar si la sesion esta activa -->
            <a href="#" class="btn-login-header" style="cursor: default;">
                <i class="fas fa-user-circle"></i> <%= nombreUsuario %>
            </a>
            
            <!-- Menu de navegacion 3 lineas -->
            <button class="btn-menu" id="btn-menu" aria-label="Abrir Menú">
                <span class="linea"></span>
                <span class="linea"></span>
                <span class="linea"></span>
            </button>
        </div>
		
		<!-- Capa oscura de fondo al abrir el menú -->
        <div class="overlay-menu" id="overlay"></div>
        
        <!-- Capa oscura de fondo al abrir el menú -->
        <nav class="menu-lateral" id="menu-lateral">
            <button class="btn-cerrar" id="btn-cerrar">&times;</button>
            <div class="cabecera-menu">
                <img src="img/logo-sendavivaof.png" alt="Logo">
                <div>
                    <h3>SendaViva</h3>
                    <span>Portal Administrativo</span>
                </div>
            </div>
            <ul>
                <li class="titulo-menu">Principal</li>
                <li><a href="index.jsp"><span class="icono">🏠</span> Inicio</a></li>
                <li><a href="dashboard_visitante.jsp"><span class="icono">🗺️</span> Catálogo de Senderos</a></li>
                <li><a href="historial_visitante.jsp" class="activo"><span class="icono">🎒</span> Mis Visitas</a></li>
                <li class="titulo-menu">Cuenta</li>
                <li style="padding: 10px 20px; color: var(--color-primario); font-weight: bold;">
                    <span class="icono">👋</span> Hola, <%= nombreUsuario %>
                </li>
                <li><a href="jsp/logout.jsp" style="color: #e74c3c;"><span class="icono">🚪</span> Cerrar Sesión</a></li>
            </ul>
        </nav>
    </header>

	<!-- Contenido -->
    <main class="contenedor-catalogo" style="padding-top: 100px;">
        <h2 class="titulo-seccion">Mis Visitas Programadas</h2>
        
        <%-- Apertura del bloque de código Java (scriptlet). Aquí se establece la conexión a la base de datos y se crean dos segmentos
            Uno para las reservas futuras y otro para las pasadas --%>
        <%
            try {
            	// Carga el driver JDBC de MySQL (Connector/J)
                Class.forName("com.mysql.cj.jdbc.Driver");
            	
             	// Conexión a la base de datos SendaVivaDB
                Connection dbconect1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SendaVivaDB?useUnicode=true&characterEncoding=UTF-8", "root", "");
                
                Statement stFuturas = dbconect1.createStatement();
                Statement stPasadas = dbconect1.createStatement();
        %>
		
		<%--Bloque 1: Proximas Avenuras (Futuras reservas) --%>
        <h3 class="titulo-seccion-pequeno"><i class="fas fa-calendar-check" style="color:#2e7d32;"></i> Próximas Aventuras</h3>
        
        <!-- Contenedor de la tabla -->
        <div class="tabla-contenedor">
            <table class="tabla-reservas">
                <thead>
                    <tr>
                        <th class="th-futuras">N° Reserva</th>
                        <th class="th-futuras">Sendero</th>
                        <th class="th-futuras">Fecha de Visita</th>
                        <th class="th-futuras">Horario</th>
                        <th class="th-futuras">Total Pagado</th>
                    </tr>
                </thead>
                <tbody>
                	
                	 <!--  // Trae las reservas del usuario cuya fecha sea desde hoy en adelante -->
                    <%
                        String sqlFuturas = "SELECT * FROM reservaciones WHERE id_usuario = '" + idUsuario + "' AND fecha_reserva >= CURDATE() ORDER BY fecha_reserva ASC";
                        ResultSet rsFuturas = stFuturas.executeQuery(sqlFuturas);
                        
                     	// Bandera para saber si el usuario tiene al menos una reserva futura
                        boolean hayFuturas = false;
                        
                        while(rsFuturas.next()) {
                            hayFuturas = true;
                    %>
                            <tr>
                                <td><strong>#<%= rsFuturas.getInt("id_reserva") %></strong></td>
                                <td><%= rsFuturas.getString("sendero") %></td>
                                <td><%= rsFuturas.getString("fecha_reserva") %></td>
                                <td><%= rsFuturas.getString("horario") %></td>
                                <td style="font-weight: bold; color: #2e7d32;">$<%= rsFuturas.getString("total_pago") %></td>
                            </tr>
                            <!-- Si el ResultSet no trajo ninguna fila, se muestra un mensaje en lugar de una tabla vacía -->
                    <%
                        }
                        if (!hayFuturas) {
                    %>
                            <tr>
                            <!-- colspan="5" hace que esta única celda ocupe el ancho de las 5 columnas de la tabla (en vez de mostrar 4
                                 celdas vacías al lado), para que el mensaje quede centrado y abarque toda la fila. -->
                                <td colspan="5" class="mensaje-vacio">
                                    No tienes reservas próximas.<br>
                                    <a href="dashboard_visitante.jsp" style="color: #2e7d32; font-weight: bold; text-decoration: none;">¡Reserva un sendero aquí!</a>
                                </td>
                            </tr>
                    <%  } %>
                </tbody>
            </table>
        </div>
		
		<%--Bloque 2: Avenuras Completadas (reservas antiguas) --%>
        <h3 class="titulo-seccion-pequeno"><i class="fas fa-history" style="color:#7f8c8d;"></i> Historial de Visitas Pasadas</h3>
        <div class="tabla-contenedor">
            <table class="tabla-reservas">
                <thead>
                    <tr>
                        <th class="th-pasadas">N° Reserva</th>
                        <th class="th-pasadas">Sendero</th>
                        <th class="th-pasadas">Fecha Visitada</th>
                        <th class="th-pasadas">Horario</th>
                        <th class="th-pasadas">Total Pagado</th>
                    </tr>
                </thead>
                <tbody>
                
                	<!-- Trae las reservas del usuario con fecha anterior a hoy -->
                	<!-- Bloque igual que el primero -->
                    <%
                        String sqlPasadas = "SELECT * FROM reservaciones WHERE id_usuario = '" + idUsuario + "' AND fecha_reserva < CURDATE() ORDER BY fecha_reserva DESC";
                        ResultSet rsPasadas = stPasadas.executeQuery(sqlPasadas);
                        boolean hayPasadas = false;
                        
                        while(rsPasadas.next()) {
                            hayPasadas = true;
                    %>
                            <tr>
                                <td><strong style="color: #888;">#<%= rsPasadas.getInt("id_reserva") %></strong></td>
                                <td style="color: #888;"><%= rsPasadas.getString("sendero") %></td>
                                <td style="color: #888;"><%= rsPasadas.getString("fecha_reserva") %></td>
                                <td style="color: #888;"><%= rsPasadas.getString("horario") %></td>
                                <td style="color: #888;">$<%= rsPasadas.getString("total_pago") %></td>
                            </tr>
                    <%
                        }
                        if (!hayPasadas) {
                    %>
                            <tr>
                                <td colspan="5" class="mensaje-vacio" style="font-size: 0.9em;">
                                    Aún no tienes un historial de visitas pasadas.
                                </td>
                            </tr>
                    <%  } %>
                </tbody>
            </table>
        </div>
		
		<!-- Cierre de la conexión y manejo de errores. Si algo falla en el bloque try (conexión, driver, consulta), se captura la excepción 
			y se imprime un mensaje de error en pantalla en vez de que la página se rompa por completo. -->
        <%
                dbconect1.close();
            } catch(Exception e) {
                out.print("<div style='color:red; text-align:center; padding: 20px;'>Error al consultar reservas: " + e.getMessage() + "</div>");
            }
        %>
    </main>
	
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