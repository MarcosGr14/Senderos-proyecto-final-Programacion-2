<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<%
	//Evalua si la sesion esta activa, si no te manda a Login
	  if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }

    // Atrapar el sendero seleccionado en la pagina de Catalogo de senderos
    String senderoUrl = request.getParameter("sendero");
    if (senderoUrl == null) {
        senderoUrl = ""; 
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Senderos - Acceso y Registro</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles.css">
    <!-- Iconos de Fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	
	<!-- Parte superior, Logo, Nombre, Menu -->
	<header class="header-fijo">
        <div class="contenedor-logo">
            <a href="../index.html">
                <img src="../img/logo-sendavivaof.png" alt="Logo SendaViva" class="logo-oficial">
            </a>
            <h1>
                <a href="../index.html" style="text-decoration: none; color: inherit;">SendaViva</a>
            </h1>
        </div>
        
        <!-- Acciones -->
     	 <div class="contenedor-acciones">
     	 <!-- Iconos de redes sociales traidos -->
            <div class="redes-sociales">
                <a href="#" title="Escríbenos en WhatsApp"><i class="fab fa-whatsapp"></i></a>
                <a href="#" title="Síguenos en Instagram"><i class="fab fa-instagram"></i></a>
            </div>
            
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
                <img src="../img/logo-sendavivaof.png" alt="Logo">
                <div>
                    <h3>SendaViva</h3>
                    <span>Portal Administrativo</span>
                </div>
            </div>
            
         <!-- Lista de todas las paginas que se pueden acceder en este manu de navegacion -->
            <ul>
                <li class="titulo-menu">Principal</li>
                <li><a href="../index.html"><span class="icono">🏠</span> Inicio</a></li>
                <li><a href="dashboard_visitante.jsp"><span class="icono">🗺️</span> Catálogo de Senderos</a></li>
                <li><a href="historial_visitante.jsp"><span class="icono">🎒</span> Mis Visitas</a></li>
                <li class="titulo-menu">Nosotros</li>
                <li><a href="../sobre_nosotros.jsp"><span class="icono">👨‍💻</span> El Equipo</a></li>
                <li class="titulo-menu">Cuenta</li>
                <li><a href="login.jsp" class="activo"><span class="icono">👤</span> Iniciar Sesión</a></li>
            </ul>
        </nav>
    </header>
    
    <!-- Contenido -->
    <main class="contenedor-reserva">
        <div class="layout-checkout">
            
            <!-- Formulario de sendero -->
            <section class="columna-formulario">
                <form action="procesar_reserva.jsp" method="POST" id="form-reserva-pago">
                <input type="hidden" name="total_pago" id="total_oculto" value="0.00">
                
                    <!-- Seleccionar el sendero, fecha y hora -->
                    <div class="bloque-checkout">
                        <h2><span class="numero-paso">1</span> Detalles de la Aventura</h2>
                        <div class="grupo-input">
						    <label for="select-sendero">Selecciona el Sendero</label>
						    <select id="select-sendero" name="sendero" required>
						        <option value="" disabled <%= senderoUrl.isEmpty() ? "selected" : "" %>>-- Elige tu destino --</option>
						        <option value="Sendero Momotides" data-precio="10.00" <%= "Momotides".equals(senderoUrl) ? "selected" : "" %>>Sendero Momótides ($10.00)</option>
						        <option value="Circuito Los Caobos" data-precio="12.00" <%= "Caobos".equals(senderoUrl) ? "selected" : "" %>>Circuito Los Caobos ($12.00)</option>
						        <option value="Circuito la Cienaguita" data-precio="15.00" <%= "Cienaguita".equals(senderoUrl) ? "selected" : "" %>>Circuito la Cienaguita ($15.00)</option>
						        <option value="Sendero del Cerro Ancon" data-precio="12.00" <%= "Ancon".equals(senderoUrl) ? "selected" : "" %>>Sendero del Cerro Ancón ($12.00)</option>
						        <option value="Camino del Oleoducto" data-precio="8.00" <%= "Oleoducto".equals(senderoUrl) ? "selected" : "" %>>Camino del Oleoducto ($8.00)</option>
						    </select>
						</div>
						
						<!-- Fecha de visita -->
                        <div class="Fila-inputs">
                            <div class="grupo-input">
                                <label for="fecha-reserva">Fecha de Visita</label>
                                <input type="date" id="fecha-reserva" name="fecha" required>
                            </div>
                            
                            <!-- Horario de reserva -->
                            <div class="grupo-input">
                                <label for="horario-reserva">Horario Disponible</label>
                                <select id="horario-reserva" name="horario" required>
                                    <option value="" disabled selected>-- Elige la hora --</option>
                                    <option value="07:00 AM">07:00 AM - 10:00 AM</option>
                                    <option value="10:30 AM">10:30 AM - 01:30 PM</option>
                                    <option value="02:00 PM">02:00 PM - 05:00 PM</option>
                                </select>
                            </div>
                        </div>
                    </div>
					
					<!-- Informacion de pago -->
                    <div class="bloque-checkout">
                        <h2><span class="numero-paso">2</span> Información de Pago</h2>
                        
                        <!-- Nombre de tarjeta -->
                        <div class="grupo-input">
                            <label for="nombre-tarjeta">Nombre del Titular (Como aparece en la tarjeta)</label>
                            <input type="text" id="nombre-tarjeta" placeholder="Juan Pérez" required>
                        </div>
						
						<!-- Numero de tarjeta -->
                        <div class="grupo-input">
                            <label for="numero-tarjeta">Número de Tarjeta</label>
                            <div class="input-icono-contenedor">
                                <input type="text" id="numero-tarjeta" maxlength="19" placeholder="4000 1234 5678 9010" required>
                                <i class="fas fa-credit-card icono-input"></i>
                            </div>
                        </div>
						
						<!-- Fecha de expiracion de la tarjeta -->
                        <div class="Fila-inputs">
                            <div class="grupo-input">
                                <label for="expiracion">Expiración</label>
                                <input type="text" id="expiracion" maxlength="5" placeholder="MM/AA" required>
                            </div>
                            
                            <!-- CVV de la tarjeta -->
                            <div class="grupo-input">
                                <label for="cvv">CVV</label>
                                <input type="password" id="cvv" maxlength="3" placeholder="123" required>
                            </div>
                        </div>
                    </div>
					
					<!-- Boton de Confirmar reserva -->
                    <button type="submit" class="btn-pagar-orden">Confirmar y Pagar Reserva</button>
                </form>
            </section>
			
			<!-- Resumen de reserva -->
            <aside class="columna-resumen">
                <div class="tarjeta-resumen">
                    <h3>Resumen de Reserva</h3>
                    
                    <!-- Sendero -->
                    <div class="linea-resumen">
                        <span>Sendero:</span>
                        <span id="resumen-nombre-sendero" class="dato-resumen">Ninguno seleccionado</span>
                    </div>
                    <!-- Fechaa -->
                    <div class="linea-resumen">
                        <span>Fecha:</span>
                        <span id="resumen-fecha" class="dato-resumen">-</span>
                    </div>
                    <!-- Horario -->
                    <div class="linea-resumen">
                        <span>Horario:</span>
                        <span id="resumen-horario" class="dato-resumen">-</span>
                    </div>
                    <!-- Total a pagar -->
                    <hr>
                    <div class="linea-resumen total-resumen">
                        <span>Total a Pagar:</span>
                        <span id="resumen-total">$0.00</span>
                    </div>
                    <!-- Mensaje de seguridad -->
                    <p class="nota-pago"><i class="fas fa-lock"></i> Pago seguro cifrado SSL de extremo a extremo.</p>
                </div>
            </aside>
        </div>
    </main>
    
	<!-- Modal de confirmacion de pago, loading -->
    <div class="modal-procesamiento" id="modal-status">
        <div class="caja-modal">
            <!-- Procesando el pago -->
            <div id="status-procesando" class="estado-modal">
                <div class="spinner"></div>
                <h3>Procesando Pago...</h3>
                <p>Estamos conectando de forma segura con los servidores bancarios. No cierres esta ventana.</p>
            </div>
			
			<!-- Reserva exitosa -->
            <div id="status-exito" class="estado-modal ocultar">
                <div class="circulo-icono exito"><i class="fas fa-check"></i></div>
                <h3>¡Compra Exitosa!</h3>
                <p>Tu reservación ha sido procesada con éxito. El boleto digital y el código de trail han sido enviados a tu correo electrónico.</p>
                <button class="btn-modal-cerrar" onclick="cerrarModalStatus(true)">Ir a Mis Visitas</button>
            </div>
			
			<!-- Mensaje de error -->
            <div id="status-error" class="estado-modal ocultar">
                <div class="circulo-icono error"><i class="fas fa-times"></i></div>
                <h3>Pago Rechazado</h3>
                <p>Hubo un problema al procesar la tarjeta. Fondos insuficientes o datos de seguridad inválidos. Por favor, verifica e intenta de nuevo.</p>
                <button class="btn-modal-cerrar btn-error-color" onclick="cerrarModalStatus(false)">Intentar de nuevo</button>
            </div>

        </div>
    </div>
    
     <!-- Footer-->
    <footer class="pie-pagina">
        <div class="contenido-footer">
            <nav class="menu-footer">
                <ul>
                    <li><a href="../index.html">Inicio</a></li>
                    <li><a href="dashboard_visitante.jsp">Catálogo de Senderos</a></li>
                    <li><a href="historial_visitante.jsp">Mis Visitas</a></li>
                    <li><a href="../sobre_nosotros.jsp">Contactanos</a></li>
                    <li><a href="login.jsp">Iniciar Sesión</a></li>
                    <li><a href="logout.jsp" style="color: #e74c3c; font-weight: 600;"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a></li>
                </ul>
            </nav>
            <p>&copy; 2026 SendaViva - Gestión de Reservas Naturales. Todos los derechos reservados.</p>
            <div class="enlaces-footer">
                <a href="#">Políticas de Privacidad</a> | <a href="#">Términos y Condiciones</a>
            </div>
        </div>
    </footer>
    
    <script>
        // Control de Menú Lateral
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

        // Lógica del Resumen
        const selectSendero = document.getElementById('select-sendero');
        const fechaReserva = document.getElementById('fecha-reserva');
        const horarioReserva = document.getElementById('horario-reserva');

        const resSendero = document.getElementById('resumen-nombre-sendero');
        const resFecha = document.getElementById('resumen-fecha');
        const resHorario = document.getElementById('resumen-horario');
        const resTotal = document.getElementById('resumen-total');

        function actualizarResumenSendero() {
            const opcion = selectSendero.options[selectSendero.selectedIndex];
            if (opcion && opcion.value !== "") {
                resSendero.innerText = opcion.value;
         
                let precioLimpio = opcion.getAttribute('data-precio');
                resTotal.innerText = "$" + precioLimpio;
                document.getElementById('total_oculto').value = precioLimpio;
            }
        }
        
        selectSendero.addEventListener('change', actualizarResumenSendero);
        window.addEventListener('DOMContentLoaded', actualizarResumenSendero);

        fechaReserva.addEventListener('change', () => { resFecha.innerText = fechaReserva.value; });
        horarioReserva.addEventListener('change', () => { resHorario.innerText = horarioReserva.value; });

        // Procesamiento del Formulario
        const form = document.getElementById('form-reserva-pago');
        const modal = document.getElementById('modal-status');
        const sProcesando = document.getElementById('status-procesando');
        const sExito = document.getElementById('status-exito');
        const sError = document.getElementById('status-error');

        form.addEventListener('submit', (e) => {
            e.preventDefault(); 

            modal.classList.add('activo');
            sProcesando.classList.remove('ocultar');
            sExito.classList.add('ocultar');
            sError.classList.add('ocultar');

            setTimeout(() => {
                sProcesando.classList.add('ocultar');
                
                const nombreTitular = document.getElementById('nombre-tarjeta').value.toLowerCase();
                
                if(nombreTitular.includes("error")) {
                    sError.classList.remove('ocultar'); 
                } else {
                    sExito.classList.remove('ocultar'); 
                }
            }, 2500);
        });

        // MODIFICACIÓN FINAL: Al cerrar el modal con éxito, el JS envía el formulario al servidor Java
        function cerrarModalStatus(fueExitoso) {
            modal.classList.remove('activo');
            if(fueExitoso) {
                document.getElementById('form-reserva-pago').submit(); 
            }
        }
    </script>
</body>
</html>