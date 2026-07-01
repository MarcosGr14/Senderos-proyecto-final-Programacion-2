<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //Atrapa la informacion del registro de la pagina de Login.jsp
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido"); 
    
    String correo = request.getParameter("correo_registro");
    String password = request.getParameter("clave_registro");

    // 2. Unimos el nombre y el apellido para que salga en un solo campo en la BD
    String nombreCompleto = nombre + " " + apellido;

    try {
        // Estructura de conexión a la Base de Datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection dbconect1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/SendaVivaDB", "root", "");
        Statement dbstatement1 = dbconect1.createStatement();
        
        //Insertamos la informacion en la BD
        String insertarsql = "INSERT INTO usuarios (nombre_completo, correo, password, id_rol) "
                           + "VALUES ('" + nombreCompleto + "', '" + correo + "', '" + password + "', 2)";
        
        dbstatement1.executeUpdate(insertarsql);
        
        dbconect1.close();
        
        // Redirigimos al login
        response.sendRedirect("login.jsp?exito=1");
        
    } catch (Exception e) {
        // En lugar de imprimir el error en blanco, lo mandamos al login con un código de error
        response.sendRedirect("login.jsp?error_registro=1");
    }
%>