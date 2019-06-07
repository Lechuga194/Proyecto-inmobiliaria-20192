/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inmobiliaria;

import Modelo.Modelo;
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

        Modelo a = new Modelo();
        System.out.println("holi" + a.ConsultaAsesores());
        ResultSet rs;
        
        rs = a.CasasPorAsesores("1");
        rs = a.ConsultaAsesores();
        rs = a.CasasPorAsesores("9");
        rs = a.TerrenosPorAsesores("1");
        rs = a.AsignacionDeAsesor("6");
        rs = a.CaracteristicasCasa("1");
        rs = a.CaracteristicasDepartamento("1");
        rs = a.AmenidadesCasa("1");
        rs = a.AmenidadesDepartamento("1");
        rs = a.ServiciosCasa("2");
        rs = a.ServiciosDepartamento("2");
        rs = a.ServiciosTerreno("2");
        rs = a.SeguroCasa("3");
        rs = a.SeguroDepartamento("3");
        rs = a.SeguroTerreno("3");
        rs = a.DireccionCasa("1");
        rs = a.DireccionDepartamento("1");
        rs = a.DireccionTerreno("3");
        
        while(rs.next()){
            System.out.println("Nombre" + rs.getString("CALLE"));
            
        }

    }

}
