/*
    Proyecto Final | Base de datos | 2019-2 | Lechuga Martinez Jose Eduardo | joselechuga194@ciencias.unam.mx
*/
package MVC;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lechuga194
 */
public class Controlador {

    Modelo modelo = new Modelo();
    ResultSet rs;

    public void consulta1() throws SQLException {
        rs = modelo.ConsultaCasa();
        while (rs.next()) {
            System.out.println("Numero de registro: " + rs.getInt("NUMREGISTRO")
                    + " Valor catastral: $" + rs.getInt("VALORCATASTRAL")
                    + "\nTipo de propiedad: " + rs.getString("TIPOPROPIEDAD")
                    + "\nMaterial: " + rs.getString("MATERIALCONSTRUCCION")
                    + "\nNumero de baños medios: " + rs.getString("NBAÑOSMEDIOS")
                    + "\nNumero de baños completos: " + rs.getString("NBAÑOSCOMPLETOS")
                    + "\nNumero de estacionamientos: " + rs.getString("NESTACIONAMIENTOS")
                    + "\nNumero de pisos: " + rs.getString("NPISOS")
                    + "\nTamaño habitable: " + rs.getString("TAMAÑOHABITABLEMETROS") + "m"
                    + "\nTamaño de terreno: " + rs.getString("TAMAÑOTERRENO") + "m"
                    + "\nFecha construccion: " + rs.getDate("FCONSTRUCCION"));
        }
    }

    public void consulta2() throws SQLException {
        rs = modelo.ConsultaDepartamento();
        while (rs.next()) {
            System.out.println("Numero de registro: " + rs.getInt("NUMREGISTRO")
                    + " Valor catastral: $" + rs.getInt("VALORCATASTRAL")
                    + "\nTipo de propiedad: " + rs.getString("TIPOPROPIEDAD")
                    + "\nMaterial: " + rs.getString("MATERIALCONSTRUCCION")
                    + "\nNumero de baños medios: " + rs.getString("NBAÑOSMEDIOS")
                    + "\nNumero de baños completos: " + rs.getString("NBAÑOSCOMPLETOS")
                    + "\nNumero de estacionamientos: " + rs.getString("NESTACIONAMIENTOS")
                    + "\nTamaño habitable: " + rs.getString("TAMAÑOHABITABLEMETROS") + "m"
                    + "\nTamaño de terreno: " + rs.getString("TAMAÑOTERRENO") + "m"
                    + "\nFecha construccion: " + rs.getDate("FCONSTRUCCION"));
        }
    }

    public void consulta3() throws SQLException {
        rs = modelo.ConsultaTerreno();
        while (rs.next()) {
            System.out.println("Numero de registro: " + rs.getInt("NUMREGISTRO")
                    + "\nValor catastral: $" + rs.getInt("VALORCATASTRAL")
                    + "\nCuenta con constricciones?: " + rs.getString("EXISTECONSTRUCCION"));
        }
    }

