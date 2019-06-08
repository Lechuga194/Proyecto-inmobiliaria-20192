/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inmobiliaria;

import Modelo.Modelo;
import conectividad.OracleJDBCExample;
import java.sql.Connection;
import java.sql.Date;
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
        Date date = new Date(120,00,31);
        
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
        rs = a.PropiedadesEmpresa();
        //a.agregaCasa(50, "test", 5, 5, 5, 5, 5, 5, 1, "nuevo", 19,04,1997);
        //a.agregaDepartamento(0, "Vidrio", 0, 0, 0, 0, 0, 0, "Usado", 19, 04, 1998, 0, 0, 0);
        //a.agregaTerreno(500, "no");
        //a.agregaEmpresa("Test");
        //a.agregaAsesor(1, 1, 2, 1990, "test", "test", "test", 02, 02, 2002, 666);
        //a.agregaDueño(19, 04, 1998, "Lechuga", "Edu", "Martinez");
        //a.agregaColonia("Test");
        //a.agregaDireccion(1, "asd", "asdad", 49780, "asd",  50, 20);
        
        while(rs.next()){
            System.out.println("Nombre" + rs.getString("CALLE"));
            
        }

    }

}
