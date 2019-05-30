/*
DDL.SQL Proyecto final | Lechuga Martínez José Eduardo | 314325749 | Joselechuga194@ciencias.unam.mx
*/
CREATE TABLE colonia
  (
    idColonia NUMBER,
    nombre    CHAR(50) NOT NULL,
    CONSTRAINT colonia_PK PRIMARY KEY (idColonia)
  );
CREATE TABLE tiendas_Cercanas
  (
    nombreTienda CHAR(250),
    idColonia    NUMBER,
    CONSTRAINT tiendas_Cercanas_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE, CONSTRAINT tiendas_Cercanas_PK PRIMARY KEY (nombreTienda)
  );
CREATE TABLE recreativos_Cercanos
  (
    nombreRecreativo CHAR(250),
    idColonia        NUMBER,
    CONSTRAINT recreativos_Cercanos_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE,
    CONSTRAINT recreativos_Cercanos_PK PRIMARY KEY (nombreRecreativo)
  );
CREATE TABLE escuelas_Cercanas
  (
    nombreEscuela CHAR(500),
    idColonia     NUMBER,
    CONSTRAINT Escuelas_Cercanas_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE, CONSTRAINT Escuelas_Cercanas_PK PRIMARY KEY (nombreEscuela)
  );
CREATE TABLE hospitales_Cercanos
  (
    nombreHospital CHAR(150),
    idColonia      NUMBER,
    CONSTRAINT hospitales_Cercanos_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE,
    CONSTRAINT hospitales_Cercanos_PK PRIMARY KEY (nombreHospital)
  );
CREATE TABLE transportes_Cercanos
  (
    nombreTransporte CHAR(250),
    idColonia        NUMBER,
    CONSTRAINT transportes_Cercanos_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE,
    CONSTRAINT transportes_Cercanos_PK PRIMARY KEY (nombreTransporte)
  );
CREATE TABLE direccion
  (
    idDireccion NUMBER,
    idColonia   NUMBER,
    estado      CHAR(50) DEFAULT 'No especificado' NOT NULL,
    municipio   CHAR(50) DEFAULT 'No especificado' NOT NULL,
    CP          CHAR(5) DEFAULT '00000' NOT NULL,
    calle       VARCHAR2(50) DEFAULT 'No especificado' NOT NULL,
    nExterior   CHAR(3) DEFAULT '000' NOT NULL,
    nInterior   CHAR(3) DEFAULT '000' NOT NULL,
    CONSTRAINT idColonia_direccio_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE, CONSTRAINT direccion_PK PRIMARY KEY (idDireccion)
  );
CREATE TABLE caracteristica
  (
    idCaracteristica NUMBER,
    nombre           CHAR(50),
    descripcion      VARCHAR2(150),
    CONSTRAINT caracteristica_PK PRIMARY KEY (idCaracteristica)
  );
CREATE TABLE amenidad
  (
    idAmenidad  NUMBER,
    nombre      CHAR(50),
    descripcion VARCHAR2(150),
    CONSTRAINT amenidad_PK PRIMARY KEY (idAmenidad)
  );
CREATE TABLE servicio
  (
    idServicio  NUMBER,
    nombre      CHAR(50),
    descripcion VARCHAR2(150),
    precioAnual NUMBER,
    CONSTRAINT servicio_PK PRIMARY KEY (idServicio)
  );
CREATE TABLE seguro
  (
    numPoliza     NUMBER,
    aseguradora   CHAR(50),
    tipoCovertura VARCHAR2(150),
    precioAnual   NUMBER,
    CONSTRAINT seguro_PK PRIMARY KEY (numPoliza)
  );
CREATE TABLE empresa
  (
    idEmpresa NUMBER,
    nombre    VARCHAR2(40),
    CONSTRAINT empresa_PK PRIMARY KEY (idEmpresa)
  );
CREATE TABLE RFC
  ( 
  	idRFC NUMBER,
  	RFC CHAR(13) UNIQUE,
  	CONSTRAINT RFC_PK PRIMARY KEY (idRFC)
  );
CREATE TABLE asesor
  (
    idEmpleado  NUMBER,
    idEmpresa   NUMBER,
    fNacimiento DATE NOT NULL,
    nombre      VARCHAR2(25) NOT NULL,
    aPaterno    VARCHAR2(25) NOT NULL,
    aMaterno    VARCHAR2(25) NOT NULL,
    fIngreso    DATE DEFAULT SYSDATE NOT NULL,
    sueldo      NUMBER NOT NULL,
    CONSTRAINT idEmpresa_asesor_FK FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa) ON
  DELETE CASCADE, CONSTRAINT asesor_PK PRIMARY KEY (idEmpleado)
  );
