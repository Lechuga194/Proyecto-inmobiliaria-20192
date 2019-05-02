/*
DDL.SQL Practica 8 | Lechuga Martínez José Eduardo
*/
--Creacion de Encargado
CREATE TABLE encargado
  (
    idencargado NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombrepila     VARCHAR2(50) NOT NULL,
    apaterno       VARCHAR2(50) NOT NULL,
    amaterno       VARCHAR2(50) NOT NULL,
    fnacimiento    DATE NOT NULL,
    fregistro      DATE DEFAULT sysdate NOT NULL,
    colonia        VARCHAR2(50) NOT NULL,
    numerovivienda NUMBER(3,0) NOT NULL,
    estado         VARCHAR2(50) NOT NULL,
    calle          VARCHAR2(50) NOT NULL,
    CONSTRAINT idencargado_PK PRIMARY KEY (idencargado)
  );
CREATE TABLE correos_encargado
  (
    correo      VARCHAR2(50) CHECK(correo LIKE '%@%.%'),
    idencargado NUMBER NOT NULL,
    CONSTRAINT encargado_correo_PK PRIMARY KEY (correo),
    CONSTRAINT encargado_correos_idencargado_FK FOREIGN KEY (idencargado) REFERENCES encargado (idencargado)
  );
CREATE TABLE telefonos_encargado
  (
    telefono    VARCHAR(14),
    idencargado NUMBER ,
    CONSTRAINT encargado_telefono_PK PRIMARY KEY (telefono),
    CONSTRAINT encargado_telefonos_idencargado_FK FOREIGN KEY (idencargado) REFERENCES encargado (idencargado)
  );
--Creacion de Gerente
CREATE TABLE gerente
  (
    idgerente NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombrepila     VARCHAR2(50) NOT NULL,
    apaterno       VARCHAR2(50) NOT NULL,
    amaterno       VARCHAR2(50) NOT NULL,
    fnacimiento    DATE NOT NULL,
    fregistro      DATE DEFAULT sysdate NOT NULL,
    colonia        VARCHAR2(50) NOT NULL,
    numerovivienda NUMBER (3,0) NOT NULL,
    estado         VARCHAR2(50) NOT NULL,
    calle          VARCHAR2(50) NOT NULL,
    CONSTRAINT idgerente_PK PRIMARY KEY (idgerente)
  );
CREATE TABLE correos_gerente
  (
    correo    VARCHAR2(50) CHECK(correo LIKE '%@%.%'),
    idgerente NUMBER,
    CONSTRAINT gerente_correo_PK PRIMARY KEY (correo),
    CONSTRAINT gerente_correos_idgerente_FK FOREIGN KEY (idgerente) REFERENCES gerente (idgerente)
  );
CREATE TABLE telefonos_gerente
  (
    telefono  VARCHAR(14),
    idgerente NUMBER,
    CONSTRAINT gerente_telefono_PK PRIMARY KEY (telefono),
    CONSTRAINT gerente_telefonos_idgerente_FK FOREIGN KEY (idgerente) REFERENCES gerente (idgerente)
  );
--Creacion de Empleado
CREATE TABLE empleado
  (
    idempleado NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombrepila     VARCHAR2(50) NOT NULL,
    apaterno       VARCHAR2(50) NOT NULL,
    amaterno       VARCHAR2(50) NOT NULL,
    fnacimiento    DATE NOT NULL,
    fregistro      DATE DEFAULT sysdate NOT NULL,
    colonia        VARCHAR2(50) NOT NULL,
    numerovivienda NUMBER (3,0) NOT NULL,
    estado         VARCHAR2(50) NOT NULL,
    calle          VARCHAR2(50) NOT NULL,
    CONSTRAINT idempleado_PK PRIMARY KEY (idempleado)
  );
CREATE TABLE correos_empleado
  (
    correo     VARCHAR2(50) CHECK(correo LIKE '%@%.%'),
    idempleado NUMBER,
    CONSTRAINT empleado_correo_PK PRIMARY KEY (correo),
    CONSTRAINT empleado_correos_idempleado_FK FOREIGN KEY (idempleado) REFERENCES empleado (idempleado)
  );
