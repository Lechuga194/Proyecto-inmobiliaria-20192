/*
    Proyecto final | Lechuga Martinez José Eduardo | BD 
 */
package inmobiliaria;

import MVC.Vista;
import java.sql.SQLException;


/**
 *
 * @author josel
 */
public class Inmobiliaria {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {

        Vista vista = new Vista();
        vista.menu();
    }
}