CREATE TABLE asesor_RFC
  (
    idEmpleado NUMBER,
    idRFC NUMBER,
    CONSTRAINT idEmpleado_RFC_FK FOREIGN KEY (idEmpleado) REFERENCES asesor (idEmpleado) ON
  DELETE CASCADE,
    CONSTRAINT RFC_RFC_FK FOREIGN KEY (RFC) REFERENCES RFC (idRFC) ON
  DELETE CASCADE, CONSTRAINT asesor_RFC_PK PRIMARY KEY (idEmpleado, idRFC)
  );
CREATE TABLE asesor_email
  (
    correo     VARCHAR2(500),
    idEmpleado NUMBER,
    CONSTRAINT asesor_email_FK FOREIGN KEY (idEmpleado) REFERENCES asesor (idEmpleado) ON
  DELETE CASCADE, CONSTRAINT asesor_email_PK PRIMARY KEY (correo)
  );
CREATE TABLE asesor_telefono
  (
    telefono   CHAR(12),
    idEmpleado NUMBER,
    CONSTRAINT asesor_telefono_FK FOREIGN KEY (idEmpleado) REFERENCES asesor (idEmpleado) ON
  DELETE CASCADE, CONSTRAINT asesor_telefono_PK PRIMARY KEY (telefono)
  );
CREATE TABLE dueño
  (
    CURP        CHAR(18),
    fNacimiento DATE NOT NULL,
    nombre      CHAR(50),
    aPAterno    CHAR(50),
    aMAterno    CHAR(50),
    CONSTRAINT dueño_PK PRIMARY KEY (CURP)
  );
CREATE TABLE dueño_email
  (
    correo VARCHAR2(500),
    CURP   CHAR(18),
    CONSTRAINT dueño_email_CURP_FK FOREIGN KEY (CURP) REFERENCES dueño (CURP) ON
  DELETE CASCADE, CONSTRAINT dueño_email_PK PRIMARY KEY (correo)
  );
CREATE TABLE dueño_telefono
  (
    telefono CHAR(12),
    CURP     CHAR(18),
    CONSTRAINT dueño_telefono_CURP_FK FOREIGN KEY (CURP) REFERENCES dueño (CURP) ON
  DELETE CASCADE, CONSTRAINT dueño_telefono_PK PRIMARY KEY (telefono)
  );
CREATE TABLE casa
  (
    numRegistro           NUMBER,
    valorCatastral        NUMBER NOT NULL,
    tipoPropiedad         CHAR(15) NOT NULL,
    materialConstruccion  CHAR(20) NOT NULL,
    nBañosMedios          CHAR(1) NOT NULL,
    nBañosCompletos       CHAR(1) NOT NULL,
    nEstacionamientos     CHAR(1) NOT NULL,
    nHabitaciones         CHAR(2) NOT NULL,
    nPisos                CHAR(1) NOT NULL,
    tamañoHabitableMetros CHAR(10) NOT NULL,
    tamañoTerreno         CHAR(10) NOT NULL,
    estadoDeConstruccion  CHAR(20) NOT NULL,
    fConstruccion         DATE NOT NULL,
    CONSTRAINT casa_PK PRIMARY KEY (numRegistro)
  );
CREATE TABLE departamento
  (
    numRegistro           NUMBER,
    valorCatastral        NUMBER NOT NULL,
    tipoPropiedad         CHAR(15) NOT NULL,
    materialConstruccion  CHAR(20) NOT NULL,
    nBañosMedios          CHAR(1) NOT NULL,
    nBañosCompletos       CHAR(1) NOT NULL,
    nEstacionamientos     CHAR(1) NOT NULL,
    nHabitaciones         CHAR(2) NOT NULL,
    tamañoHabitableMetros CHAR(10) NOT NULL,
    tamañoTerreno         CHAR(10) NOT NULL,
    estadoDeConstruccion  CHAR(20) NOT NULL,
    fConstruccion         DATE NOT NULL,
    ubicadoEnPiso         CHAR(2) NOT NULL,
    totalEnEdificio       CHAR(4) NOT NULL,
    mantenimientoAnual    NUMBER NOT NULL,
    CONSTRAINT departamento_PK PRIMARY KEY (numRegistro)
  );
