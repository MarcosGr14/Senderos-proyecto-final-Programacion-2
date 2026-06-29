<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // VALIDACIÓN DE SEGURIDAD (La que ya tenías)
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // NUEVO: Atrapar el sendero de la URL
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
    
    <!-- Contenido principal reserva -->
    <main class="contenedor-reserva">
        <div class="layout-checkout">
            
            <section class="columna-formulario">
                <form id="form-reserva-pago">
                    
                    <div class="bloque-checkout">
                        <h2><span class="numero-paso">1</span> Detalles de la Aventura</h2>
                        <div class="grupo-input">
						    <label for="select-sendero">Selecciona el Sendero</label>
						    <select id="select-sendero" name="sendero" required>
						        <option value="" disabled <%= senderoUrl.isEmpty() ? "selected" : "" %>>-- Elige tu destino --</option>
						        <option value="Sendero Momótides" data-precio="10.00" <%= "Momotides".equals(senderoUrl) ? "selected" : "" %>>Sendero Momótides ($10.00)</option>
						        <option value="Circuito Los Caobos" data-precio="12.00" <%= "Caobos".equals(senderoUrl) ? "selected" : "" %>>Circuito Los Caobos ($12.00)</option>
						        <option value="Circuito la Cienaguita" data-precio="15.00" <%= "Cienaguita".equals(senderoUrl) ? "selected" : "" %>>Circuito la Cienaguita ($15.00)</option>
						        <option value="Sendero del Cerro Ancón" data-precio="12.00" <%= "Ancon".equals(senderoUrl) ? "selected" : "" %>>Sendero del Cerro Ancón ($12.00)</option>
						        <option value="Camino del Oleoducto" data-precio="8.00" <%= "Oleoducto".equals(senderoUrl) ? "selected" : "" %>>Camino del Oleoducto ($8.00)</option>
						    </select>
						</div>
                        <div class="Fila-inputs">
                            <div class="grupo-input">
                                <label for="fecha-reserva">Fecha de Visita</label>
                                <input type="date" id="fecha-reserva" required>
                            </div>
                            <div class="grupo-input">
                                <label for="horario-reserva">Horario Disponible</label>
                                <select id="horario-reserva" required>
                                    <option value="" disabled selected>-- Elige la hora --</option>
                                    <option value="07:00 AM">07:00 AM - 10:00 AM</option>
                                    <option value="10:30 AM">10:30 AM - 01:30 PM</option>
                                    <option value="02:00 PM">02:00 PM - 05:00 PM</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="bloque-checkout">
                        <h2><span class="numero-paso">2</span> Información de Pago</h2>
                        
                        <div class="grupo-input">
                            <label for="nombre-tarjeta">Nombre del Titular (Como aparece en la tarjeta)</label>
                            <input type="text" id="nombre-tarjeta" placeholder="Juan Pérez" required>
                        </div>

                        <div class="grupo-input">
                            <label for="numero-tarjeta">Número de Tarjeta</label>
                            <div class="input-icono-contenedor">
                                <input type="text" id="numero-tarjeta" maxlength="19" placeholder="4000 1234 5678 9010" required>
                                <i class="fas fa-credit-card icono-input"></i>
                            </div>
                        </div>

                        <div class="Fila-inputs">
                            <div class="grupo-input">
                                <label for="expiracion">Expiración</label>
                                <input type="text" id="expiracion" maxlength="5" placeholder="MM/AA" required>
                            </div>
                            <div class="grupo-input">
                                <label for="cvv">CVV</label>
                                <input type="password" id="cvv" maxlength="3" placeholder="123" required>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn-pagar-orden">Confirmar y Pagar Reserva</button>
                </form>
            </section>

            <aside class="columna-resumen">
                <div class="tarjeta-resumen">
                    <h3>Resumen de Reserva</h3>
                    <div class="linea-resumen">
                        <span>Sendero:</span>
                        <span id="resumen-nombre-sendero" class="dato-resumen">Ninguno seleccionado</span>
                    </div>
                    <div class="linea-resumen">
                        <span>Fecha:</span>
                        <span id="resumen-fecha" class="dato-resumen">-</span>
                    </div>
                    <div class="linea-resumen">
                        <span>Horario:</span>
                        <span id="resumen-horario" class="dato-resumen">-</span>
                    </div>
                    <hr>
                    <div class="linea-resumen total-resumen">
                        <span>Total a Pagar:</span>
                        <span id="resumen-total">$0.00</span>
                    </div>
                    <p class="nota-pago"><i class="fas fa-lock"></i> Pago seguro cifrado SSL de extremo a extremo.</p>
                </div>
            </aside>
        </div>
    </main>

    <div class="modal-procesamiento" id="modal-status">
        <div class="caja-modal">
            
            <div id="status-procesando" class="estado-modal">
                <div class="spinner"></div>
                <h3>Procesando Pago...</h3>
                <p>Estamos conectando de forma segura con los servidores bancarios. No cierres esta ventana.</p>
            </div>

            <div id="status-exito" class="estado-modal ocultar">
                <div class="circulo-icono exito"><i class="fas fa-check"></i></div>
                <h3>¡Compra Exitosa!</h3>
                <p>Tu reservación ha sido procesada con éxito. El boleto digital y el código de trail han sido enviados a tu correo electrónico.</p>
                <button class="btn-modal-cerrar" onclick="cerrarModalStatus(true)">Ir a Mis Visitas</button>
            </div>

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
                    <li><a href="dashboard_visitante.html">Catálogo de Senderos</a></li>
                    <li><a href="historial_visitante.html">Mis Visitas</a></li>
                    <li><a href="../sobre_nosotros.html">Contactanos</a></li>
                    <li><a href="login.jsp">Iniciar Sesión</a></li>
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
        // Control de Menú Lateral
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

        // --- LÓGICA DINÁMICA DE LA RESERVA ---
        const selectSendero = document.getElementById('select-sendero');
        const fechaReserva = document.getElementById('fecha-reserva');
        const horarioReserva = document.getElementById('horario-reserva');

        const resSendero = document.getElementById('resumen-nombre-sendero');
        const resFecha = document.getElementById('resumen-fecha');
        const resHorario = document.getElementById('resumen-horario');
        const resTotal = document.getElementById('resumen-total');

        // Actualizar resumen en tiempo real
        selectSendero.addEventListener('change', () => {
            const opcion = selectSendero.options[selectSendero.selectedIndex];
            resSendero.innerText = opcion.value;
            resTotal.innerText = `$${opcion.getAttribute('data-precio')}`;
        });

        fechaReserva.addEventListener('change', () => { resFecha.innerText = fechaReserva.value; });
        horarioReserva.addEventListener('change', () => { resHorario.innerText = horarioReserva.value; });

        // Procesamiento del Formulario (Simulación)
        const form = document.getElementById('form-reserva-pago');
        const modal = document.getElementById('modal-status');
        const sProcesando = document.getElementById('status-procesando');
        const sExito = document.getElementById('status-exito');
        const sError = document.getElementById('status-error');

        form.addEventListener('submit', (e) => {
            e.preventDefault(); // Evita que recargue la página inmediatamente

            // Abrimos el modal en estado "Procesando"
            modal.classList.add('activo');
            sProcesando.classList.remove('ocultar');
            sExito.classList.add('ocultar');
            sError.classList.add('ocultar');

            // Simulación de respuesta bancaria tras 2.5 segundos
            setTimeout(() => {
                sProcesando.classList.add('ocultar');
                
                // TRUCO PARA PRESENTACIÓN: Si el titular escribe "error", simulará fallo.
                const nombreTitular = document.getElementById('nombre-tarjeta').value.toLowerCase();
                
                if(nombreTitular.includes("error")) {
                    sError.classList.remove('ocultar'); // Muestra tarjeta roja de error
                } else {
                    sExito.classList.remove('ocultar'); // Muestra tarjeta verde de éxito
                }
            }, 2500);
        });

        function cerrarModalStatus(fueExitoso) {
            modal.classList.remove('activo');
            if(fueExitoso) {
                window.location.href = "historial_visitante.html"; // Redirige si compró
            }
        }
    </script>
</body>
</html>