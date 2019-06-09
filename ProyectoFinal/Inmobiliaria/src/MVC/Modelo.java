/*
    Proyecto Final | Base de datos | 2019-2 | Lechuga Martinez Jose Eduardo | joselechuga194@ciencias.unam.mx
*/
package MVC;

import conectividad.OracleJDBCExample;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Lechuga194
 */
public class Modelo {

    String consulta, inserta, elimina, actualiza;
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

    public ResultSet ConsultaPropiedadesEmpresa() throws SQLException {
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
    public void AgregaCasa(int valorCatastral, String material,
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
     *
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
    public void AgregaDepartamento(int valorCatastral, String material,
            int nbmedios, int nbcompletos, int nestaciona, int nhabita,
            int tamhabitable, int tamterreno, String estadoConstruccion,
            int dia, int mes, int año, int ubicado, int totalEdif,
            int mantenimiento) throws SQLException {
        inserta = "INSERT INTO DEPARTAMENTO VALUES (DEFAULT," + valorCatastral + ","
                + "'departamento','" + material + "','" + nbmedios + "','" + nbcompletos
                + "','" + nestaciona + "','" + nhabita + "','"
                + tamhabitable + "','" + tamterreno + "','" + estadoConstruccion
                + "','" + dia + "/" + mes + "/" + año + "','"
                + ubicado + "','" + totalEdif + "','" + mantenimiento + "')";

        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega un terreno
     *
     * @param valorCatastral
     * @param existe
     * @throws SQLException
     */
    public void AgregaTerreno(int valorCatastral, String existe) throws SQLException {
        inserta = "INSERT INTO TERRENO VALUES (DEFAULT, " + valorCatastral + ",'" + existe + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega una nueva empresa a la base
     *
     * @param nombre
     * @throws java.sql.SQLException
     */
    public void AgregaEmpresa(String nombre) throws SQLException {
        inserta = "INSERT INTO EMPRESA VALUES (DEFAULT, '" + nombre + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega un asesor a la bd
     *
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
    public void AgregaAsesor(int empresa, int diaN, int mesN, int añoN, String nombre,
            String aPaterno, String aMaterno, int diaI, int mesI, int añoI, int sueldo) throws SQLException {
        inserta = "INSERT INTO ASESOR VALUES (DEFAULT, " + empresa + ",'"
                + diaN + "/" + mesN + "/" + añoN + "', '" + nombre
                + "', '" + aPaterno + "', '" + aMaterno + "', '" + diaI + "/"
                + mesI + "/" + añoI + "', " + sueldo + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega un dueño a la bd
     *
     * @param dia
     * @param mes
     * @param año
     * @param nombre
     * @param aPaterno
     * @param aMaterno
     * @throws SQLException
     */
    public void AgregaDueño(int dia, int mes, int año, String nombre, String aPaterno,
            String aMaterno) throws SQLException {
        inserta = "INSERT INTO DUEÑO VALUES (DEFAULT, '" + dia + "/" + mes + "/" + año + "', '" + nombre + "', '" + aPaterno + "', '" + aMaterno + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega una colonia a la BD
     *
     * @param nombre
     * @throws SQLException
     */
    public void AgregaColonia(String nombre) throws SQLException {
        inserta = "INSERT INTO COLONIA VALUES (DEFAULT, '" + nombre + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega una direccion a la BD
     *
     * @param colonia
     * @param estado
     * @param municipio
     * @param CP
     * @param calle
     * @param ext
     * @param inte
     * @throws SQLException
     */
    public void AgregaDireccion(int colonia, String estado, String municipio, int CP,
            String calle, int ext, int inte) throws SQLException {
        inserta = "INSERT INTO DIRECCION VALUES (DEFAULT, " + colonia + ", '"
                + estado + "', '" + municipio + "'," + CP + ",'" + calle
                + "', " + ext + "," + inte + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega una nueva amenidad a la bd
     *
     * @param nombre
     * @param descripcion
     * @throws SQLException
     */
    public void AgregaAmenidad(String nombre, String descripcion) throws SQLException {
        inserta = "INSERT INTO AMENIDAD VALUES (DEFAULT, '" + nombre + "', '" + descripcion + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega una nueva caracteristica a la BD
     *
     * @param nombre
     * @param descripcion
     * @throws SQLException
     */
    public void AgregaCaracteristica(String nombre, String descripcion) throws SQLException {
        inserta = "INSERT INTO CARACTERISTICA VALUES (DEFAULT, '" + nombre + "', '" + descripcion + "')";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega un nuevo servicio a la BD
     *
     * @param nombre
     * @param descripcion
     * @param precio
     * @throws SQLException
     */
    public void AgregaServicio(String nombre, String descripcion, int precio) throws SQLException {
        inserta = "INSERT INTO SERVICIO VALUES (DEFAULT, '" + nombre + "', '" + descripcion + "'," + precio + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega un seguro a la BD
     *
     * @param aseguradora
     * @param tipo
     * @param precio
     * @throws SQLException
     */
    public void AgregaSeguro(String aseguradora, String tipo, int precio) throws SQLException {
        inserta = "INSERT INTO SERVICIO VALUES (DEFAULT, '" + aseguradora + "', '" + tipo + "'," + precio + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Agrega una escuela cercana a una colonia
     *
     * @param nombre
     * @param colonia
     * @throws SQLException
     */
    public void AgregaColoniaEscuela(String nombre, int colonia) throws SQLException {
        inserta = "INSERT INTO ESCUELAS_CERCANAS VALUES ('" + nombre + "'," + colonia + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Agrega un hospital cercano a una colonia
     *
     * @param nombre
     * @param colonia
     * @throws SQLException
     */
    public void AgregaColoniaHospital(String nombre, int colonia) throws SQLException {
        inserta = "INSERT INTO HOSPITALES_CERCANOS VALUES ('" + nombre + "'," + colonia + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega un recreativo a una colonia
     *
     * @param nombre
     * @param colonia
     * @throws SQLException
     */
    public void AgregaColoniaRecreativo(String nombre, int colonia) throws SQLException {
        inserta = "INSERT INTO RECREATIVOS_CERCANOS VALUES ('" + nombre + "'," + colonia + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    /**
     * Metodo que agrega un transporte cercano a la colonia
     *
     * @param nombre
     * @param colonia
     * @throws SQLException
     */
    public void AgregaColoniaTransporte(String nombre, int colonia) throws SQLException {
        inserta = "INSERT INTO TRANSPORTES_CERCANOS VALUES ('" + nombre + "'," + colonia + ")";
        Statement stmtConsulta = conexion.createStatement();
        stmtConsulta.execute(inserta);
    }

    //////////////////ZONA DE ELIMINACION EN LA BD/////////////////////////////////////////////////
    /**
     * Metodo que elimina una amenidad de la bd
     *
     * @param amenidad
     * @throws SQLException
     */
    public void EliminaAmenidad(int amenidad) throws SQLException {
        elimina = "DELETE FROM AMENIDAD WHERE IDAMENIDAD = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, amenidad);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina un asesor por su id
     *
     * @param asesor
     * @throws SQLException
     */
    public void EliminaAsesor(int asesor) throws SQLException {
        elimina = "DELETE FROM ASESOR WHERE IDASESOR = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, asesor);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina una caracteristica
     *
     * @param caracteristica
     * @throws SQLException
     */
    public void EliminaCaracteristica(int caracteristica) throws SQLException {
        elimina = "DELETE FROM CARACTERISTICA WHERE IDCARACTERISTICA = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, caracteristica);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina una casa por su numero de registro
     *
     * @param numregistro
     * @throws SQLException
     */
    public void EliminaCasa(int numregistro) throws SQLException {
        elimina = "DELETE FROM CASA WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, numregistro);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina una colonia por el id
     *
     * @param colonia
     * @throws SQLException
     */
    public void EliminaColonia(int colonia) throws SQLException {
        elimina = "DELETE FROM COLONIA WHERE IDCOLONIA = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, colonia);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina un curp de la bd
     *
     * @param curp
     * @throws SQLException
     */
    public void EliminaCURP(int curp) throws SQLException {
        elimina = "DELETE FROM CURP WHERE IDCURP = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, curp);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina un departamento de la bd
     *
     * @param numregistro
     * @throws SQLException
     */
    public void EliminaDepartamento(int numregistro) throws SQLException {
        elimina = "DELETE FROM DEPARTAMENTO WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, numregistro);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina una direccion de la bd
     *
     * @param direccion
     * @throws SQLException
     */
    public void EliminaDireccion(int direccion) throws SQLException {
        elimina = "DELETE FROM DIRECCION WHERE IDDIRECCION = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, direccion);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina un dueño de la bd
     *
     * @param dueño
     * @throws SQLException
     */
    public void EliminaDueño(int dueño) throws SQLException {
        elimina = "DELETE FROM DUEÑO WHERE IDDUEÑO = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, dueño);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina una empresa de la bd
     *
     * @param empresa
     * @throws SQLException
     */
    public void EliminaEmpresa(int empresa) throws SQLException {
        elimina = "DELETE FROM EMPRESA WHERE IDEMPRESA = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, empresa);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina un rfc de la bd
     *
     * @param rfc
     * @throws SQLException
     */
    public void EliminaRFC(int rfc) throws SQLException {
        elimina = "DELETE FROM RFC WHERE IDRFC = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, rfc);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina un seguro de la BD
     *
     * @param seguro
     * @throws SQLException
     */
    public void EliminaSeguro(int seguro) throws SQLException {
        elimina = "DELETE FROM SEGURO WHERE NUMPOLIZA = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, seguro);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina un servicio de la BD
     *
     * @param servicio
     * @throws SQLException
     */
    public void EliminaServicio(int servicio) throws SQLException {
        elimina = "DELETE FROM SERVICIO WHERE IDSERVICIO = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, servicio);
        pconsulta.executeQuery();
    }

    /**
     * Metodo que elimina un terreno de la BD
     *
     * @param numregistro
     * @throws SQLException
     */
    public void EliminaTerreno(int numregistro) throws SQLException {
        elimina = "DELETE FROM TERRENO WHERE NUMREGISTRO = ?";
        pconsulta = conexion.prepareStatement(elimina);
        pconsulta.setInt(1, numregistro);
        pconsulta.executeQuery();
    }

    //////////// ZONA DE ACTUALIZACION EN LA BD ///////////////////////////
    /**
     * Metodo que cambia el nombre de una amenidad por medio de su id
     *
     * @param nombre
     * @param idamenidad
     * @throws SQLException
     */
    public void ActualizaAmenidadNombre(String nombre, int idamenidad) throws SQLException {
        actualiza = "UPDATE AMENIDAD SET NOMBRE = '" + nombre + "' WHERE IDAMENIDAD = " + idamenidad;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }

    /**
     * Metodo que actualiza la descripcion de una amenidad
     *
     * @param descripcion
     * @param idamenidad
     * @throws SQLException
     */
    public void ActualizaAmenidadDescripcion(String descripcion, int idamenidad) throws SQLException {
        actualiza = "UPDATE AMENIDAD SET DESCRIPCION = '" + descripcion + "' WHERE IDAMENIDAD = " + idamenidad;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }

    /**
     * Metodo que actualiza el sueldo de un asesor
     * @param sueldo
     * @param idasesor
     * @throws SQLException 
     */
    public void ActualizaAsesorSueldo(int sueldo, int idasesor) throws SQLException {
        actualiza = "UPDATE ASESOR SET SUELDO = " + sueldo + "WHERE IDASESOR =" + idasesor;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el nombre de una caracteristica
     * @param nombre
     * @param idcaracteristica
     * @throws SQLException 
     */
    public void ActualizaCaracteristicaNombre(String nombre, int idcaracteristica) throws SQLException {
        actualiza = "UPDATE CARACTERISTICA SET NOMBRE = '" + nombre + "' WHERE IDCARACTERISTICA = " + idcaracteristica;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }

    /**
     * Metodo que actualiza la descripcion de una caracteristica
     * @param descripcion
     * @param idcaracteristica
     * @throws SQLException 
     */
    public void ActualizaCaracteristicaDescripcion(String descripcion, int idcaracteristica) throws SQLException {
        actualiza = "UPDATE CARACTERISTICA SET DESCRIPCION = '" + descripcion + "' WHERE IDCARACTERISTICA = " + idcaracteristica;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el valor catastral de una propiedad
     * @param numreg
     * @param valor
     * @throws SQLException 
     */
    public void ActualizaCasaValorCatastral(int numreg, int valor) throws SQLException{
        actualiza = "UPDATE CASA SET VALORCATASTRAL = " + valor + " WHERE NUMREGISTRO = " + numreg;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el tipo de propiedad
     * @param numreg
     * @param tipo
     * @throws SQLException 
     */
    public void ActualizaCasaTipoPropiedad(int numreg, String tipo) throws SQLException{
        actualiza = "UPDATE CASA SET TIPOPROPIEDAD = '" + tipo + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el material de la propiedad
     * @param numreg
     * @param material
     * @throws SQLException 
     */
    public void ActualizaCasaMaterialConstruccion(int numreg, String material) throws SQLException{
        actualiza = "UPDATE CASA SET MATERIALCONSTRUCCION = '" + material + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de baños medios de una propiedad
     * @param numreg
     * @param baño
     * @throws SQLException 
     */
    public void ActualizaCasaNBañosMedios(int numreg, int baño) throws SQLException{
        actualiza = "UPDATE CASA SET NBAÑOSMEDIOS = '" + baño + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de baños completos
     * @param numreg
     * @param baño
     * @throws SQLException 
     */
    public void ActualizaCasaNBañosCompletos(int numreg, int baño) throws SQLException{
        actualiza = "UPDATE CASA SET NBAÑOSCOMPLETOS = '" + baño + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de estacionamientos en una propiedad
     * @param numreg
     * @param estacio
     * @throws SQLException 
     */
    public void ActualizaCasaNEstacionamientos(int numreg, int estacio) throws SQLException{
        actualiza = "UPDATE CASA SET NESTACIONAMIENTOS = '" + estacio + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de habitaciones en una propiedad
     * @param numreg
     * @param habitaciones
     * @throws SQLException 
     */
    public void ActualizaCasaNHabitaciones(int numreg, int habitaciones) throws SQLException{
        actualiza = "UPDATE CASA SET NHABITACIONES = '" + habitaciones + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de pisos en una casa
     * @param numreg
     * @param pisos
     * @throws SQLException 
     */
    public void ActualizaCasaNPisos(int numreg, int pisos) throws SQLException{
        actualiza = "UPDATE CASA SET NPISOS = '" + pisos + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza los metros habitables de una casa
     * @param numreg
     * @param tam
     * @throws SQLException 
     */
    public void ActualizaCasaTamañoHabitable(int numreg, int tam) throws SQLException{
        actualiza = "UPDATE CASA SET TAMAÑOHABITABLEMETROS = '" + tam + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el tamaño del terreno
     * @param numreg
     * @param tam
     * @throws SQLException 
     */
    public void ActualizaCasaTamañoTerreno(int numreg, int tam) throws SQLException{
        actualiza = "UPDATE CASA SET TAMAÑOTERRENO = '" + tam + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el estado de una propeidad
     * @param numreg
     * @param estado
     * @throws SQLException 
     */
    public void ActualizaCasaEstadoHabitable(int numreg, String estado) throws SQLException{
        actualiza = "UPDATE CASA SET ESTADODECONSTRUCCION = '" + estado + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el nombre de la colonia
     * @param id
     * @param nombre
     * @throws SQLException 
     */
    public void ActualizaColoniaNombre(int id, String nombre) throws SQLException{
        actualiza = "UPDATE COLONIA SET NOMBRE = '" + nombre + "' WHERE IDCOLONIA = " + id;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
        /**
     * Metodo que actualiza el valor catastral de una propiedad
     * @param numreg
     * @param valor
     * @throws SQLException 
     */
    public void ActualizaDepartamentoValorCatastral(int numreg, int valor) throws SQLException{
        actualiza = "UPDATE Departamento SET VALORCATASTRAL = " + valor + " WHERE NUMREGISTRO = " + numreg;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el tipo de propiedad
     * @param numreg
     * @param tipo
     * @throws SQLException 
     */
    public void ActualizaDepartamentoTipoPropiedad(int numreg, String tipo) throws SQLException{
        actualiza = "UPDATE Departamento SET TIPOPROPIEDAD = '" + tipo + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el material de la propiedad
     * @param numreg
     * @param material
     * @throws SQLException 
     */
    public void ActualizaDepartamentoMaterialConstruccion(int numreg, String material) throws SQLException{
        actualiza = "UPDATE Departamento SET MATERIALCONSTRUCCION = '" + material + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de baños medios de una propiedad
     * @param numreg
     * @param baño
     * @throws SQLException 
     */
    public void ActualizaDepartamentoNBañosMedios(int numreg, int baño) throws SQLException{
        actualiza = "UPDATE Departamento SET NBAÑOSMEDIOS = '" + baño + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de baños completos
     * @param numreg
     * @param baño
     * @throws SQLException 
     */
    public void ActualizaDepartamentoNBañosCompletos(int numreg, int baño) throws SQLException{
        actualiza = "UPDATE Departamento SET NBAÑOSCOMPLETOS = '" + baño + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de estacionamientos en una propiedad
     * @param numreg
     * @param estacio
     * @throws SQLException 
     */
    public void ActualizaDepartamentoNEstacionamientos(int numreg, int estacio) throws SQLException{
        actualiza = "UPDATE Departamento SET NESTACIONAMIENTOS = '" + estacio + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el numero de habitaciones en una propiedad
     * @param numreg
     * @param habitaciones
     * @throws SQLException 
     */
    public void ActualizaDepartamentoNHabitaciones(int numreg, int habitaciones) throws SQLException{
        actualiza = "UPDATE Departamento SET NHABITACIONES = '" + habitaciones + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza los metros habitables de una Departamento
     * @param numreg
     * @param tam
     * @throws SQLException 
     */
    public void ActualizaDepartamentoTamañoHabitable(int numreg, int tam) throws SQLException{
        actualiza = "UPDATE Departamento SET TAMAÑOHABITABLEMETROS = '" + tam + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el tamaño del terreno
     * @param numreg
     * @param tam
     * @throws SQLException 
     */
    public void ActualizaDepartamentoTamañoTerreno(int numreg, int tam) throws SQLException{
        actualiza = "UPDATE Departamento SET TAMAÑOTERRENO = '" + tam + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el estado de una propeidad
     * @param numreg
     * @param estado
     * @throws SQLException 
     */
    public void ActualizaDepartamentoEstadoHabitable(int numreg, String estado) throws SQLException{
        actualiza = "UPDATE Departamento SET ESTADODECONSTRUCCION = '" + estado + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Actualiza el mantenimiento de un departamento
     * @param numreg
     * @param precio
     * @throws SQLException 
     */
    public void ActualizaDepartamentoMantenimiento(int numreg, int precio) throws SQLException{
        actualiza = "UPDATE Departamento SET MANTENIMIENTOANUAL = '" + precio + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza el valor catastral de una propiedad
     * @param numreg
     * @param valor
     * @throws SQLException 
     */
    public void ActualizaTerrenoValorCatastral(int numreg, int valor) throws SQLException{
        actualiza = "UPDATE Terreno SET VALORCATASTRAL = " + valor + " WHERE NUMREGISTRO = " + numreg;
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    }
    
    /**
     * Metodo que actualiza si existe una construccion en el terreno
     * @param numreg
     * @param existe
     * @throws SQLException 
     */
    public void ActualizaExisteConstruccion(int numreg, String existe) throws SQLException{
        actualiza = "UPDATE Terreno SET EXISTECONSTRUCCION = '" + existe + "' WHERE NUMREGISTRO = " + numreg; 
        Statement stmtActualizacion = conexion.createStatement();
        stmtActualizacion.execute(actualiza);
    } 

}