CREATE TABLE terreno
  (
    numRegistro        NUMBER,
    valorCatastral     NUMBER NOT NULL,
    existeConstruccion CHAR(2),
    CONSTRAINT terreno_PK PRIMARY KEY (numRegistro)
  );
-------------------------------------------------------CASA--------------------------------------------------------------------------------
CREATE TABLE casa_asesor
  (
    numRegistro NUMBER,
    idEmpleado  NUMBER,
    CONSTRAINT casa_asesor_idEmpleado_FK FOREIGN KEY (idEmpleado) REFERENCES asesor ON
  DELETE CASCADE,
    CONSTRAINT casa_asesor_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno ON
  DELETE CASCADE,
    CONSTRAINT casa_asesor_PK PRIMARY KEY (numRegistro, idEmpleado)
  );
CREATE TABLE casa_caracteristica
  (
    numRegistro      NUMBER,
    idCaracteristica NUMBER,
    CONSTRAINT casa_caracteristica_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_caracteristica_idCaracteristica_FK FOREIGN KEY (idCaracteristica) REFERENCES caracteristica (idCaracteristica) ON
  DELETE CASCADE,
    CONSTRAINT casa_caracteristica_PK PRIMARY KEY (numRegistro, idCaracteristica)
  );
CREATE TABLE casa_amenidad
  (
    numRegistro NUMBER,
    idAmenidad  NUMBER,
    CONSTRAINT casa_amenidad_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_amenidad_idAmenidad_FK FOREIGN KEY (idAmenidad) REFERENCES amenidad (idAmenidad) ON
  DELETE CASCADE,
    CONSTRAINT casa_amenidad_PK PRIMARY KEY (numRegistro, idAmenidad)
  );
CREATE TABLE casa_servicio
  (
    numRegistro NUMBER,
    idServicio  NUMBER,
    CONSTRAINT casa_servicio_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_servicio_idAmenidad_FK FOREIGN KEY (idServicio) REFERENCES servicio (idServicio) ON
  DELETE CASCADE,
    CONSTRAINT casa_servicio_PK PRIMARY KEY (numRegistro, idServicio)
  );
CREATE TABLE casa_seguro
  (
    numRegistro NUMBER,
    numPoliza   NUMBER,
    CONSTRAINT casa_seguro_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_seguro_idAmenidad_FK FOREIGN KEY (numPoliza) REFERENCES seguro (numPoliza) ON
  DELETE CASCADE,
    CONSTRAINT casa_seguro_PK PRIMARY KEY (numRegistro, numPoliza)
  );
CREATE TABLE casa_direccion
  (
    numRegistro NUMBER,
    idDireccion NUMBER,
    CONSTRAINT casa_direccion_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_direccion_idAmenidad_FK FOREIGN KEY (idDireccion) REFERENCES direccion (idDireccion) ON
  DELETE CASCADE,
    CONSTRAINT casa_direccion_PK PRIMARY KEY (numRegistro, idDireccion)
  );
CREATE TABLE casa_empresa
  (
    numRegistro NUMBER,
    idEmpresa   NUMBER,
    valorCompra NUMBER NOT NULL,
    fCompra     DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT casa_empresa_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_empresa_idEmpresa_FK FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa) ON
  DELETE CASCADE,
    CONSTRAINT casa_empresa_PK PRIMARY KEY (numRegistro, idEmpresa)
  );
CREATE TABLE casa_precio
  (
    numRegistro NUMBER,
    fecha       DATE DEFAULT SYSDATE NOT NULL,
    precio      NUMBER NOT NULL,
    CONSTRAINT casa_precio_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE, CONSTRAINT casa_precio_PK PRIMARY KEY (numRegistro, fecha)
  );
CREATE TABLE casa_exdueño
  (
    CURP         CHAR(18),
    numRegistro  NUMBER,
    fRecesion    DATE NOT NULL,
    fAdquisicion DATE NOT NULL,
    CONSTRAINT casa_exdueño_CURP_FK FOREIGN KEY (CURP) REFERENCES dueño (CURP) ON
  DELETE CASCADE,
    CONSTRAINT casa_exdueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE, CONSTRAINT casa_exdueño_PK PRIMARY KEY (CURP, numRegistro)
  );
CREATE TABLE casa_venta_dueño
  (
    idVenta        NUMBER,
    numRegistro    NUMBER UNIQUE,
    CURP           CHAR(18),
    idEmpleado     NUMBER,
    fAdquisicion   DATE NOT NULL,
    valorPropiedad NUMBER,
    CONSTRAINT casa_venta_dueño_CURP_FK FOREIGN KEY (CURP) REFERENCES dueño (CURP) ON
  DELETE CASCADE,
    CONSTRAINT casa_venta_dueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_venta_dueño_idEmpleado_FK FOREIGN KEY (idEmpleado) REFERENCES asesor (idEmpleado) ON
  DELETE CASCADE,
    CONSTRAINT casa_venta_dueño_PK PRIMARY KEY (idVenta, numRegistro)
  );
