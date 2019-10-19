/*
    Proyecto Final | Base de datos | 2019-2 | Lechuga Martinez Jose Eduardo | joselechuga194@ciencias.unam.mx
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
