<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//Datos que llegan desde el formulario de reserva
    String sendero = request.getParameter("sendero");
    String fecha = request.getParameter("fecha");
    String horario = request.getParameter("horario");
    
    //Sesion activa del usuario
    String id_usuario = "1"; 
    if (session.getAttribute("id_usuario") != null) {
        id_usuario = session.getAttribute("id_usuario").toString();
    }
	
    //Precios calculados por el servidor
    String totalPago = "0.00";
    if ("Momotides".equals(sendero)) {
        totalPago = "10.00";
    } else if ("Caobos".equals(sendero)) {
        totalPago = "12.00";
    } else if ("Cieneguita".equals(sendero)) {
        totalPago = "15.00";
    } else if ("Ancon".equals(sendero)) {
        totalPago = "12.00";
    } else if ("Oleoducto".equals(sendero)) {
        totalPago = "8.00";
    }

    try {
        // 3. Estructura directa de conexión a la Base de datos con UTF-8 para evitar caracteres raros
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection dbconect1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SendaVivaDB?useUnicode=true&characterEncoding=UTF-8", "root", "");
        Statement dbstatement1 = dbconect1.createStatement();
        
        // Inserts con los datos de la reserva ya validados/calculados arriba
        String insertarsql = "INSERT INTO reservaciones (id_usuario, sendero, fecha_reserva, horario, total_pago) "
                           + "VALUES ('" + id_usuario + "', '" + sendero + "', '" + fecha + "', '" + horario + "', '" + totalPago + "')";
        
        dbstatement1.executeUpdate(insertarsql);
        
        dbconect1.close();
        
        //Cuando de completa la reserva te manda a tu historial de visitas
        response.sendRedirect("../historial_visitante.jsp");
        
	  	//Mensaje por si algo falla en la reserva
	    } catch(Exception e) {
	        out.print("<div style='color:red; font-family:sans-serif; padding:20px;'>");
	        out.print("<h3>Error al registrar la reservación en la base de datos</h3>");
	        out.print("<p>" + e.getMessage() + "</p>");
	        out.print("<a href='../reservar.jsp'>Volver a intentar</a>");
	        out.print("</div>");
	    }
	%>