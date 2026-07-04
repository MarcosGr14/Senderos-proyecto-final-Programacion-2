<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<%@ page import="java.sql.*" %>
<%
    // SEGURIDAD: Verificar que sea Admin
    Object usuarioObj = session.getAttribute("id_usuario");
    Object rolObj = session.getAttribute("id_rol");
    if (usuarioObj == null || rolObj == null || !"1".equals(rolObj.toString())) {
        response.sendRedirect("jsp/login.jsp");
        return;
    }
    String nombreUsuario = (String) session.getAttribute("usuario");

    // VARIABLES PARA LAS ESTADÍSTICAS
    double ingresosTotales = 0;
    int ventasTotales = 0;
    int senderosActivos = 0;

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SendaVivaDB", "root", "");
        
        // CONSULTA 1: Ganancias y Total de compras (Usando 'reservaciones' y 'total_pago')
        String sqlTotales = "SELECT SUM(total_pago) AS dinero_ganado, COUNT(id_reserva) AS total_compras FROM reservaciones";
        Statement stmtTotales = conn.createStatement();
        ResultSet rsTotales = stmtTotales.executeQuery(sqlTotales);
        if (rsTotales.next()) {
            ingresosTotales = rsTotales.getDouble("dinero_ganado");
            ventasTotales = rsTotales.getInt("total_compras");
        }
        
        // CONSULTA 2: Senderos activos
        String sqlSenderos = "SELECT COUNT(DISTINCT sendero) AS cant_senderos FROM reservaciones";
        Statement stmtSenderos = conn.createStatement();
        ResultSet rsSenderos = stmtSenderos.executeQuery(sqlSenderos);
        if (rsSenderos.next()) {
            senderosActivos = rsSenderos.getInt("cant_senderos");
        }
    } catch (Exception e) {
        System.out.println("Error DB: " + e.getMessage());
    }
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
            
            <div class="cabecera-menu">
                <img src="img/logo-sendavivaof.png" alt="Logo">
                <div>
                    <h3>SendaViva</h3>
                    <span>Portal Administrativo</span>
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
    
    <!-- CONTENIDO DE ESTADÍSTICAS -->
    <main class="contenedor-dashboard">
        <div class="cabecera-estadisticas">
            <h2><i class="fas fa-chart-line"></i> Resumen de Ventas y Rendimiento</h2>
            <p>Métricas de ingresos y popularidad de nuestros senderos generadas en tiempo real.</p>
        </div>

        <!-- KPIs DINÁMICOS -->
        
        <!-- Tarjeta 1 Ingresos-->
        <div class="grid-kpis">
            <div class="card-kpi">
                <div class="kpi-icono" style="color: #2ecc71; background: #e8f8f5;">
                    <i class="fas fa-dollar-sign"></i>
                </div>
                <div class="kpi-info">
                    <h3>$<%= String.format("%.2f", ingresosTotales) %></h3>
                    <p>Ingresos Totales</p>
                </div>
            </div>
            
            <!-- Tarjeta 2 Senderos comprados -->
            <div class="card-kpi">
                <div class="kpi-icono" style="color: #3498db; background: #ebf5fb;">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="kpi-info">
                    <h3><%= ventasTotales %></h3>
                    <p>Senderos Comprados</p>
                </div>
            </div>
            
            <!-- Tarjeta 3 Catalogo activo -->
            <div class="card-kpi">
                <div class="kpi-icono" style="color: #f39c12; background: #fef5e7;">
                    <i class="fas fa-map-marked-alt"></i>
                </div>
                <div class="kpi-info">
                    <h3><%= senderosActivos %></h3>
                    <p>Catálogo Activo</p>
                </div>
            </div>
        </div>
        
        <!-- Tarjeta 4 Visual -->
            <div class="card-kpi">
                <div class="kpi-icono" style="color: #e74c3c; background: #fdedec;">
                    <i class="fas fa-users"></i>
                </div>
                <div class="kpi-info">
                    <h3>3</h3>
                    <p>Guias Activos</p>
                </div>
            </div><br><br>

        <!-- BARRAS DE PROGRESO DINÁMICAS (VENTAS POR SENDERO) -->
        <div class="grid-graficos">
            <div class="card card-grafico">
                <h3><i class="fas fa-trophy" style="color: #f1c40f;"></i> Ventas por Sendero</h3>
                
                <%
                if (conn != null) {
                    try {
                        String sqlTop = "SELECT sendero AS nombre_sendero, COUNT(id_reserva) AS compras_del_sendero " +
                                        "FROM reservaciones " +
                                        "GROUP BY sendero " +
                                        "ORDER BY compras_del_sendero DESC";
                                        
                        Statement stmtTop = conn.createStatement();
                        ResultSet rsTop = stmtTop.executeQuery(sqlTop);
                        
                        String[] colores = {"#2ecc71", "#3498db", "#f39c12", "#9b59b6", "#e74c3c"};
                        int colorIndex = 0;
                        
                        while (rsTop.next()) {
                            String nombre = rsTop.getString("nombre_sendero");
                            int cantCompras = rsTop.getInt("compras_del_sendero");
                            
                            int porcentajeVisual = (ventasTotales > 0) ? (cantCompras * 100) / ventasTotales : 0;
                            String colorActual = colores[colorIndex % colores.length];
                %>
                
                <div class="item-progreso">
                    <div class="progreso-info">
                        <span><%= nombre %></span>
                        <span><%= cantCompras %> compras (<%= porcentajeVisual %>%)</span>
                    </div>
                    <div class="barra-fondo">
                        <div class="barra-relleno" style="width: <%= porcentajeVisual %>%; background-color: <%= colorActual %>;"></div>
                    </div>
                </div>
                
                <%
                            colorIndex++;
                        } // Cierre del while
                    } catch (Exception e) {
                        out.print("<p style='color:red;'>Error cargando el gráfico: " + e.getMessage() + "</p>");
                    } finally {
                        conn.close(); 
                    } // Cierre del try-catch-finally
                } // Cierre del if (conn != null)
                %>
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