CREATE TABLE telefonos_empleado
  (
    telefono   VARCHAR(14),
    idempleado NUMBER,
    CONSTRAINT empleado_telefono_PK PRIMARY KEY (telefono),
    CONSTRAINT empleado_telefonos_idempleado_FK FOREIGN KEY (idempleado) REFERENCES empleado (idempleado)
  );
--Creacion de Farmacia
CREATE TABLE farmacia
  (
    iddepartamento NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE
  );
ALTER TABLE farmacia ADD CONSTRAINT farmacia_PK PRIMARY KEY (iddepartamento);
--Creacion de Abarrotes
CREATE TABLE abarrotes
  (
    iddepartamento NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE
  );
ALTER TABLE abarrotes ADD CONSTRAINT abarrotes_PK PRIMARY KEY (iddepartamento);
--Creacion de Vinos y licores
CREATE TABLE vinosylicores
  (
    iddepartamento NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE
  );
ALTER TABLE vinosylicores ADD CONSTRAINT vinosylicores_PK PRIMARY KEY (iddepartamento);
--Creacion de las relaciones entre encargado y los departamentos (Farmacia, abarrotes, vinos y licores)
CREATE TABLE encargado_tener_farmacia
  (
    idencargado    NUMBER,
    iddepartamento NUMBER,
    CONSTRAINT encargado_tener_farmacia_idencargado_FK FOREIGN KEY (idencargado) REFERENCES encargado (idencargado),
    CONSTRAINT encargado_tener_farmacia_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES farmacia (iddepartamento)
  );
ALTER TABLE encargado_tener_farmacia ADD CONSTRAINT encargado_tener_farmacia_PK PRIMARY KEY (idencargado, iddepartamento);
CREATE TABLE encargado_tener_abarrotes
  (
    idencargado    NUMBER,
    iddepartamento NUMBER,
    CONSTRAINT encargado_tener_abarrotes_idencargado_FK FOREIGN KEY (idencargado) REFERENCES encargado (idencargado),
    CONSTRAINT encargado_tener_abarrotes_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES abarrotes (iddepartamento)
  );
ALTER TABLE encargado_tener_abarrotes ADD CONSTRAINT encargado_tener_abarrtoes_PK PRIMARY KEY (idencargado, iddepartamento);
CREATE TABLE encargado_tener_vinosylicores
  (
    idencargado    NUMBER,
    iddepartamento NUMBER,
    CONSTRAINT encargado_tener_vinosylicores_idencargado_FK FOREIGN KEY (idencargado) REFERENCES encargado (idencargado),
    CONSTRAINT encargado_tener_vinosylicores_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES vinosylicores (iddepartamento)
  );
ALTER TABLE encargado_tener_vinosylicores ADD CONSTRAINT encargado_tener_vinosylicores_PK PRIMARY KEY (idencargado, iddepartamento);
--Creacion de la entidad Sucursal
CREATE TABLE sucursal
  (
    idsucursal NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    fcreacion      DATE NOT NULL,
    estado         VARCHAR2(50) NOT NULL,
    colonia        VARCHAR2(50) NOT NULL,
    calle          VARCHAR2(50) NOT NULL,
    correo         VARCHAR2(50) NOT NULL,
    nombresucursal VARCHAR2(50) NOT NULL,
    CONSTRAINT idsucursal_PK PRIMARY KEY (idsucursal)
  );
--Creacion del atributo multivaluado telefono sucursal
CREATE TABLE telefonos_sucursal
  (
    telefono   VARCHAR(14),
    idsucursal NUMBER,
    CONSTRAINT sucursal_telefono_PK PRIMARY KEY (telefono),
    CONSTRAINT sucursal_telefonoes_idsucursal_FK FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal)
  );
--Creacion de la relacion dirigir entre gerente y sucursal
CREATE TABLE gerente_dirigir_sucursal
  (
    idgerente  NUMBER,
    idsucursal NUMBER,
    CONSTRAINT gerente_dirigir_sucursal_idgerente_FK FOREIGN KEY (idgerente) REFERENCES gerente (idgerente),
    CONSTRAINT gerente_dirigir_sucursal_idsucursal_FK FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal)
  );