-------------------------------------------------------DEPARTAMENTO--------------------------------------------------------------------------------
CREATE TABLE departamento_asesor
  (
    numRegistro NUMBER,
    idEmpleado  NUMBER,
    CONSTRAINT departamento_asesor_idEmpleado_FK FOREIGN KEY (idEmpleado) REFERENCES asesor ON
  DELETE CASCADE,
    CONSTRAINT departamento_asesor_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno ON
  DELETE CASCADE,
    CONSTRAINT departamento_asesor_PK PRIMARY KEY (numRegistro, idEmpleado)
  );
CREATE TABLE departamento_caracteristica
  (
    numRegistro      NUMBER,
    idCaracteristica NUMBER,
    CONSTRAINT departamento_caracteristica_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_caracteristica_idCaracteristica_FK FOREIGN KEY (idCaracteristica) REFERENCES caracteristica (idCaracteristica) ON
  DELETE CASCADE,
    CONSTRAINT departamento_caracteristica_PK PRIMARY KEY (numRegistro, idCaracteristica)
  );
CREATE TABLE departamento_amenidad
  (
    numRegistro NUMBER,
    idAmenidad  NUMBER,
    CONSTRAINT departamento_amenidad_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_amenidad_idAmenidad_FK FOREIGN KEY (idAmenidad) REFERENCES amenidad (idAmenidad) ON
  DELETE CASCADE,
    CONSTRAINT departamento_amenidad_PK PRIMARY KEY (numRegistro, idAmenidad)
  );
CREATE TABLE departamento_servicio
  (
    numRegistro NUMBER,
    idServicio  NUMBER,
    CONSTRAINT departamento_servicio_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_servicio_idAmenidad_FK FOREIGN KEY (idServicio) REFERENCES servicio (idServicio) ON
  DELETE CASCADE,
    CONSTRAINT departamento_servicio_PK PRIMARY KEY (numRegistro, idServicio)
  );
CREATE TABLE departamento_seguro
  (
    numRegistro NUMBER,
    numPoliza   NUMBER,
    CONSTRAINT departamento_seguro_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_seguro_idAmenidad_FK FOREIGN KEY (numPoliza) REFERENCES seguro (numPoliza) ON
  DELETE CASCADE,
    CONSTRAINT departamento_seguro_PK PRIMARY KEY (numRegistro, numPoliza)
  );
CREATE TABLE departamento_direccion
  (
    numRegistro NUMBER,
    idDireccion NUMBER,
    CONSTRAINT departamento_direccion_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_direccion_idAmenidad_FK FOREIGN KEY (idDireccion) REFERENCES direccion (idDireccion) ON
  DELETE CASCADE,
    CONSTRAINT departamento_direccion_PK PRIMARY KEY (numRegistro, idDireccion)
  );
CREATE TABLE departamento_empresa
  (
    numRegistro NUMBER,
    idEmpresa   NUMBER,
    valorCompra NUMBER NOT NULL,
    fCompra     DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT departamento_empresa_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_empresa_idEmpresa_FK FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa) ON
  DELETE CASCADE,
    CONSTRAINT departamento_empresa_PK PRIMARY KEY (numRegistro, idEmpresa)
  );
CREATE TABLE departamento_precio
  (
    numRegistro NUMBER,
    fecha       DATE DEFAULT SYSDATE NOT NULL,
    precio      NUMBER NOT NULL,
    CONSTRAINT departamento_precio_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_precio_PK PRIMARY KEY (numRegistro, fecha)
  );
CREATE TABLE departamento_exdueño
  (
    CURP         CHAR(18),
    numRegistro  NUMBER,
    fRecesion    DATE NOT NULL,
    fAdquisicion DATE NOT NULL,
    CONSTRAINT departamento_exdueño_CURP_FK FOREIGN KEY (CURP) REFERENCES dueño (CURP) ON
  DELETE CASCADE,
    CONSTRAINT departamento_exdueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_exdueño_PK PRIMARY KEY (CURP, numRegistro)
  );
