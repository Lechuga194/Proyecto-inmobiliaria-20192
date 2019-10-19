/*
DDL.SQL Proyecto final | Lechuga Martínez José Eduardo | 314325749 | Joselechuga194@ciencias.unam.mx
*/
CREATE TABLE colonia
  (
    idColonia NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombre VARCHAR2(50) NOT NULL,
    CONSTRAINT colonia_PK PRIMARY KEY (idColonia)
  );
CREATE TABLE tiendas_Cercanas
  (
    nombreTienda VARCHAR2(250),
    idColonia    NUMBER,
    CONSTRAINT tiendas_Cercanas_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE, CONSTRAINT tiendas_Cercanas_PK PRIMARY KEY (nombreTienda)
  );
CREATE TABLE recreativos_Cercanos
  (
    nombreRecreativo VARCHAR2(250),
    idColonia        NUMBER,
    CONSTRAINT recreativos_Cercanos_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE,
    CONSTRAINT recreativos_Cercanos_PK PRIMARY KEY (nombreRecreativo)
  );
CREATE TABLE escuelas_Cercanas
  (
    nombreEscuela VARCHAR2(500),
    idColonia     NUMBER,
    CONSTRAINT Escuelas_Cercanas_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE, CONSTRAINT Escuelas_Cercanas_PK PRIMARY KEY (nombreEscuela)
  );
CREATE TABLE hospitales_Cercanos
  (
    nombreHospital VARCHAR2(150),
    idColonia      NUMBER,
    CONSTRAINT hospitales_Cercanos_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE,
    CONSTRAINT hospitales_Cercanos_PK PRIMARY KEY (nombreHospital)
  );
CREATE TABLE transportes_Cercanos
  (
    nombreTransporte VARCHAR2(250),
    idColonia        NUMBER,
    CONSTRAINT transportes_Cercanos_idColonia_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE,
    CONSTRAINT transportes_Cercanos_PK PRIMARY KEY (nombreTransporte)
  );
CREATE TABLE direccion
  (
    idDireccion NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    idColonia   NUMBER,
    estado      VARCHAR2(50) DEFAULT 'No especificado' NOT NULL,
    municipio   VARCHAR2(50) DEFAULT 'No especificado' NOT NULL,
    CP          VARCHAR2(5) DEFAULT '00000' NOT NULL,
    calle       VARCHAR2(50) DEFAULT 'No especificado' NOT NULL,
    nExterior   VARCHAR2(3) DEFAULT '000' NOT NULL,
    nInterior   VARCHAR2(3) DEFAULT '000' NOT NULL,
    CONSTRAINT idColonia_direccio_FK FOREIGN KEY (idColonia) REFERENCES colonia (idColonia) ON
  DELETE CASCADE, CONSTRAINT direccion_PK PRIMARY KEY (idDireccion)
  );
CREATE TABLE caracteristica
  (
    idCaracteristica NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombre           VARCHAR2(50),
    descripcion      VARCHAR2(150),
    CONSTRAINT caracteristica_PK PRIMARY KEY (idCaracteristica)
  );
CREATE TABLE amenidad
  (
    idAmenidad  NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombre      VARCHAR2(50),
    descripcion VARCHAR2(150),
    CONSTRAINT amenidad_PK PRIMARY KEY (idAmenidad)
  );
CREATE TABLE servicio
  (
    idServicio  NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombre      VARCHAR2(50),
    descripcion VARCHAR2(150),
    precioAnual NUMBER,
    CONSTRAINT servicio_PK PRIMARY KEY (idServicio)
  );
CREATE TABLE seguro
  (
    numPoliza     NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    aseguradora   VARCHAR2(50),
    tipoCovertura VARCHAR2(150),
    precioAnual   NUMBER,
    CONSTRAINT seguro_PK PRIMARY KEY (numPoliza)
  );
CREATE TABLE empresa
  (
    idEmpresa NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombre    VARCHAR2(40),
    CONSTRAINT empresa_PK PRIMARY KEY (idEmpresa)
  );
CREATE TABLE RFC
  ( 
  	idRFC NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
  	RFC VARCHAR2(13) UNIQUE,
  	CONSTRAINT RFC_PK PRIMARY KEY (idRFC)
  );
CREATE TABLE asesor
  (
    idAsesor  NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    idEmpresa   NUMBER,
    fNacimiento DATE NOT NULL,
    nombre      VARCHAR2(25) NOT NULL,
    aPaterno    VARCHAR2(25) NOT NULL,
    aMaterno    VARCHAR2(25) NOT NULL,
    fIngreso    DATE DEFAULT SYSDATE NOT NULL,
    sueldo      NUMBER NOT NULL,
    CONSTRAINT idEmpresa_asesor_FK FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa) ON
  DELETE CASCADE, CONSTRAINT asesor_PK PRIMARY KEY (idAsesor)
  );