ALTER TABLE gerente_dirigir_sucursal ADD CONSTRAINT gerente_dirigir_sucursal_PK PRIMARY KEY (idgerente, idsucursal);
--Creacion de la relacion Tener entre empleado y sucursal
CREATE TABLE empleado_tener_sucursal
  (
    idempleado NUMBER,
    idsucursal NUMBER,
    CONSTRAINT empleado_tener_sucursal_idempleado_FK FOREIGN KEY (idempleado) REFERENCES empleado (idempleado),
    CONSTRAINT empleado_tener_sucursal_idsucursal_FK FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal)
  );
ALTER TABLE empleado_tener_sucursal ADD CONSTRAINT empleado_tener_sucursal_PK PRIMARY KEY (idempleado, idsucursal);
--Creacion de las relaciones tener entre sucursal y departamentos (Farmacia, abarrotes, vinos y licores
CREATE TABLE sucursal_tener_farmacia
  (
    idsucursal     NUMBER,
    iddepartamento NUMBER,
    CONSTRAINT sucursal_tener_farmacia_idsucursal_FK FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal),
    CONSTRAINT sucursal_tener_farmacia_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES farmacia (iddepartamento)
  );
ALTER TABLE sucursal_tener_farmacia ADD CONSTRAINT sucursal_tener_farmacia_PK PRIMARY KEY (idsucursal, iddepartamento);
CREATE TABLE sucursal_tener_abarrotes
  (
    idsucursal     NUMBER,
    iddepartamento NUMBER,
    CONSTRAINT sucursal_tener_abarrotes_idsucursal_FK FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal),
    CONSTRAINT sucursal_tener_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES abarrotes (iddepartamento)
  );
ALTER TABLE sucursal_tener_abarrotes ADD CONSTRAINT sucursal_tener_abarrotes_PK PRIMARY KEY (idsucursal, iddepartamento);
CREATE TABLE sucursal_tener_vinosylicores
  (
    idsucursal     NUMBER,
    iddepartamento NUMBER,
    CONSTRAINT sucursal_tener_vinosylicores_idsucursal_FK FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal),
    CONSTRAINT sucursal_tener_vinosylicores_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES vinosylicores (iddepartamento)
  );
ALTER TABLE sucursal_tener_vinosylicores ADD CONSTRAINT sucursal_tener_vinosylicores_PK PRIMARY KEY (idsucursal, iddepartamento);
--Creacion de la entidad Cliente
CREATE TABLE cliente
  (
    idcliente NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
    nombrepila     VARCHAR2(50) NOT NULL,
    apaterno       VARCHAR2(50) NOT NULL,
    amaterno       VARCHAR2(50) NOT NULL,
    colonia        VARCHAR2(50) NOT NULL,
    numerovivienda NUMBER(3,0) NOT NULL ,
    estado         VARCHAR2(50) NOT NULL,
    calle          VARCHAR2(50) NOT NULL,
    fnacimiento    DATE,
    fregistro      DATE DEFAULT sysdate NOT NULL,
    CONSTRAINT idcliente_PK PRIMARY KEY (idcliente)
  );
CREATE TABLE telefonos_cliente
  (
    telefono  VARCHAR(14),
    idcliente NUMBER,
    CONSTRAINT cliente_telefono_PK PRIMARY KEY (telefono),
    CONSTRAINT cliente_telefonos_idcliente_FK FOREIGN KEY (idcliente) REFERENCES cliente (idcliente)
  );
CREATE TABLE correos_cliente
  (
    correo    VARCHAR2(50) CHECK(correo LIKE '%@%.%'),
    idcliente NUMBER,
    CONSTRAINT cliente_correo_PK PRIMARY KEY (correo),
    CONSTRAINT cliente_correos_idempleado_FK FOREIGN KEY (idcliente) REFERENCES empleado (idempleado)
  );
--Creacion de la entidad Tarjeta
CREATE TABLE tarjeta
  (
    idtarjeta NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20,
    totalpuntos NUMBER(7,0) DEFAULT 0 NOT NULL,
    totalpesos  NUMBER(7,0),
    CONSTRAINT tarjeta_idtarjeta_PK PRIMARY KEY (idtarjeta)
  );
