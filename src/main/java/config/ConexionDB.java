package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    
    // 1. Parámetros de tu base de datos en XAMPP
    private static final String URL = "jdbc:mysql://localhost:3306/SendaVivaDB?useSSL=false&serverTimezone=UTC";
    private static final String USUARIO = "root";
    private static final String PASSWORD = "";
    // 2. Método para abrir la conexión
    public Connection conectar() {
        Connection conexion = null;
        try {
            // Cargar el Driver que pusiste en la carpeta lib
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Intentar conectar con MySQL
            conexion = DriverManager.getConnection(URL, USUARIO, PASSWORD);
            System.out.println("¡Conexión a SendaVivaDB exitosa!");
            
        } catch (ClassNotFoundException e) {
            System.out.println("Error fatal: No se detectó el conector JDBC. " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error de base de datos: Verifica que XAMPP esté encendido. " + e.getMessage());
        }
        return conexion;
    }
}