CREATE TABLE departamento_venta_dueño
  (
    idVenta        NUMBER,
    numRegistro    NUMBER UNIQUE,
    CURP           CHAR(18),
    idEmpleado     NUMBER,
    fAdquisicion   DATE NOT NULL,
    valorPropiedad NUMBER,
    CONSTRAINT departamento_venta_dueño_CURP_FK FOREIGN KEY (CURP) REFERENCES dueño (CURP) ON
  DELETE CASCADE,
    CONSTRAINT departamento_venta_dueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_venta_dueño_idEmpleado_FK FOREIGN KEY (idEmpleado) REFERENCES asesor (idEmpleado) ON
  DELETE CASCADE,
    CONSTRAINT departamento_venta_dueño_PK PRIMARY KEY (idVenta, numRegistro)
  );
-------------------------------------------------------TERRENO--------------------------------------------------------------------------------
CREATE TABLE terreno_asesor
  (
    numRegistro NUMBER,
    idEmpleado  NUMBER,
    CONSTRAINT terreno_asesor_idEmpleado_FK FOREIGN KEY (idEmpleado) REFERENCES asesor ON
  DELETE CASCADE,
    CONSTRAINT terreno_asesor_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno ON
  DELETE CASCADE,
    CONSTRAINT terreno_asesor_PK PRIMARY KEY (numRegistro, idEmpleado)
  );
CREATE TABLE terreno_servicio
  (
    numRegistro NUMBER,
    idServicio  NUMBER,
    CONSTRAINT terreno_servicio_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_servicio_idAmenidad_FK FOREIGN KEY (idServicio) REFERENCES servicio (idServicio) ON
  DELETE CASCADE,
    CONSTRAINT terreno_servicio_PK PRIMARY KEY (numRegistro, idServicio)
  );
CREATE TABLE terreno_seguro
  (
    numRegistro NUMBER,
    numPoliza   NUMBER,
    CONSTRAINT terreno_seguro_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_seguro_idAmenidad_FK FOREIGN KEY (numPoliza) REFERENCES seguro (numPoliza) ON
  DELETE CASCADE,
    CONSTRAINT terreno_seguro_PK PRIMARY KEY (numRegistro, numPoliza)
  );
CREATE TABLE terreno_direccion
  (
    numRegistro NUMBER,
    idDireccion NUMBER,
    CONSTRAINT terreno_direccion_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_direccion_idAmenidad_FK FOREIGN KEY (idDireccion) REFERENCES direccion (idDireccion) ON
  DELETE CASCADE,
    CONSTRAINT terreno_direccion_PK PRIMARY KEY (numRegistro, idDireccion)
  );
CREATE TABLE terreno_empresa
  (
    numRegistro NUMBER,
    idEmpresa   NUMBER,
    valorCompra NUMBER NOT NULL,
    fCompra     DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT terreno_empresa_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_empresa_idEmpresa_FK FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa) ON
  DELETE CASCADE,
    CONSTRAINT terreno_empresa_PK PRIMARY KEY (numRegistro, idEmpresa)
  );
CREATE TABLE terreno_precio
  (
    numRegistro NUMBER,
    fecha       DATE DEFAULT SYSDATE NOT NULL,
    precio      NUMBER NOT NULL,
    CONSTRAINT terreno_precio_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_precio_PK PRIMARY KEY (numRegistro, fecha)
  );
CREATE TABLE terreno_exdueño
  (
    CURP         CHAR(18),
    numRegistro  NUMBER,
    fRecesion    DATE NOT NULL,
    fAdquisicion DATE NOT NULL,
    CONSTRAINT terreno_exdueño_CURP_FK FOREIGN KEY (CURP) REFERENCES dueño (CURP) ON
  DELETE CASCADE,
    CONSTRAINT terreno_exdueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_exdueño_PK PRIMARY KEY (CURP, numRegistro)
  );
CREATE TABLE terreno_venta_dueño
  (
    idVenta        NUMBER,
    numRegistro    NUMBER UNIQUE,
    CURP           CHAR(18),
    idEmpleado     NUMBER,
    fAdquisicion   DATE NOT NULL,
    valorPropiedad NUMBER,
    CONSTRAINT terreno_venta_dueño_CURP_FK FOREIGN KEY (CURP) REFERENCES dueño (CURP) ON
  DELETE CASCADE,
    CONSTRAINT terreno_venta_dueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_venta_dueño_idEmpleado_FK FOREIGN KEY (idEmpleado) REFERENCES asesor (idEmpleado) ON
  DELETE CASCADE,
    CONSTRAINT terreno_venta_dueño_PK PRIMARY KEY (idVenta, numRegistro)
  );