ALTER TABLE tarjeta
DROP COLUMN TOTALPESOS;
--Creacion de la relacion asignar entre cliente y tarjeta
CREATE TABLE cliente_asignar_tarjeta
  (
    idtarjeta NUMBER,
    idcliente NUMBER,
    CONSTRAINT cliente_asignar_tarjeta_idtarjeta_FK FOREIGN KEY (idtarjeta) REFERENCES tarjeta (idtarjeta),
    CONSTRAINT cliente_asignar_tarjeta_idcliente_FK FOREIGN KEY (idcliente) REFERENCES cliente (idcliente)
  );
ALTER TABLE cliente_asignar_tarjeta ADD CONSTRAINT cliente_asignar_tarjeta_PK PRIMARY KEY (idtarjeta, idcliente);
CREATE TABLE cliente_remplazar_tarjeta
  (
    idtarjeta NUMBER,
    idcliente NUMBER,
    CONSTRAINT cliente_remplazar_tarjeta_idtarjeta_FK FOREIGN KEY (idtarjeta) REFERENCES tarjeta (idtarjeta),
    CONSTRAINT cliente_remplazar_tarjeta_idcliente_FK FOREIGN KEY (idcliente) REFERENCES cliente (idcliente)
  );
ALTER TABLE cliente_remplazar_tarjeta ADD CONSTRAINT cliente_remplazar_tarjeta_PK PRIMARY KEY (idtarjeta, idcliente);
--Creacion de la entidad compra
CREATE TABLE compra
  (
    idcompra NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20,
    horacompra  TIMESTAMP DEFAULT systimestamp NOT NULL,
    fechacompra DATE DEFAULT sysdate NOT NULL,
    CONSTRAINT idcompra_PK PRIMARY KEY (idcompra)
  );
ALTER TABLE compra
DROP COLUMN horacompra;
CREATE TABLE forma_pago
  (
    formapago VARCHAR2(50),
    idcompra  NUMBER,
    CONSTRAINT forma_pago_idcompra_FK FOREIGN KEY (idcompra) REFERENCES compra (idcompra)
  );
ALTER TABLE forma_pago ADD CONSTRAINT forma_pago_PK PRIMARY KEY (formapago);
CREATE TABLE datos_compra
  (
    idcompra   NUMBER,
    idcliente  NUMBER,
    idempleado NUMBER,
    idsucursal NUMBER,
    CONSTRAINT datos_compra_idcompra_FK FOREIGN KEY (idcompra) REFERENCES compra (idcompra),
    CONSTRAINT datos_compra_idcliente_FK FOREIGN KEY (idcliente) REFERENCES cliente (idcliente),
    CONSTRAINT datos_compra_idempleado_FK FOREIGN KEY (idempleado) REFERENCES empleado (idempleado),
    CONSTRAINT datos_compra_idsucursal_FK FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal),
    CONSTRAINT datos_compra_PK PRIMARY KEY (idcompra, idcliente, idempleado, idsucursal)
  );
--Creacion de la relacion abonar entre compra y tarjeta
CREATE TABLE compra_abonar_tarjeta
  (
    idcompra  NUMBER,
    idtarjeta NUMBER,
    CONSTRAINT compra_abonar_tarjeta_idcompra_FK FOREIGN KEY (idcompra) REFERENCES compra (idcompra),
    CONSTRAINT compra_abonar_tarjeta_idtarjeta_FK FOREIGN KEY (idtarjeta) REFERENCES tarjeta (idtarjeta)
  );
