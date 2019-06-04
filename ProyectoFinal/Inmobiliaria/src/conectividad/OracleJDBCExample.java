/*
    Proyecto Final | Base de datos | 2019-2 | Lechuga Martinez Jose Eduardo | joselechuga194@ciencias.unam.mx
*/

package conectividad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase que conecta la base de datos con java
 * @author Lechuga194
 */
public class OracleJDBCExample {
    public Connection getConection(){
        System.out.println("--------Probando Conexion con JDBC-------");
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Donde esta el driver?");
            ex.printStackTrace();
        }
        System.out.println("JDBC Registrado");
        Connection connection = null;
        try{
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:fundamentosB", "tarea6", "1904");
        } catch (SQLException ex) {
            System.out.println("Conexion fallida");
            ex.printStackTrace();
        }
        if(connection != null){
            System.out.println("Genial!, tu base esta conectada");
            return connection;
        }else{
            System.out.println("Error de conexcion");
            return null;
        }
    }
}
