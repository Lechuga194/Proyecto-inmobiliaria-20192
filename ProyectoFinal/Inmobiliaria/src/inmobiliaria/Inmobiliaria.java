/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inmobiliaria;

import conectividad.OracleJDBCExample;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author josel
 */
public class Inmobiliaria {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        // TODO code application logic here
        
        OracleJDBCExample a = new OracleJDBCExample();
        Connection conexion = a.getConection();
        
        String consulta = "SELECT * FROM CASA";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        
        while(rs.next()){
            System.out.println("Numero de Registro: " + rs.getInt("NUMREGISTRO"));
        }
        
    }
    
}