ALTER TABLE compra_abonar_tarjeta ADD CONSTRAINT compra_abonar_tarjeta_PK PRIMARY KEY (idcompra, idtarjeta);
--Creacion de los distintos tipos de productos (ProductoMedicamentoControlado, ProductoMedicamentoVentaLibre, ProductoAbarrotes, ProductoVinoyLicor)
CREATE TABLE producto_med_controlado
  (
    idproducto NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20,
    iddepartamento NUMBER,
    idcompra       NUMBER,
    nombre         VARCHAR2(50) NOT NULL,
    laboratorio    VARCHAR2(50) NOT NULL,
    compuesto      VARCHAR2(50) NOT NULL,
    dosis          VARCHAR2(50) NOT NULL,
    cantidadneta   VARCHAR2(50) NOT NULL,
    precio         NUMBER NOT NULL,
    cantidad       VARCHAR2(50) NOT NULL,
    marca          VARCHAR2(50) NOT NULL,
    presentacion   VARCHAR2(50) NOT NULL,
    tipoproducto   VARCHAR2(50) NOT NULL,
    refrigeracion  VARCHAR2(2) NOT NULL,
    felaboracion   DATE NOT NULL,
    fcaducidad     DATE NOT NULL,
    color          CHAR(20) NOT NULL,
    stock          NUMBER DEFAULT 0 NOT NULL
  );
--Agregamos la llave primaria
ALTER TABLE producto_med_controlado ADD (CONSTRAINT producto_med_controlado_PK PRIMARY KEY (idproducto));
--Agregamos las llaves foraneas
ALTER TABLE producto_med_controlado ADD (CONSTRAINT producto_med_controlado_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES farmacia (iddepartamento));
--Agregamos el constraint check para asegurar que refrigeracion es SI o NO
ALTER TABLE producto_med_controlado ADD (CONSTRAINT producto_med_controlado_refrigeracion CHECK (UPPER(refrigeracion)='SI' OR UPPER(refrigeracion)='NO' OR LOWER(refrigeracion)='si' OR LOWER(refrigeracion)='no'));
--Modificacion de la tabla para la practica 7 (Quitamos idcompra y su respectivo constraint)
ALTER TABLE producto_med_controlado
DROP COLUMN idcompra;
ALTER TABLE producto_med_controlado
DROP COLUMN departamento;
CREATE TABLE producto_med_libre
  (
    idproducto NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20,
    iddepartamento NUMBER,
    idcompra       NUMBER,
    nombre         VARCHAR2(50) NOT NULL,
    laboratorio    VARCHAR2(50) NOT NULL,
    compuesto      VARCHAR2(50) NOT NULL,
    dosis          VARCHAR2(50) NOT NULL,
    cantidadneta   VARCHAR2(50) NOT NULL,
    precio         NUMBER NOT NULL,
    cantidad       VARCHAR2(50) NOT NULL,
    marca          VARCHAR2(50) NOT NULL,
    presentacion   VARCHAR2(50) NOT NULL,
    departamento   VARCHAR2(50) NOT NULL,
    tipoproducto   VARCHAR2(50) NOT NULL,
    refrigeracion  VARCHAR2(2) NOT NULL,
    felaboracion   DATE NOT NULL,
    fcaducidad     DATE NOT NULL,
    color          CHAR(20) NOT NULL,
    stock          NUMBER DEFAULT 0 NOT NULL
  );
--Agregamos la llave primaria y la hacemos unica
ALTER TABLE producto_med_libre ADD (CONSTRAINT producto_med_libre_PK PRIMARY KEY (idproducto));
--Agregamos las llaves foraneas
ALTER TABLE producto_med_libre ADD (CONSTRAINT producto_med_libre_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES farmacia (iddepartamento));
--Agregamos el constraint para asegurar que refrigeracion es SI o NO
ALTER TABLE producto_med_libre ADD (CONSTRAINT producto_med_libre_refrigeracion CHECK (UPPER(refrigeracion)='SI' OR UPPER(refrigeracion)='NO' OR LOWER(refrigeracion)='si' OR LOWER(refrigeracion)='no'));
--Modificacion de la tabla para la practica 7 (Quitamos idcompra y su respectivo constraint)
ALTER TABLE producto_med_libre
DROP COLUMN idcompra;
ALTER TABLE producto_med_libre
DROP COLUMN departamento;
CREATE TABLE producto_abarrote
  (
    idproducto NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20,
    iddepartamento NUMBER,
    idcompra       NUMBER,
    nombre         VARCHAR2(50) NOT NULL,
    precio         NUMBER NOT NULL,
    cantidad       VARCHAR2(50) NOT NULL,
    marca          VARCHAR2(50) NOT NULL,
    presentacion   VARCHAR2(50) NOT NULL,
    departamento   VARCHAR2(50) NOT NULL,
    tipoproducto   VARCHAR2(50) NOT NULL,
    refrigeracion  VARCHAR2(2) NOT NULL,
    felaboracion   DATE NOT NULL,
    fcaducidad     DATE NOT NULL,
    color          CHAR(20) NOT NULL,
    stock          NUMBER DEFAULT 0 NOT NULL
  );
