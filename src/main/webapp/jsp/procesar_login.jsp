<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Atrapa la informacion del formulario de iniciar sesion de la pagina de Login.jsp
    String correo = request.getParameter("correo_login");
    String password = request.getParameter("clave_login");

    try {
        // Estructura de conexión a la Base de Datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection dbconect1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SendaVivaDB", "root", "");
        Statement dbstatement1 = dbconect1.createStatement();
        
        // Busqueda de la cuenta a ver si existe
        String sql = "SELECT * FROM usuarios WHERE correo = '" + correo + "' AND password = '" + password + "'";
        ResultSet rs = dbstatement1.executeQuery(sql);
        
        if (rs.next()) {
            // Guardamos la sesión y se inicia sesion
            session.setAttribute("id_usuario", rs.getInt("id_usuario"));
            session.setAttribute("usuario", rs.getString("nombre_completo"));
            
            int rol = rs.getInt("id_rol");
            
        	// Guardamos el rol en la sesión para que el dashboard lo pueda leer
            session.setAttribute("id_rol", String.valueOf(rol));
            
            // Redirigimos según el rol (Visitantes y Admin)
            if (rol == 1) {
                response.sendRedirect("../dashboard_admin.jsp"); // Admin
            } else {
                response.sendRedirect("../dashboard_visitante.jsp"); // Visitante
            }
        } else {
            // Error de credenciales, te devuelve al login.jsp
            response.sendRedirect("login.jsp?error=1");
        }
        
        dbconect1.close();
        
    } catch (Exception e) {
        out.print("Error en el sistema: " + e.getMessage());
    }
%>