CREATE TABLE asesor_RFC
  (
    idAsesor NUMBER,
    idRFC NUMBER,
    CONSTRAINT idAsesor_RFC_FK FOREIGN KEY (idAsesor) REFERENCES asesor (idAsesor) ON
  DELETE CASCADE,
    CONSTRAINT RFC_RFC_FK FOREIGN KEY (idRFC) REFERENCES RFC (idRFC) ON
  DELETE CASCADE, CONSTRAINT asesor_RFC_PK PRIMARY KEY (idAsesor, idRFC)
  );
CREATE TABLE asesor_email
  (
    correo     VARCHAR2(500),
    idAsesor NUMBER,
    CONSTRAINT asesor_email_FK FOREIGN KEY (idAsesor) REFERENCES asesor (idAsesor) ON
  DELETE CASCADE, CONSTRAINT asesor_email_PK PRIMARY KEY (correo)
  );
CREATE TABLE asesor_telefono
  (
    telefono   VARCHAR2(12),
    idAsesor NUMBER,
    CONSTRAINT asesor_telefono_FK FOREIGN KEY (idAsesor) REFERENCES asesor (idAsesor) ON
  DELETE CASCADE, CONSTRAINT asesor_telefono_PK PRIMARY KEY (telefono)
  );
CREATE TABLE dueño
  (
  	idDueño NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    fNacimiento DATE NOT NULL,
    nombre      VARCHAR2(50),
    aPAterno    VARCHAR2(50),
    aMAterno    VARCHAR2(50),
    CONSTRAINT dueño_PK PRIMARY KEY (idDueño)
  );

  CREATE TABLE CURP
  ( 
  	idCURP NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
  	CURP VARCHAR2(18) UNIQUE,
  	CONSTRAINT CURP_PK PRIMARY KEY (idCURP)
  );

CREATE TABLE dueño_CURP
  (
    idDueño NUMBER,
    idCURP NUMBER,
    CONSTRAINT dueño_CURP_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE,
    CONSTRAINT dueño_CURP_idCURP_FK FOREIGN KEY (idCURP) REFERENCES CURP (idCURP) ON
  DELETE CASCADE, CONSTRAINT dueño_CURP_PK PRIMARY KEY (idDueño, idCURP)
  );

CREATE TABLE dueño_email
  (
    correo VARCHAR2(500),
    idDueño NUMBER,
    CONSTRAINT dueño_email_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE, CONSTRAINT dueño_email_PK PRIMARY KEY (correo)
  );
CREATE TABLE dueño_telefono
  (
    telefono VARCHAR2(12),
    idDueño NUMBER,
    CONSTRAINT dueño_telefono_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE, CONSTRAINT dueño_telefono_PK PRIMARY KEY (telefono)
  );

---------------------------------------------------------------------------------------

CREATE TABLE casa
  (
    numRegistro           NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    valorCatastral        NUMBER NOT NULL,
    tipoPropiedad         VARCHAR2(15) NOT NULL,
    materialConstruccion  VARCHAR2(20) NOT NULL,
    nBañosMedios          VARCHAR2(1) NOT NULL,
    nBañosCompletos       VARCHAR2(1) NOT NULL,
    nEstacionamientos     VARCHAR2(1) NOT NULL,
    nHabitaciones         VARCHAR2(2) NOT NULL,
    nPisos                VARCHAR2(1) NOT NULL,
    tamañoHabitableMetros VARCHAR2(10) NOT NULL,
    tamañoTerreno         VARCHAR2(10) NOT NULL,
    estadoDeConstruccion  VARCHAR2(20) NOT NULL,
    fConstruccion         DATE NOT NULL,
    CONSTRAINT casa_PK PRIMARY KEY (numRegistro)
  );
CREATE TABLE departamento
  (
    numRegistro           NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    valorCatastral        NUMBER NOT NULL,
    tipoPropiedad         VARCHAR2(15) NOT NULL,
    materialConstruccion  VARCHAR2(20) NOT NULL,
    nBañosMedios          VARCHAR2(1) NOT NULL,
    nBañosCompletos       VARCHAR2(1) NOT NULL,
    nEstacionamientos     VARCHAR2(1) NOT NULL,
    nHabitaciones         VARCHAR2(2) NOT NULL,
    tamañoHabitableMetros VARCHAR2(10) NOT NULL,
    tamañoTerreno         VARCHAR2(10) NOT NULL,
    estadoDeConstruccion  VARCHAR2(20) NOT NULL,
    fConstruccion         DATE NOT NULL,
    ubicadoEnPiso         VARCHAR2(2) NOT NULL,
    totalEnEdificio       VARCHAR2(4) NOT NULL,
    mantenimientoAnual    NUMBER NOT NULL,
    CONSTRAINT departamento_PK PRIMARY KEY (numRegistro)
  );
CREATE TABLE terreno
  (
    numRegistro        NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    valorCatastral     NUMBER NOT NULL,
    existeConstruccion VARCHAR2(2),
    CONSTRAINT terreno_PK PRIMARY KEY (numRegistro),
    CONSTRAINT revisaTerreno CHECK (UPPER(existeConstruccion)='SI' or 
  	UPPER(existeConstruccion)='NO' or LOWER(existeConstruccion)='si' or LOWER(existeConstruccion)='no')
  );