--Agregamos la llave primaria y la hacemos unica
ALTER TABLE producto_abarrote ADD (CONSTRAINT producto_abarrote_PK PRIMARY KEY (idproducto));
--Agregamos las llaves foraneas
ALTER TABLE producto_abarrote ADD (CONSTRAINT producto_abarrote_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES abarrotes (iddepartamento));
--Agregamos el constraint para asegurar que refrigeracion es SI o NO
ALTER TABLE producto_abarrote ADD (CONSTRAINT producto_abarrote_refrigeracion CHECK (UPPER(refrigeracion)='SI' OR UPPER(refrigeracion)='NO' OR LOWER(refrigeracion)='si' OR LOWER(refrigeracion)='no'));
--Modificacion de la tabla para la practica 7 (Quitamos idcompra y su respectivo constraint)
ALTER TABLE producto_abarrote
DROP COLUMN idcompra;
ALTER TABLE producto_abarrote
DROP COLUMN departamento;
CREATE TABLE producto_vino
  (
    idproducto NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20,
    iddepartamento NUMBER,
    idcompra       NUMBER,
    nombre         VARCHAR2(50) NOT NULL,
    precio         NUMBER NOT NULL,
    cantidad       VARCHAR2(50) NOT NULL,
    marca          VARCHAR2(50) NOT NULL,
    presentacion   VARCHAR2(50) NOT NULL,
    departamento   VARCHAR2(50) NOT NULL,
    tipoproducto   VARCHAR2(50) NOT NULL,
    refrigeracion  VARCHAR2(2) NOT NULL,
    felaboracion   DATE NOT NULL,
    fcaducidad     DATE NOT NULL,
    color          CHAR(20) NOT NULL,
    stock          NUMBER DEFAULT 0 NOT NULL
  );
--Agregamos la llave primaria y la hacemos unica
ALTER TABLE producto_vino ADD (CONSTRAINT producto_vino_PK PRIMARY KEY (idproducto));
--Agregamos las llaves foraneas
ALTER TABLE producto_vino ADD (CONSTRAINT producto_vino_iddepartamento_FK FOREIGN KEY (iddepartamento) REFERENCES vinosylicores (iddepartamento));
--Agregamos el constraint para asegurar que refrigeracion es SI o NO
ALTER TABLE producto_vino ADD (CONSTRAINT producto_vino_refrigeracion CHECK (UPPER(refrigeracion)='SI' OR UPPER(refrigeracion)='NO' OR LOWER(refrigeracion)='si' OR LOWER(refrigeracion)='no'));
--Modificacion de la tabla para la practica 7 (Quitamos idcompra y su respectivo constraint)
ALTER TABLE producto_vino
DROP COLUMN idcompra;
ALTER TABLE producto_vino
DROP COLUMN departamento;
--Creacion de la relacion Compra_Contiene_Producto_
CREATE TABLE compra_has_controlado
  (
    idcompra   NUMBER,
    idproducto NUMBER,
    CONSTRAINT compra_has_controlado_idcompra_FK FOREIGN KEY (idcompra) REFERENCES compra (idcompra),
    CONSTRAINT compra_has_controlado_idproducto_FK FOREIGN KEY (idproducto) REFERENCES producto_med_controlado (idproducto),
    CONSTRAINT compra_has_controlado_PK PRIMARY KEY (idcompra, idproducto)
  );
CREATE TABLE compra_has_libre
  (
    idproducto NUMBER,
    idcompra   NUMBER,
    CONSTRAINT compra_has_libre_idcompra_FK FOREIGN KEY (idcompra) REFERENCES compra (idcompra),
    CONSTRAINT compra_has_libre_idproducto_FK FOREIGN KEY (idproducto) REFERENCES producto_med_libre (idproducto),
    CONSTRAINT compra_has_libre_PK PRIMARY KEY (idcompra, idproducto)
  );
