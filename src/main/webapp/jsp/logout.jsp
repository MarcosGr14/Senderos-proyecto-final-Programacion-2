<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. Verificamos si existe una sesión activa y la destruimos
    if (session != null) {
        session.invalidate(); // Esta es la instrucción clave que borra todos los datos del usuario en Tomcat
    }
    
    // 2. Redirigimos al usuario a la página de login
    response.sendRedirect("login.jsp");
%>