-------------------------------------------------------CASA--------------------------------------------------------------------------------
CREATE TABLE casa_asesor
  (
    numRegistro NUMBER,
    idAsesor  NUMBER,
    CONSTRAINT casa_asesor_idAsesor_FK FOREIGN KEY (idAsesor) REFERENCES asesor (idAsesor) ON
  DELETE CASCADE,
    CONSTRAINT casa_asesor_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_asesor_PK PRIMARY KEY (numRegistro, idAsesor)
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
    idDueño NUMBER,
    numRegistro  NUMBER,
    fRecesion    DATE NOT NULL,
    fAdquisicion DATE NOT NULL,
    CONSTRAINT casa_exdueño_CURP_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE,
    CONSTRAINT casa_exdueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE, CONSTRAINT casa_exdueño_PK PRIMARY KEY (idDueño, numRegistro)
  );
CREATE TABLE casa_venta_dueño
  (
    idVenta        NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    numRegistro    NUMBER UNIQUE,
    idDueño NUMBER,
    idAsesor     NUMBER,
    fAdquisicion   DATE NOT NULL,
    valorPropiedad NUMBER,
    CONSTRAINT casa_venta_dueño_CURP_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE,
    CONSTRAINT casa_venta_dueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT casa_venta_dueño_idAsesor_FK FOREIGN KEY (idAsesor) REFERENCES asesor (idAsesor) ON
  DELETE CASCADE,
    CONSTRAINT casa_venta_dueño_PK PRIMARY KEY (idVenta, numRegistro)
  );
-------------------------------------------------------DEPARTAMENTO--------------------------------------------------------------------------------
CREATE TABLE departamento_asesor
  (
    numRegistro NUMBER,
    idAsesor  NUMBER,
    CONSTRAINT departamento_asesor_idAsesor_FK FOREIGN KEY (idAsesor) REFERENCES asesor (idAsesor) ON
  DELETE CASCADE,
    CONSTRAINT departamento_asesor_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_asesor_PK PRIMARY KEY (numRegistro, idAsesor)
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
    idDueño NUMBER,
    numRegistro  NUMBER,
    fRecesion    DATE NOT NULL,
    fAdquisicion DATE NOT NULL,
    CONSTRAINT departamento_exdueño_idDueño_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE,
    CONSTRAINT departamento_exdueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES departamento (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_exdueño_PK PRIMARY KEY (idDueño, numRegistro)
  );
CREATE TABLE departamento_venta_dueño
  (
    idVenta        NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    numRegistro    NUMBER UNIQUE,
    idDueño NUMBER,
    idAsesor     NUMBER,
    fAdquisicion   DATE NOT NULL,
    valorPropiedad NUMBER,
    CONSTRAINT departamento_venta_dueño_CURP_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE,
    CONSTRAINT departamento_venta_dueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT departamento_venta_dueño_idAsesor_FK FOREIGN KEY (idAsesor) REFERENCES asesor (idAsesor) ON
  DELETE CASCADE,
    CONSTRAINT departamento_venta_dueño_PK PRIMARY KEY (idVenta, numRegistro)
  );
-------------------------------------------------------TERRENO--------------------------------------------------------------------------------
CREATE TABLE terreno_asesor
  (
    numRegistro NUMBER,
    idAsesor  NUMBER,
    CONSTRAINT terreno_asesor_idAsesor_FK FOREIGN KEY (idAsesor) REFERENCES asesor ON
  DELETE CASCADE,
    CONSTRAINT terreno_asesor_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno ON
  DELETE CASCADE,
    CONSTRAINT terreno_asesor_PK PRIMARY KEY (numRegistro, idAsesor)
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
    idDueño NUMBER,
    numRegistro  NUMBER,
    fRecesion    DATE NOT NULL,
    fAdquisicion DATE NOT NULL,
    CONSTRAINT terreno_exdueño_idDueño_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE,
    CONSTRAINT terreno_exdueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES terreno (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_exdueño_PK PRIMARY KEY (idDueño, numRegistro)
  );
CREATE TABLE terreno_venta_dueño
  (
    idVenta        NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    numRegistro    NUMBER UNIQUE,
    idDueño NUMBER,
    idAsesor     NUMBER,
    fAdquisicion   DATE NOT NULL,
    valorPropiedad NUMBER,
    CONSTRAINT terreno_venta_dueño_CURP_FK FOREIGN KEY (idDueño) REFERENCES dueño (idDueño) ON
  DELETE CASCADE,
    CONSTRAINT terreno_venta_dueño_numRegistro_FK FOREIGN KEY (numRegistro) REFERENCES casa (numRegistro) ON
  DELETE CASCADE,
    CONSTRAINT terreno_venta_dueño_idAsesor_FK FOREIGN KEY (idAsesor) REFERENCES asesor (idAsesor) ON
  DELETE CASCADE,
    CONSTRAINT terreno_venta_dueño_PK PRIMARY KEY (idVenta, numRegistro)
  );