CREATE TABLE compra_has_abarrote
  (
    idproducto NUMBER,
    idcompra   NUMBER,
    CONSTRAINT compra_has_abarrote_idcompra_FK FOREIGN KEY (idcompra) REFERENCES compra (idcompra),
    CONSTRAINT compra_has_abarrote_idproducto_FK FOREIGN KEY (idproducto) REFERENCES producto_abarrote (idproducto),
    CONSTRAINT compra_has_abarrote_PK PRIMARY KEY (idcompra, idproducto)
  );
CREATE TABLE compra_has_vino
  (
    idproducto NUMBER,
    idcompra   NUMBER,
    CONSTRAINT compra_has_vino_idcompra_FK FOREIGN KEY (idcompra) REFERENCES compra (idcompra),
    CONSTRAINT compra_has_vino_idproducto_FK FOREIGN KEY (idproducto) REFERENCES producto_vino (idproducto),
    CONSTRAINT compra_has_vino_PK PRIMARY KEY (idcompra, idproducto)
  );
--Creacion de la entidad Proveedor
CREATE TABLE proveedor
  (
    idproveedor NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20,
    nombre VARCHAR2(50),
    CONSTRAINT idproveedor_PK PRIMARY KEY (idproveedor)
  );
CREATE TABLE telefonos_proveedor
  (
    telefono    VARCHAR(14),
    idproveedor NUMBER,
    CONSTRAINT telefonos_proveedor_telefono_PK PRIMARY KEY (telefono),
    CONSTRAINT telefonos_proveedor_idproveedor_FK FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor)
  );
--Creacion de las relaciones suministrar entre proveedor y producto a los distintos tipos de productos
CREATE TABLE provedor_sum_controlado
  (
    idproducto      NUMBER,
    idproveedor     NUMBER,
    fechasuministro DATE DEFAULT sysdate NOT NULL,
    CONSTRAINT provedor_sum_controlado_idproducto_FK FOREIGN KEY (idproducto) REFERENCES producto_med_controlado (idproducto),
    CONSTRAINT provedor_sum_controlado_idproveedor_FK FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor)
  );
ALTER TABLE provedor_sum_controlado ADD CONSTRAINT provedor_sum_controlado_PK PRIMARY KEY (idproducto, idproveedor);
CREATE TABLE proveedor_sum_libre
  (
    idproducto      NUMBER,
    idproveedor     NUMBER,
    fechasuministro DATE DEFAULT sysdate NOT NULL,
    CONSTRAINT proveedor_sum_libre_idproducto_FK FOREIGN KEY (idproducto) REFERENCES producto_med_libre (idproducto),
    CONSTRAINT proveedor_sum_libre_idproveedor_FK FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor)
  );
ALTER TABLE proveedor_sum_libre ADD CONSTRAINT proveedor_sum_libre_PK PRIMARY KEY (idproducto, idproveedor);
CREATE TABLE proveedor_sum_abarrote
  (
    idproducto      NUMBER,
    idproveedor     NUMBER,
    fechasuministro DATE DEFAULT sysdate NOT NULL,
    CONSTRAINT proveedor_sum_abarrote_idproducto_FK FOREIGN KEY (idproducto) REFERENCES producto_abarrote (idproducto),
    CONSTRAINT proveedor_sum_abarrote_idproveedor_FK FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor)
  );
ALTER TABLE proveedor_sum_abarrote ADD CONSTRAINT proveedor_sum_abarrote_PK PRIMARY KEY (idproducto, idproveedor);
CREATE TABLE proveedor_sum_vino
  (
    idproducto      NUMBER,
    idproveedor     NUMBER,
    fechasuministro DATE DEFAULT sysdate NOT NULL,
    CONSTRAINT proveedor_sum_vino_idproducto_FK FOREIGN KEY (idproducto) REFERENCES producto_vino (idproducto),
    CONSTRAINT proveedor_sum_vino_idproveedor_FK FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor)
  );
ALTER TABLE proveedor_sum_vino ADD CONSTRAINT proveedor_sum_vino_PK PRIMARY KEY (idproducto, idproveedor);