    public void consulta4() throws SQLException {
        rs = modelo.ConsultaAsesores();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt("IDASESOR") + " NOMBRE: " + rs.getString("NOMBRE")
                    + " Sueldo: " + rs.getInt("SUELDO") + " Empresa: " + rs.getInt("IDEMPRESA"));
        }
    }

    public void consulta5() throws SQLException {
        rs = modelo.ConsultaDueño();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt("IDDUEÑO") + " NOMBRE: " + rs.getString("NOMBRE"));
        }
    }

    public void consulta6() throws SQLException {
        rs = modelo.ConsultaDirecciones();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt("IDDIRECCION") + "Calle: " + rs.getString("Calle"));
        }
    }

    public void consulta7() throws SQLException {
        rs = modelo.ConsultaCaracteristicas();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt("IDCARACTERISTICA") + "NOMBRE: " + rs.getString("NOMBRE") + " Descripcion: " + rs.getString("DESCRIPCION"));
        }
    }

    public void consulta8() throws SQLException {
        rs = modelo.ConsultaAmenidades();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt("IDAMENIDAD") + "NOMBRE: " + rs.getString("NOMBRE") + " Descripcion: " + rs.getString("DESCRIPCION"));
        }
    }

    public void consulta9() throws SQLException {
        rs = modelo.ConsultaServicios();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt("IDSERVICIO") + "NOMBRE: " + rs.getString("NOMBRE") + " Descripcion: " + rs.getString("DESCRIPCION") + " Precio: $)" + rs.getInt("PRECIOANUAL"));
        }
    }

    public void consulta10() throws SQLException {
        rs = modelo.ConsultaSeguros();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt("NUMPOLIZA") + "Aseguradora: " + rs.getString("ASEGURADORA") + " Tipo: " + rs.getString("TIPOCOVERTURA") + "Precio: $" + rs.getInt("PRECIOANUAL"));
        }
    }

    public void consulta11() throws SQLException {
        rs = modelo.ConsultaEmpresas();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt("IDEMPRESA") + "NOMBRE: " + rs.getString("NOMBRE"));
        }
    }

    public void consulta12() throws SQLException {
        rs = modelo.ConsultaPropiedadesEmpresa();
        while (rs.next()) {
            System.out.println(rs.getString(1));
        }
    }

    public void consulta13(String numregistro) throws SQLException {
        rs = modelo.CasasPorAsesores(numregistro);
        while (rs.next()) {
            System.out.println("ID del asesor: " + rs.getInt(2));
        }
    }

    public void consulta14(String numregistro) throws SQLException {
        rs = modelo.DepartamentosPorAsesores(numregistro);
        while (rs.next()) {
            System.out.println("ID del asesor: " + rs.getInt(2));
        }
    }

    public void consulta15(String numregistro) throws SQLException {
        rs = modelo.TerrenosPorAsesores(numregistro);
        while (rs.next()) {
            System.out.println("ID del asesor: " + rs.getInt(2));
        }
    }

    public void consulta16(String numregistro) throws SQLException {
        rs = modelo.PrecioCasa(numregistro);
        while (rs.next()) {
            System.out.println("Fecha: " + rs.getDate(2) + " Precio: $" + rs.getInt(3));
        }
    }

    public void consulta17(String numregistro) throws SQLException {
        rs = modelo.PrecioDepartamento(numregistro);
        while (rs.next()) {
            System.out.println("Fecha: " + rs.getDate(2) + " Precio: $" + rs.getInt(3));
        }
    }

    public void consulta18(String numregistro) throws SQLException {
        rs = modelo.PrecioTerreno(numregistro);
        while (rs.next()) {
            System.out.println("Fecha: " + rs.getDate(2) + " Precio: $" + rs.getInt(3));
        }
    }

    public void consulta19(String numregistro) throws SQLException {
        rs = modelo.ExDueñosCasa(numregistro);
        while (rs.next()) {
            System.out.println("IDDUEÑO: " + rs.getInt(1) + "Fecha recesion: " + rs.getDate(3) + "Fecha aquisicion: " + rs.getDate(4));
        }
    }

    public void consulta20(String numregistro) throws SQLException {
        rs = modelo.ExDueñosDepartamento(numregistro);
        while (rs.next()) {
            System.out.println("IDDUEÑO: " + rs.getInt(1) + "Fecha recesion: " + rs.getDate(3) + "Fecha aquisicion: " + rs.getDate(4));
        }
    }

    public void consulta21(String numregistro) throws SQLException {
        rs = modelo.ExDueñosTerreno(numregistro);
        while (rs.next()) {
            System.out.println("IDDUEÑO: " + rs.getInt(1) + "Fecha recesion: " + rs.getDate(3) + "Fecha aquisicion: " + rs.getDate(4));
        }
    }

    ////////////////////ZONA DE INSERCION DE FILAS///////////////////////
    public void inserta1(int valorCatastral, String material,
            int nbmedios, int nbcompletos, int nestaciona, int nhabita,
            int npisos, int tamhabitable, int tamterreno, String estadoConstruccion,
            int dia, int mes, int año) throws SQLException {
        modelo.AgregaCasa(valorCatastral, material, nbmedios, nbcompletos, nestaciona, nhabita, npisos, tamhabitable, tamterreno, estadoConstruccion, dia, mes, año);
    }

    public void inserta2(int valorCatastral, String material,
            int nbmedios, int nbcompletos, int nestaciona, int nhabita,
            int tamhabitable, int tamterreno, String estadoConstruccion,
            int dia, int mes, int año, int ubicado, int totalEdif,
            int mantenimiento) throws SQLException {
        modelo.AgregaDepartamento(valorCatastral, material, nbmedios, nbcompletos, nestaciona, nhabita, tamhabitable, tamterreno, estadoConstruccion, dia, mes, año, ubicado, totalEdif, mantenimiento);
    }

    public void inserta3(int valorCatastral, String existe) throws SQLException {
        modelo.AgregaTerreno(valorCatastral, existe);
    }

    public void inserta4(String nombre) throws SQLException {
        modelo.AgregaEmpresa(nombre);
    }

    public void inserta5(int empresa, int diaN, int mesN, int añoN, String nombre,
            String aPaterno, String aMaterno, int diaI, int mesI, int añoI, int sueldo) throws SQLException {
        modelo.AgregaAsesor(empresa, diaN, mesN, añoN, nombre, aPaterno, aMaterno, diaI, mesI, añoI, sueldo);
    }

    public void inserta6(int dia, int mes, int año, String nombre, String aPaterno,
            String aMaterno) throws SQLException {
        modelo.AgregaDueño(dia, mes, año, nombre, aPaterno, aMaterno);
    }

    public void inserta7(String nombre) throws SQLException {
        modelo.AgregaColonia(nombre);
    }

    public void inserta8(int colonia, String estado, String municipio, int CP,
            String calle, int ext, int inte) throws SQLException {
        modelo.AgregaDireccion(colonia, estado, municipio, CP, calle, ext, inte);
    }

    public void inserta9(String nombre, String descripcion) throws SQLException {
        modelo.AgregaAmenidad(nombre, descripcion);
    }

    public void inserta10(String nombre, String descripcion) throws SQLException {
        modelo.AgregaCaracteristica(nombre, descripcion);
    }

    public void inserta11(String nombre, String descripcion, int precio) throws SQLException {
        modelo.AgregaServicio(nombre, descripcion, precio);
    }

    public void inserta12(String aseguradora, String tipo, int precio) throws SQLException {
        modelo.AgregaSeguro(aseguradora, tipo, precio);
    }

    public void inserta13(String nombre, int colonia) throws SQLException {
        modelo.AgregaColoniaEscuela(nombre, colonia);
    }

    public void inserta14(String nombre, int colonia) throws SQLException {
        modelo.AgregaColoniaHospital(nombre, colonia);
    }

    public void inserta15(String nombre, int colonia) throws SQLException {
        modelo.AgregaColoniaRecreativo(nombre, colonia);
    }

    public void inserta16(String nombre, int colonia) throws SQLException {
        modelo.AgregaColoniaTransporte(nombre, colonia);
    }
    
    ///////////////////// ZONA DE ELIMINACION DE LA BD ////////////////////////
    
    public void Elimina1(int amenidad) throws SQLException {
        modelo.EliminaAmenidad(amenidad);
    }
    
    public void Elimina2(int asesor) throws SQLException {
        modelo.EliminaAsesor(asesor);
    }
    
    public void Elimina3(int caracteristica) throws SQLException {
        modelo.EliminaCaracteristica(caracteristica);
    }
    
    public void Elimina4(int numregistro) throws SQLException {
        modelo.EliminaCasa(numregistro);
    }
    
    public void Elimina5(int colonia) throws SQLException {
        modelo.EliminaColonia(colonia);
    }
    
    public void Elimina6(int curp) throws SQLException {
        modelo.EliminaCURP(curp);
    }
    
    public void Elimina7(int numregistro) throws SQLException {
        modelo.EliminaDepartamento(numregistro);
    }
    
    public void Elimina8(int direccion) throws SQLException {
        modelo.EliminaDireccion(direccion);
    }
    
    public void Elimina9(int dueño) throws SQLException {
        modelo.EliminaDueño(dueño);
    }
    
    public void Elimina10(int empresa) throws SQLException {
        modelo.EliminaEmpresa(empresa);
    }
    
    public void Elimina11(int rfc) throws SQLException {
        modelo.EliminaRFC(rfc);
    }
    
    public void Elimina12(int seguro) throws SQLException {
        modelo.EliminaSeguro(seguro);
    }
    
    public void Elimina13(int servicio) throws SQLException {
        modelo.EliminaServicio(servicio);
    }
    
    public void Elimina14(int numregistro) throws SQLException {
        modelo.EliminaTerreno(numregistro);
    }
    
    //////////// ZONA DE ACTUALIZACION EN LA BD ///////////////////////////
    
    public void ActualizaAmenidadNombre(String nombre, int idamenidad) throws SQLException {
        modelo.ActualizaAmenidadNombre(nombre, idamenidad);
    }
    
    public void ActualizaAmenidadDescripcion(String descripcion, int idamenidad) throws SQLException {
        modelo.ActualizaAmenidadDescripcion(descripcion, idamenidad);
    }
    
    public void ActualizaAsesorSueldo(int sueldo, int idasesor) throws SQLException {
        modelo.ActualizaAsesorSueldo(sueldo, idasesor);
    }
    
    public void ActualizaCaracteristicaNombre(String nombre, int idcaracteristica) throws SQLException {
        modelo.ActualizaCaracteristicaNombre(nombre, idcaracteristica);
    }
    
    public void ActualizaCaracteristicaDescripcion(String descripcion, int idcaracteristica) throws SQLException {
        modelo.ActualizaCaracteristicaDescripcion(descripcion, idcaracteristica);
    }
    
    public void ActualizaCasaValorCatastral(int numreg, int valor) throws SQLException{
        modelo.ActualizaCasaValorCatastral(numreg, valor);
    }
    
    public void ActualizaCasaMaterialConstruccion(int numreg, String material) throws SQLException{
        modelo.ActualizaCasaMaterialConstruccion(numreg, material);
    }
    
    public void ActualizaCasaNBañosMedios(int numreg, int baño) throws SQLException{
        modelo.ActualizaCasaNBañosMedios(numreg, baño);
    }
    
    public void ActualizaCasaNBañosCompletos(int numreg, int baño) throws SQLException{
        modelo.ActualizaCasaNBañosCompletos(numreg, baño);
    }
    
    public void ActualizaCasaNEstacionamientos(int numreg, int estacio) throws SQLException{
        modelo.ActualizaCasaNEstacionamientos(numreg, estacio);
    }
    
    public void ActualizaCasaNHabitaciones(int numreg, int habitaciones) throws SQLException{
        modelo.ActualizaCasaNHabitaciones(numreg, habitaciones);
    }
    
    public void ActualizaCasaNPisos(int numreg, int pisos) throws SQLException{
        modelo.ActualizaCasaNPisos(numreg, pisos);
    }
    
    public void ActualizaCasaTamañoHabitable(int numreg, int tam) throws SQLException{
        modelo.ActualizaCasaTamañoHabitable(numreg, tam);
    }
    
    public void ActualizaCasaTamañoTerreno(int numreg, int tam) throws SQLException{
        modelo.ActualizaCasaTamañoTerreno(numreg, tam);
    }
    
    public void ActualizaCasaEstadoHabitable(int numreg, String estado) throws SQLException{
        modelo.ActualizaCasaEstadoHabitable(numreg, estado);
    }
    
    public void ActualizaDepartamentoValorCatastral(int numreg, int valor) throws SQLException{
        modelo.ActualizaDepartamentoValorCatastral(numreg, valor);
    }
    
    public void ActualizaDepartamentoTipoPropiedad(int numreg, String tipo) throws SQLException{
        modelo.ActualizaDepartamentoTipoPropiedad(numreg, tipo);
    }
    
     public void ActualizaDepartamentoMaterialConstruccion(int numreg, String material) throws SQLException{
         modelo.ActualizaDepartamentoMaterialConstruccion(numreg, material);
     }
    
    public void ActualizaDepartamentoNBañosMedios(int numreg, int baño) throws SQLException{
        modelo.ActualizaDepartamentoNBañosMedios(numreg, baño);
    }
    
    public void ActualizaDepartamentoNBañosCompletos(int numreg, int baño) throws SQLException{
        modelo.ActualizaDepartamentoNBañosCompletos(numreg, baño);
    }
    
    public void ActualizaDepartamentoNEstacionamientos(int numreg, int estacio) throws SQLException{
        modelo.ActualizaDepartamentoNEstacionamientos(numreg, estacio);
    }
    
    public void ActualizaDepartamentoNHabitaciones(int numreg, int habitaciones) throws SQLException{
        modelo.ActualizaDepartamentoNHabitaciones(numreg, habitaciones);
    }
    
    public void ActualizaDepartamentoTamañoHabitable(int numreg, int tam) throws SQLException{
        modelo.ActualizaDepartamentoTamañoHabitable(numreg, tam);
    }
    
    public void ActualizaDepartamentoTamañoTerreno(int numreg, int tam) throws SQLException{
        modelo.ActualizaDepartamentoTamañoTerreno(numreg, tam);
    }
    
    public void ActualizaDepartamentoEstadoHabitable(int numreg, String estado) throws SQLException{
        modelo.ActualizaDepartamentoEstadoHabitable(numreg, estado);
    }
    
    public void ActualizaDepartamentoMantenimiento(int numreg, int precio) throws SQLException{
        modelo.ActualizaDepartamentoMantenimiento(numreg, precio);
    }
    
    public void ActualizaTerrenoValorCatastral(int numreg, int valor) throws SQLException{
        modelo.ActualizaTerrenoValorCatastral(numreg, valor);
    }
    
    public void ActualizaExisteConstruccion(int numreg, String existe) throws SQLException{
        modelo.ActualizaExisteConstruccion(numreg, existe);
    }
    
}
