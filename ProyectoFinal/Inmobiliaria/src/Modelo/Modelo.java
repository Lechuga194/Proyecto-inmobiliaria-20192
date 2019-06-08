/*
    Proyecto 2 | Modelado y Programación | LechugaEats
 */
package Modelo;

import conectividad.OracleJDBCExample;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Lechuga194
 */
public class Modelo {

    String consulta, inserta, elimina, auxiliar;
    OracleJDBCExample a = new OracleJDBCExample();
    Connection conexion = a.getConection();
    PreparedStatement pconsulta = null;

    ///////////////////////////// ZONA DE CONSULTA ///////////////////////////////////
    /**
     * Metodo que devuelve la consulta de todas las casas de la BD
     *
     * @return departamentos de la bd
     * @throws SQLException
     */
    public ResultSet ConsultaCasa() throws SQLException {
        consulta = "SELECT * FROM CASA";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todas los departamentos en la BD
     *
     * @return departamento en la bd
     * @throws SQLException
     */
    public ResultSet ConsultaDepartamento() throws SQLException {
        consulta = "SELECT * FROM DEPARTAMENTO";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todos los terrenos en la BD
     *
     * @return terrenos en la bd
     * @throws SQLException
     */
    public ResultSet ConsultaTerreno() throws SQLException {
        consulta = "SELECT * FROM TERRENO";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todos los asesores de la BD
     *
     * @return asesores de la bd
     * @throws SQLException
     */
    public ResultSet ConsultaAsesores() throws SQLException {
        consulta = "SELECT * FROM ASESOR";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todos los dueños de la BD
     *
     * @return dueños de la bd
     * @throws SQLException
     */
    public ResultSet ConsultaDueño() throws SQLException {
        consulta = "SELECT * FROM DUEÑO";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todas las direcciones
     *
     * @return direcciones registradas en la BD
     * @throws SQLException
     */
    public ResultSet ConsultaDirecciones() throws SQLException {
        consulta = "SELECT * FROM DIRECCION";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todas las caracteristicas de la BD
     *
     * @return caracteristicas
     * @throws SQLException
     */
    public ResultSet ConsultaCaracteristicas() throws SQLException {
        consulta = "SELECT * FROM Caracteristica";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todas las amenidades de la BD
     *
     * @return amenidades
     * @throws SQLException
     */
    public ResultSet ConsultaAmenidades() throws SQLException {
        consulta = "SELECT * FROM Amenidad";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todas los servicios de la BD
     *
     * @return servicios
     * @throws SQLException
     */
    public ResultSet ConsultaServicios() throws SQLException {
        consulta = "SELECT * FROM Servicio";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todas los seguros de la BD
     *
     * @return
     * @throws SQLException
     */
    public ResultSet ConsultaSeguros() throws SQLException {
        consulta = "SELECT * FROM Seguro";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    /**
     * Metodo que devuelve la consulta de todas las amenidades de la BD
     *
     * @return
     * @throws SQLException
     */
    public ResultSet ConsultaEmpresas() throws SQLException {
        consulta = "SELECT * FROM Empresa";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    public ResultSet PropiedadesEmpresa() throws SQLException {
        consulta = "SELECT *\n"
                + "FROM EMPRESA\n"
                + "JOIN CASA_EMPRESA\n"
                + "ON (EMPRESA.IDEMPRESA = CASA_EMPRESA.IDEMPRESA)\n"
                + "JOIN DEPARTAMENTO_EMPRESA\n"
                + "ON (EMPRESA.IDEMPRESA = DEPARTAMENTO_EMPRESA.IDEMPRESA)\n"
                + "JOIN TERRENO_EMPRESA\n"
                + "ON (EMPRESA.IDEMPRESA = TERRENO_EMPRESA.IDEMPRESA)";
        Statement stmtConsulta = conexion.createStatement();
        ResultSet rs = stmtConsulta.executeQuery(consulta);
        return rs;
    }

    ///////////// ZONA DE CONSULTA CON PARAMETROS ///////////////////////
    /**
     * Metodo que recibe el numero de registro de la propiedad
     *
     * @param numRegistro
     * @return regresa los asesores que la tienen asignada
     * @throws SQLException
     */
    public ResultSet CasasPorAsesores(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM CASA_ASESOR WHERE NUMREGISTRO = ?";
        PreparedStatement pconsulta = null;
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que recibe el numero de registro de la propiedad
     *
     * @param numRegistro
     * @return regresa los asesores que la tienen asignada
     * @throws SQLException
     */
    public ResultSet DepartamentosPorAsesores(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM DEPARTAMENTO_ASESOR WHERE NUMREGISTRO = ?";
        PreparedStatement pconsulta = null;
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que recibe el numero de registro de la propiedad
     *
     * @param numRegistro
     * @return regresa los asesores que la tienen asignada
     * @throws SQLException
     */
    public ResultSet TerrenosPorAsesores(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM TERRENO_ASESOR WHERE NUMREGISTRO = ?";
        PreparedStatement pconsulta = null;
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa todas las asignaciones que tiene un asesor
     *
     * @param idasesor
     * @return caracteristicas
     * @throws SQLException
     */
    public ResultSet AsignacionDeAsesor(String idasesor) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM ASESOR\n"
                + "RIGHT JOIN CASA_ASESOR\n"
                + "ON (ASESOR.IDASESOR = CASA_ASESOR.IDASESOR)\n"
                + "RIGHT JOIN DEPARTAMENTO_ASESOR\n"
                + "ON (ASESOR.IDASESOR = DEPARTAMENTO_ASESOR.IDASESOR)\n"
                + "RIGHT JOIN TERRENO_ASESOR\n"
                + "ON (ASESOR.IDASESOR   = TERRENO_ASESOR.IDASESOR)\n"
                + "WHERE ASESOR.IDASESOR = ?";
        PreparedStatement pconsulta = null;
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, idasesor);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa las caracteristicas de una vivienda
     *
     * @param numRegistro
     * @return caracteristicas
     * @throws SQLException
     */
    public ResultSet CaracteristicasCasa(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM CASA_CARACTERISTICA\n"
                + "JOIN CARACTERISTICA\n"
                + "ON(CASA_CARACTERISTICA.IDCARACTERISTICA = CARACTERISTICA.IDCARACTERISTICA)\n"
                + "WHERE NUMREGISTRO                       = ?";
        PreparedStatement pconsulta = null;
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa las caracteristicas de una vivienda
     *
     * @param numRegistro
     * @return caracteristicas
     * @throws SQLException
     */
    public ResultSet CaracteristicasDepartamento(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM DEPARTAMENTO_CARACTERISTICA\n"
                + "JOIN CARACTERISTICA\n"
                + "ON(DEPARTAMENTO_CARACTERISTICA.IDCARACTERISTICA = CARACTERISTICA.IDCARACTERISTICA)\n"
                + "WHERE NUMREGISTRO                       = ?";
        PreparedStatement pconsulta = null;
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa las amenidades de una casa por medio de su numero de
     * registro
     *
     * @param numRegistro
     * @return amenidades
     * @throws SQLException
     */
    public ResultSet AmenidadesCasa(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM CASA_AMENIDAD\n"
                + "JOIN AMENIDAD\n"
                + "ON(CASA_AMENIDAD.IDAMENIDAD = AMENIDAD.IDAMENIDAD)\n"
                + "WHERE NUMREGISTRO                       = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa las amenidades de una casa por medio de su numero de
     * registro
     *
     * @param numRegistro
     * @return amenidades
     * @throws SQLException
     */
    public ResultSet AmenidadesDepartamento(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM DEPARTAMENTO_AMENIDAD\n"
                + "JOIN AMENIDAD\n"
                + "ON(DEPARTAMENTO_AMENIDAD.IDAMENIDAD = AMENIDAD.IDAMENIDAD)\n"
                + "WHERE NUMREGISTRO                       = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa los servicios de una casa por medio de su numero de
     * registro
     *
     * @param numRegistro
     * @return Servicios
     * @throws SQLException
     */
    public ResultSet ServiciosCasa(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM CASA_SERVICIO\n"
                + "JOIN SERVICIO\n"
                + "ON(CASA_SERVICIO.IDSERVICIO = SERVICIO.IDSERVICIO)\n"
                + "WHERE NUMREGISTRO                       = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa los servicios de una casa por medio de su numero de
     * registro
     *
     * @param numRegistro
     * @return Servicios
     * @throws SQLException
     */
    public ResultSet ServiciosDepartamento(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM DEPARTAMENTO_SERVICIO\n"
                + "JOIN SERVICIO\n"
                + "ON(DEPARTAMENTO_SERVICIO.IDSERVICIO = SERVICIO.IDSERVICIO)\n"
                + "WHERE NUMREGISTRO                       = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa los servicios de una casa por medio de su numero de
     * registro
     *
     * @param numRegistro
     * @return Servicios
     * @throws SQLException
     */
    public ResultSet ServiciosTerreno(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM TERRENO_SERVICIO\n"
                + "JOIN SERVICIO\n"
                + "ON(TERRENO_SERVICIO.IDSERVICIO = SERVICIO.IDSERVICIO)\n"
                + "WHERE NUMREGISTRO                       = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa los seguros que tiene una vivienda
     *
     * @param numRegistro
     * @return Seguros
     * @throws SQLException
     */
    public ResultSet SeguroCasa(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM CASA_SEGURO\n"
                + "JOIN SEGURO\n"
                + "ON(SEGURO.NUMPOLIZA           = CASA_SEGURO.NUMPOLIZA)\n"
                + "WHERE CASA_SEGURO.NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa los seguros que tiene una vivienda
     *
     * @param numRegistro
     * @return Seguros
     * @throws SQLException
     */
    public ResultSet SeguroDepartamento(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM DEPARTAMENTO_SEGURO\n"
                + "JOIN SEGURO\n"
                + "ON(SEGURO.NUMPOLIZA           = DEPARTAMENTO_SEGURO.NUMPOLIZA)\n"
                + "WHERE DEPARTAMENTO_SEGURO.NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa los seguros que tiene una vivienda
     *
     * @param numRegistro
     * @return Seguros
     * @throws SQLException
     */
    public ResultSet SeguroTerreno(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM TERRENO_SEGURO\n"
                + "JOIN SEGURO\n"
                + "ON(SEGURO.NUMPOLIZA           = TERRENO_SEGURO.NUMPOLIZA)\n"
                + "WHERE TERRENO_SEGURO.NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa la direccion de una vivienda por medio del numero de
     * registro
     *
     * @param numRegistro
     * @return direccion
     * @throws SQLException
     */
    public ResultSet DireccionCasa(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM CASA\n"
                + "JOIN CASA_DIRECCION\n"
                + "ON(CASA.NUMREGISTRO = CASA_DIRECCION.NUMREGISTRO)\n"
                + "JOIN DIRECCION\n"
                + "ON(CASA_DIRECCION.IDDIRECCION = DIRECCION.IDDIRECCION)\n"
                + "JOIN COLONIA\n"
                + "ON (DIRECCION.IDCOLONIA = COLONIA.IDCOLONIA) WHERE CASA.NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa la direccion de una vivienda por medio del numero de
     * registro
     *
     * @param numRegistro
     * @return direccion
     * @throws SQLException
     */
    public ResultSet DireccionDepartamento(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM DEPARTAMENTO\n"
                + "JOIN DEPARTAMENTO_DIRECCION\n"
                + "ON(DEPARTAMENTO.NUMREGISTRO = DEPARTAMENTO_DIRECCION.NUMREGISTRO)\n"
                + "JOIN DIRECCION\n"
                + "ON(DEPARTAMENTO_DIRECCION.IDDIRECCION = DIRECCION.IDDIRECCION)\n"
                + "JOIN COLONIA\n"
                + "ON (DIRECCION.IDCOLONIA = COLONIA.IDCOLONIA) WHERE DEPARTAMENTO.NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que regresa la direccion de una vivienda por medio del numero de
     * registro
     *
     * @param numRegistro
     * @return direccion
     * @throws SQLException
     */
    public ResultSet DireccionTerreno(String numRegistro) throws SQLException {
        consulta = "SELECT *\n"
                + "FROM TERRENO\n"
                + "JOIN TERRENO_DIRECCION\n"
                + "ON(TERRENO.NUMREGISTRO = TERRENO_DIRECCION.NUMREGISTRO)\n"
                + "JOIN DIRECCION\n"
                + "ON(TERRENO_DIRECCION.IDDIRECCION = DIRECCION.IDDIRECCION)\n"
                + "JOIN COLONIA\n"
                + "ON (DIRECCION.IDCOLONIA = COLONIA.IDCOLONIA) WHERE TERRENO.NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Consulta el historial de precios de una propiedad
     *
     * @param numRegistro
     * @return precio
     * @throws SQLException
     */
    public ResultSet PrecioCasa(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM CASA_PRECIO WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Consulta el historial de precios de una propiedad
     *
     * @param numRegistro
     * @return precio
     * @throws SQLException
     */
    public ResultSet PrecioDepartamento(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM DEPARTAMENTO_PRECIO WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Consulta el historial de precios de una propiedad
     *
     * @param numRegistro
     * @return precio
     * @throws SQLException
     */
    public ResultSet PrecioTerreno(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM TERRENO_PRECIO WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que consulta los exdueños de una propiedad
     *
     * @param numRegistro
     * @return exdueños
     * @throws SQLException
     */
    public ResultSet ExDueñosCasa(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM CASA_EXDUEÑO WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que consulta los exdueños de una propiedad
     *
     * @param numRegistro
     * @return exdueños
     * @throws SQLException
     */
    public ResultSet ExDueñosDepartamento(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM CASA_EXDUEÑO WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    /**
     * Metodo que consulta los exdueños de una propiedad
     *
     * @param numRegistro
     * @return exdueños
     * @throws SQLException
     */
    public ResultSet ExDueñosTerreno(String numRegistro) throws SQLException {
        consulta = "SELECT * FROM CASA_EXDUEÑO WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(consulta);
        pconsulta.setString(1, numRegistro);
        ResultSet rs = pconsulta.executeQuery();
        return rs;
    }

    ///////// ZONA DE CREACION DE NUEVAS FILAS ///////////////////////////////////////////////////////////////
    
    /**
     * Metodo que agrega una casa a la BD
     *
     * @param valorCatastral
     * @param material
     * @param nbmedios
     * @param nbcompletos
     * @param nestaciona
     * @param nhabita
     * @param npisos
     * @param tamhabitable
     * @param tamterreno
     * @param estadoConstruccion
     * @param dia
     * @param mes
     * @param año
     * @throws SQLException
     */
    public void agregaCasa(int valorCatastral, String material,
            int nbmedios, int nbcompletos, int nestaciona, int nhabita,
            int npisos, int tamhabitable, int tamterreno, String estadoConstruccion,
            int dia, int mes, int año) throws SQLException {
        inserta = "INSERT INTO CASA VALUES (DEFAULT," + valorCatastral + ","
                + "'casa','" + material + "','" + nbmedios + "','" + nbcompletos
                + "','" + nestaciona + "','" + nhabita + "','" + npisos + "','"
                + tamhabitable + "','" + tamterreno + "','" + estadoConstruccion
                + "','" + dia + "/" + mes + "/" + año + "')";

        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }
    
    /**
     * Metodo que inserta un edificio
     * @param valorCatastral
     * @param material
     * @param nbmedios
     * @param nbcompletos
     * @param nestaciona
     * @param nhabita
     * @param tamhabitable
     * @param tamterreno
     * @param estadoConstruccion
     * @param dia
     * @param mes
     * @param año
     * @param ubicado
     * @param totalEdif
     * @param mantenimiento
     * @throws SQLException 
     */
    public void agregaDepartamento(int valorCatastral, String material,
            int nbmedios, int nbcompletos, int nestaciona, int nhabita,
            int tamhabitable, int tamterreno, String estadoConstruccion,
            int dia, int mes, int año, int ubicado, int totalEdif,
            int mantenimiento) throws SQLException{
        inserta = "INSERT INTO DEPARTAMENTO VALUES (DEFAULT," + valorCatastral + ","
                + "'departamento','" + material + "','" + nbmedios + "','" + nbcompletos
                + "','" + nestaciona + "','" + nhabita + "','"
                + tamhabitable + "','" + tamterreno + "','" + estadoConstruccion
                + "','" + dia + "/" + mes + "/" + año + "','" +
                ubicado + "','" + totalEdif + "','" + mantenimiento +  "')";
        
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega un terreno
     * @param valorCatastral
     * @param existe
     * @throws SQLException 
     */
    public void agregaTerreno(int valorCatastral, String existe) throws SQLException{
        inserta = "INSERT INTO TERRENO VALUES (DEFAULT, " + valorCatastral + ",'" + existe + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }
    
    /**
     * Metodo que agrega una nueva empresa a la base
     * @param nombre 
     * @throws java.sql.SQLException 
     */
    public void agregaEmpresa(String nombre) throws SQLException{
        inserta = "INSERT INTO EMPRESA VALUES (DEFAULT, '" + nombre + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }
    
    /**
     * Metodo que agrega un asesor a la bd
     * @param empresa
     * @param diaN
     * @param mesN
     * @param añoN
     * @param nombre
     * @param aPaterno
     * @param aMaterno
     * @param diaI
     * @param mesI
     * @param añoI
     * @param sueldo
     * @throws SQLException 
     */
    public void agregaAsesor(int empresa, int diaN, int mesN, int añoN, String nombre,
            String aPaterno, String aMaterno, int diaI, int mesI, int añoI, int sueldo) throws SQLException{
        inserta = "INSERT INTO ASESOR VALUES (DEFAULT, " + empresa + ",'"
                + diaN + "/" + mesN + "/" + añoN + "', '" + nombre 
                + "', '" + aPaterno + "', '" + aMaterno + "', '" + diaI + "/" 
                + mesI + "/" + añoI + "', " + sueldo + ")"; 
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }
    
    /**
     * Metodo que agrega un dueño a la bd
     * @param dia
     * @param mes
     * @param año
     * @param nombre
     * @param aPaterno
     * @param aMaterno
     * @throws SQLException 
     */
    public void agregaDueño(int dia, int mes, int año, String nombre, String aPaterno, 
            String aMaterno) throws SQLException{
        inserta = "INSERT INTO DUEÑO VALUES (DEFAULT, '" + dia + "/" + mes + "/" + año + "', '" + nombre + "', '" + aPaterno + "', '" + aMaterno + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }
    
    public void agregaColonia(String nombre) throws SQLException{
        inserta = "INSERT INTO COLONIA VALUES (DEFAULT, '" + nombre + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }
    
    public void agregaDireccion(int colonia, String estado, String municipio, int CP,
            String calle, int ext, int inte)throws SQLException{
        inserta = "INSERT INTO DIRECCION VALUES (DEFAULT, " + colonia + ", '" 
                + estado + "', '" + municipio + "'," + CP + ",'" + calle 
                + "', " + ext + "," + inte + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);        
    }
}
