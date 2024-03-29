/*
Este procedimiento sirve para saber el costo de  TERRENO en una fecha
determinada, recibe dos parametros primero el numRegistro de la TERRENO y luego
la fecha que se desea
Regresa el costo de un TERRENO en la fecha asignada, si no se asigna una fecha,
se usara la fecha del sistema.
*/
CREATE OR REPLACE PROCEDURE PRECIO_TERRENO(
    TERRENO IN TERRENO.NUMREGISTRO%TYPE,
    FECHA   IN DATE DEFAULT SYSDATE)
IS
  COSTO NUMBER := 0;
BEGIN
  IF TERRENO <0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'El numero de registro debe ser mayor que cero!');
  END IF;
  SELECT PRECIO
  INTO COSTO
  FROM TERRENO
  JOIN TERRENO_PRECIO
  ON (TERRENO.NUMREGISTRO          = TERRENO_PRECIO.NUMREGISTRO)
  WHERE TERRENO_PRECIO.NUMREGISTRO = TERRENO
  AND FECHA                        = TERRENO_PRECIO.FECHA;
  DBMS_OUTPUT.PUT_LINE('TERRENO: ' || TERRENO || ' Precio: ' || COSTO);
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('TERRENO no encontrado!');
END;
/
/*
Este procedimiento sirve para saber el costo de  DEPARTAMENTO en una fecha
determinada, recibe dos parametros primero el numRegistro de la DEPARTAMENTO y luego
la fecha que se desea
Regresa el costo de un DEPARTAMENTO en la fecha asignada, si no se asigna una fecha,
se usara la fecha del sistema.
*/
CREATE OR REPLACE PROCEDURE PRECIO_DEPARTAMENTO(
    DEPARTAMENTO IN DEPARTAMENTO.NUMREGISTRO%TYPE,
    FECHA        IN DATE DEFAULT SYSDATE)
IS
  COSTO NUMBER := 0;
BEGIN
  IF DEPARTAMENTO <0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'El numero de registro debe ser mayor que cero!');
  END IF;
  SELECT PRECIO
  INTO COSTO
  FROM DEPARTAMENTO
  JOIN DEPARTAMENTO_PRECIO
  ON (DEPARTAMENTO.NUMREGISTRO          = DEPARTAMENTO_PRECIO.NUMREGISTRO)
  WHERE DEPARTAMENTO_PRECIO.NUMREGISTRO = DEPARTAMENTO
  AND FECHA                             = DEPARTAMENTO_PRECIO.FECHA;
  DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO: ' || DEPARTAMENTO || ' Precio: ' || COSTO);
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO no encontrado!');
END;
/
/*
Este procedimiento sirve para saber el costo de una casa en una fecha
determinada, recibe dos parametros primero el numRegistro de la casa y luego
la fecha que se desea
Regresa el costo de la casa en la fecha asignada, si no se asigna una fecha,
se usara la fecha del sistema.
*/
CREATE OR REPLACE PROCEDURE PRECIO_CASA(
    CASA  IN CASA.NUMREGISTRO%TYPE,
    FECHA IN DATE DEFAULT SYSDATE)
IS
  COSTO NUMBER := 0;
BEGIN
  IF CASA <0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'El numero de registro debe ser mayor que cero!');
  END IF;
  SELECT PRECIO
  INTO COSTO
  FROM CASA
  JOIN CASA_PRECIO
  ON (CASA.NUMREGISTRO          = CASA_PRECIO.NUMREGISTRO)
  WHERE CASA_PRECIO.NUMREGISTRO = CASA
  AND FECHA                     = CASA_PRECIO.FECHA;
  DBMS_OUTPUT.PUT_LINE('Casa: ' || CASA || ' Precio: ' || COSTO);
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('Casa no encontrada!');
END;
/
create or replace PROCEDURE INFORMACION_TERRENO(
    TERRENO IN TERRENO.NUMREGISTRO%TYPE)
IS
BEGIN
  IF TERRENO <0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'El numero de registro debe ser mayor que cero!');
  END IF;
  --Despliega la informacion de la TERRENO
  FOR i IN
  (SELECT * FROM TERRENO WHERE NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('TERRENO:' || i.NUMREGISTRO ||'Valor catastral:' || i.VALORCATASTRAL || '¿Existe construccion?' || i.EXISTECONSTRUCCION);
  END LOOP;
  --Despliega la direccion de la TERRENO
  FOR i IN
  (SELECT d.ESTADO,
    d.MUNICIPIO,
    colo.NOMBRE,
    d.CP,
    d.CALLE,
    d.NEXTERIOR,
    d.NINTERIOR
  FROM TERRENO c
  JOIN TERRENO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA     = colo.IDCOLONIA)
  WHERE c.NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('Direccion: ' || i.ESTADO || '' || i.MUNICIPIO || '' || i.NOMBRE || '' || i.CP || '' || i.CALLE || '' || i.NEXTERIOR || '' || i.NINTERIOR);
  END LOOP;
    --Despliega los servicios del Terremo
  DBMS_OUTPUT.PUT_LINE('Servicios del Terremo');
  FOR i IN
  (SELECT ser.NOMBRE,
    ser.DESCRIPCION,
    ser.PRECIOANUAL
  FROM TERRENO c
  JOIN TERRENO_SERVICIO c_s
  ON(c.NUMREGISTRO = c_s.NUMREGISTRO)
  JOIN SERVICIO ser
  ON(c_s.IDSERVICIO   = ser.IDSERVICIO)
  WHERE c.NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRE || i.DESCRIPCION || i.PRECIOANUAL);
  END LOOP;
  --Despliega los seguros del Terremo
  DBMS_OUTPUT.PUT_LINE('Seguros del Terremo');
  FOR i IN
  (SELECT seg.NUMPOLIZA,
    seg.ASEGURADORA,
    seg.TIPOCOVERTURA,
    seg.PRECIOANUAL
  FROM TERRENO c
  JOIN TERRENO_SEGURO c_g
  ON(c.NUMREGISTRO = c_g.NUMREGISTRO)
  JOIN SEGURO seg
  ON(c_g.NUMPOLIZA    = seg.NUMPOLIZA)
  WHERE c.NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NUMPOLIZA || i.ASEGURADORA || i.TIPOCOVERTURA || i.PRECIOANUAL);
  END LOOP;
  --Despliega las tiendas cercanas a la Terremo
  DBMS_OUTPUT.PUT_LINE('Tiendas cercanas:');
  FOR i IN
  (SELECT t_c.NOMBRETIENDA
  FROM TERRENO c
  JOIN TERRENO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN TIENDAS_CERCANAS t_c
  ON(colo.IDCOLONIA   = t_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRETIENDA);
  END LOOP;
  --Despliega los recreativos cercanos a la Terremo
  DBMS_OUTPUT.PUT_LINE('Recreativos cercanos:');
  FOR i IN
  (SELECT r_c.NOMBRERECREATIVO
  FROM TERRENO c
  JOIN TERRENO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN RECREATIVOS_CERCANOS r_c
  ON(colo.IDCOLONIA   = r_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRERECREATIVO);
  END LOOP;
  --Despliega las escuelas cercanas a la Terremo
  DBMS_OUTPUT.PUT_LINE('Escuelas cercanas:');
  FOR i IN
  (SELECT e_c.NOMBREESCUELA
  FROM TERRENO c
  JOIN TERRENO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN ESCUELAS_CERCANAS e_c
  ON(colo.IDCOLONIA   = e_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBREESCUELA);
  END LOOP;
  --Despliega los hospitales cercanos a la Terremo
  DBMS_OUTPUT.PUT_LINE('Hospitales cercanos:');
  FOR i IN
  (SELECT h_c.NOMBREHOSPITAL
  FROM TERRENO c
  JOIN TERRENO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN HOSPITALES_CERCANOS h_c
  ON(colo.IDCOLONIA   = h_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBREHOSPITAL);
  END LOOP;
  --Despliega los transportes cercanos a la Terremo
  DBMS_OUTPUT.PUT_LINE('Transportes cercanos:');
  FOR i IN
  (SELECT tr_c.NOMBRETRANSPORTE
  FROM TERRENO c
  JOIN TERRENO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN TRANSPORTES_CERCANOS tr_c
  ON(colo.IDCOLONIA   = tr_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = TERRENO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRETRANSPORTE);
  END LOOP;
END;
/
create or replace PROCEDURE INFORMACION_DEPARTAMENTO(
    DEPARTAMENTO IN DEPARTAMENTO.NUMREGISTRO%TYPE)
IS
BEGIN
  IF DEPARTAMENTO <0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'El numero de registro debe ser mayor que cero!');
  END IF;
  --Despliega la informacion de la DEPARTAMENTO
  FOR i IN
  (SELECT * FROM DEPARTAMENTO WHERE NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO:' || i.NUMREGISTRO || 'Fecha Construccion' || i.FCONSTRUCCION ||'Valor catastral:' || i.VALORCATASTRAL || 'Material:' || i.MATERIALCONSTRUCCION || 'Ubicado en piso:' || i.UBICADOENPISO || 'Total en edificio:' || i.TOTALENEDIFICIO || 'Mantenimiento anual:' || i.MANTENIMIENTOANUAL ||'Habitaciones:' || i.NHABITACIONES || 'Baños Completos:' || i.NBAÑOSCOMPLETOS || 'Baños Medios' || i.NBAÑOSMEDIOS || 'Cajones de estacionamiento:' || i.NESTACIONAMIENTOS);
  END LOOP;
  --Despliega la direccion de la DEPARTAMENTO
  FOR i IN
  (SELECT d.ESTADO,
    d.MUNICIPIO,
    colo.NOMBRE,
    d.CP,
    d.CALLE,
    d.NEXTERIOR,
    d.NINTERIOR
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA     = colo.IDCOLONIA)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('Direccion: ' || i.ESTADO || '' || i.MUNICIPIO || '' || i.NOMBRE || '' || i.CP || '' || i.CALLE || '' || i.NEXTERIOR || '' || i.NINTERIOR);
  END LOOP;
  --Despliega las caracteristicas de la vivienda
  DBMS_OUTPUT.PUT_LINE('Caracteristicas de la vivienda');
  FOR i IN
  (SELECT car.NOMBRE,
    car.DESCRIPCION
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_CARACTERISTICA c_c
  ON(c.NUMREGISTRO = c_c.NUMREGISTRO)
  JOIN CARACTERISTICA car
  ON(c_c.IDCARACTERISTICA = car.IDCARACTERISTICA)
  WHERE c.NUMREGISTRO     = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRE || i.DESCRIPCION);
  END LOOP;
  --Despliega las amenidades de la vivienda
  DBMS_OUTPUT.PUT_LINE('Amenidades de la vivienda');
  FOR i IN
  (SELECT ame.NOMBRE,
    ame.DESCRIPCION
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_AMENIDAD c_a
  ON(c.NUMREGISTRO = c_a.NUMREGISTRO)
  JOIN AMENIDAD ame
  ON(c_a.IDAMENIDAD   = ame.IDAMENIDAD)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRE || i.DESCRIPCION);
  END LOOP;
  --Despliega los servicios de la vivienda
  DBMS_OUTPUT.PUT_LINE('Servicios de la vivienda');
  FOR i IN
  (SELECT ser.NOMBRE,
    ser.DESCRIPCION,
    ser.PRECIOANUAL
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_SERVICIO c_s
  ON(c.NUMREGISTRO = c_s.NUMREGISTRO)
  JOIN SERVICIO ser
  ON(c_s.IDSERVICIO   = ser.IDSERVICIO)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRE || i.DESCRIPCION || i.PRECIOANUAL);
  END LOOP;
  --Despliega los seguros de la vivienda
  DBMS_OUTPUT.PUT_LINE('Seguros de la vivienda');
  FOR i IN
  (SELECT seg.NUMPOLIZA,
    seg.ASEGURADORA,
    seg.TIPOCOVERTURA,
    seg.PRECIOANUAL
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_SEGURO c_g
  ON(c.NUMREGISTRO = c_g.NUMREGISTRO)
  JOIN SEGURO seg
  ON(c_g.NUMPOLIZA    = seg.NUMPOLIZA)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NUMPOLIZA || i.ASEGURADORA || i.TIPOCOVERTURA || i.PRECIOANUAL);
  END LOOP;
  --Despliega las tiendas cercanas a la vivienda
  DBMS_OUTPUT.PUT_LINE('Tiendas cercanas:');
  FOR i IN
  (SELECT t_c.NOMBRETIENDA
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN TIENDAS_CERCANAS t_c
  ON(colo.IDCOLONIA   = t_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRETIENDA);
  END LOOP;
  --Despliega los recreativos cercanos a la vivienda
  DBMS_OUTPUT.PUT_LINE('Recreativos cercanos:');
  FOR i IN
  (SELECT r_c.NOMBRERECREATIVO
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN RECREATIVOS_CERCANOS r_c
  ON(colo.IDCOLONIA   = r_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRERECREATIVO);
  END LOOP;
  --Despliega las escuelas cercanas a la vivienda
  DBMS_OUTPUT.PUT_LINE('Escuelas cercanas:');
  FOR i IN
  (SELECT e_c.NOMBREESCUELA
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN ESCUELAS_CERCANAS e_c
  ON(colo.IDCOLONIA   = e_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBREESCUELA);
  END LOOP;
  --Despliega los hospitales cercanos a la vivienda
  DBMS_OUTPUT.PUT_LINE('Hospitales cercanos:');
  FOR i IN
  (SELECT h_c.NOMBREHOSPITAL
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN HOSPITALES_CERCANOS h_c
  ON(colo.IDCOLONIA   = h_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBREHOSPITAL);
  END LOOP;
  --Despliega los transportes cercanos a la vivienda
  DBMS_OUTPUT.PUT_LINE('Transportes cercanos:');
  FOR i IN
  (SELECT tr_c.NOMBRETRANSPORTE
  FROM DEPARTAMENTO c
  JOIN DEPARTAMENTO_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN TRANSPORTES_CERCANOS tr_c
  ON(colo.IDCOLONIA   = tr_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = DEPARTAMENTO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRETRANSPORTE);
  END LOOP;
END;
/
/*
Este procedimiento regresa la informacion completa de una CASA junto con
todas las caracteristicas, amenidades, servicios
y seguros con los que cuenta una CASA, así como las cosas cercanas en la colonia donde
se encuentra la casa
*/
CREATE OR REPLACE PROCEDURE INFORMACION_CASA(
    CASA IN CASA.NUMREGISTRO%TYPE)
IS
BEGIN
  IF CASA <0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'El numero de registro debe ser mayor que cero!');
  END IF;
  --Despliega la informacion de la casa
  FOR i IN
  (SELECT * FROM CASA WHERE NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('CASA:' || i.NUMREGISTRO || 'Fecha Construccion ' || i.FCONSTRUCCION ||'Valor catastral:' || i.VALORCATASTRAL || 'Material:' || i.MATERIALCONSTRUCCION || 'Niveles: '|| i.NPISOS ||'Habitaciones: ' || i.NHABITACIONES || 'Baños Completos: ' || i.NBAÑOSCOMPLETOS || 'Baños Medios' || i.NBAÑOSMEDIOS || 'Cajones de estacionamiento: ' || i.NESTACIONAMIENTOS);
  END LOOP;
  --Despliega la direccion de la casa
  FOR i IN
  (SELECT d.ESTADO,
    d.MUNICIPIO,
    colo.NOMBRE,
    d.CP,
    d.CALLE,
    d.NEXTERIOR,
    d.NINTERIOR
  FROM CASA c
  JOIN CASA_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA     = colo.IDCOLONIA)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('Direccion: ' || i.ESTADO || '' || i.MUNICIPIO || '' || i.NOMBRE || '' || i.CP || '' || i.CALLE || '' || i.NEXTERIOR || '' || i.NINTERIOR);
  END LOOP;
  --Despliega las caracteristicas de la vivienda
  DBMS_OUTPUT.PUT_LINE('Caracteristicas de la vivienda');
  FOR i IN
  (SELECT car.NOMBRE,
    car.DESCRIPCION
  FROM CASA c
  JOIN CASA_CARACTERISTICA c_c
  ON(c.NUMREGISTRO = c_c.NUMREGISTRO)
  JOIN CARACTERISTICA car
  ON(c_c.IDCARACTERISTICA = car.IDCARACTERISTICA)
  WHERE c.NUMREGISTRO     = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRE || i.DESCRIPCION);
  END LOOP;
  --Despliega las amenidades de la vivienda
  DBMS_OUTPUT.PUT_LINE('Amenidades de la vivienda');
  FOR i IN
  (SELECT ame.NOMBRE,
    ame.DESCRIPCION
  FROM CASA c
  JOIN CASA_AMENIDAD c_a
  ON(c.NUMREGISTRO = c_a.NUMREGISTRO)
  JOIN AMENIDAD ame
  ON(c_a.IDAMENIDAD   = ame.IDAMENIDAD)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRE || i.DESCRIPCION);
  END LOOP;
  --Despliega los servicios de la vivienda
  DBMS_OUTPUT.PUT_LINE('Servicios de la vivienda');
  FOR i IN
  (SELECT ser.NOMBRE,
    ser.DESCRIPCION,
    ser.PRECIOANUAL
  FROM CASA c
  JOIN CASA_SERVICIO c_s
  ON(c.NUMREGISTRO = c_s.NUMREGISTRO)
  JOIN SERVICIO ser
  ON(c_s.IDSERVICIO   = ser.IDSERVICIO)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRE || i.DESCRIPCION || i.PRECIOANUAL);
  END LOOP;
  --Despliega los seguros de la vivienda
  DBMS_OUTPUT.PUT_LINE('Seguros de la vivienda');
  FOR i IN
  (SELECT seg.NUMPOLIZA,
    seg.ASEGURADORA,
    seg.TIPOCOVERTURA,
    seg.PRECIOANUAL
  FROM CASA c
  JOIN CASA_SEGURO c_g
  ON(c.NUMREGISTRO = c_g.NUMREGISTRO)
  JOIN SEGURO seg
  ON(c_g.NUMPOLIZA    = seg.NUMPOLIZA)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NUMPOLIZA || i.ASEGURADORA || i.TIPOCOVERTURA || i.PRECIOANUAL);
  END LOOP;
  --Despliega las tiendas cercanas a la vivienda
  DBMS_OUTPUT.PUT_LINE('Tiendas cercanas:');
  FOR i IN
  (SELECT t_c.NOMBRETIENDA
  FROM CASA c
  JOIN CASA_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN TIENDAS_CERCANAS t_c
  ON(colo.IDCOLONIA   = t_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRETIENDA);
  END LOOP;
  --Despliega los recreativos cercanos a la vivienda
  DBMS_OUTPUT.PUT_LINE('Recreativos cercanos:');
  FOR i IN
  (SELECT r_c.NOMBRERECREATIVO
  FROM CASA c
  JOIN CASA_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN RECREATIVOS_CERCANOS r_c
  ON(colo.IDCOLONIA   = r_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRERECREATIVO);
  END LOOP;
  --Despliega las escuelas cercanas a la vivienda
  DBMS_OUTPUT.PUT_LINE('Escuelas cercanas:');
  FOR i IN
  (SELECT e_c.NOMBREESCUELA
  FROM CASA c
  JOIN CASA_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN ESCUELAS_CERCANAS e_c
  ON(colo.IDCOLONIA   = e_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBREESCUELA);
  END LOOP;
  --Despliega los hospitales cercanos a la vivienda
  DBMS_OUTPUT.PUT_LINE('Hospitales cercanos:');
  FOR i IN
  (SELECT h_c.NOMBREHOSPITAL
  FROM CASA c
  JOIN CASA_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN HOSPITALES_CERCANOS h_c
  ON(colo.IDCOLONIA   = h_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBREHOSPITAL);
  END LOOP;
  --Despliega los transportes cercanos a la vivienda
  DBMS_OUTPUT.PUT_LINE('Transportes cercanos:');
  FOR i IN
  (SELECT tr_c.NOMBRETRANSPORTE
  FROM CASA c
  JOIN CASA_DIRECCION c_d
  ON (c.NUMREGISTRO = c_d.NUMREGISTRO)
  JOIN DIRECCION d
  ON (d.IDDIRECCION = c_d.IDDIRECCION)
  JOIN COLONIA colo
  ON (d.IDCOLONIA = colo.IDCOLONIA)
  JOIN TRANSPORTES_CERCANOS tr_c
  ON(colo.IDCOLONIA   = tr_c.IDCOLONIA)
  WHERE c.NUMREGISTRO = CASA
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NOMBRETRANSPORTE);
  END LOOP;
END;
/
/*
Este procedimiento nos regresa el historial de precios que ha tenido una TERRENO
recibe unicamente el numRegistro de la TERRENO
tiene dos excepciones una si el numero de registro que le pasamos es menor a 0
y otro que indica cuando no encuentra ningun registro con ese numero
*/
CREATE OR REPLACE PROCEDURE HISTORIAL_PRECIO_TERRENO(
    TERRENO IN TERRENO_PRECIO.NUMREGISTRO%TYPE)
IS
BEGIN
  IF TERRENO <0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'El numero de registro debe ser mayor que cero!');
  END IF;
  FOR i IN
  (SELECT * FROM TERRENO_PRECIO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NUMREGISTRO || i.FECHA || i.PRECIO);
  END LOOP;
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('TERRENO no encontrada!');
END;
/
/*
Este procedimiento nos regresa el historial de precios que ha tenido una DEPARTAMENTO
recibe unicamente el numRegistro de la DEPARTAMENTO
tiene dos excepciones una si el numero de registro que le pasamos es menor a 0
y otro que indica cuando no encuentra ningun registro con ese numero
*/
CREATE OR REPLACE PROCEDURE HISTORIAL_PRECIO_DEPARTAMENTO(
    DEPARTAMENTO IN DEPARTAMENTO_PRECIO.NUMREGISTRO%TYPE)
IS
BEGIN
  IF DEPARTAMENTO <0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'El numero de registro debe ser mayor que cero!');
  END IF;
  FOR i IN
  (SELECT * FROM DEPARTAMENTO_PRECIO
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(i.NUMREGISTRO || i.FECHA || i.PRECIO);
  END LOOP;
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO no encontrada!');
END;
/
/*
Verifica que el telefono de un dueño solo contenga numeros
*/
CREATE OR REPLACE TRIGGER VERIFICA_DUEÑO_TELEFONO BEFORE
  INSERT OR
  UPDATE OF telefono ON DUEÑO_TELEFONO FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.TELEFONO, '^[0-9]')) BEGIN RAISE_APPLICATION_ERROR (-20002, 'Solo debes introducir numeros en el telefono!');
END;
/
/*
Verifica que el email de un dueño contenga al menos un @ y un punto
*/
CREATE OR REPLACE TRIGGER VERIFICA_DUEÑO_EMAIL BEFORE
  INSERT OR
  UPDATE OF CORREO ON DUEÑO_EMAIL FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.CORREO, '.*[@].*..*')) BEGIN RAISE_APPLICATION_ERROR (-20001, 'Introduce un email valido, debe llevar un @ y un .');
END;
/
/*
Verifica que el telefono del asesor solo contenga
caracteres numericos
*/
CREATE OR REPLACE TRIGGER VERIFICA_ASESOR_TELEFONO BEFORE
  INSERT OR
  UPDATE OF telefono ON ASESOR_TELEFONO FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.TELEFONO, '^[0-9]')) BEGIN RAISE_APPLICATION_ERROR (-20002, 'Solo debes introducir numeros en el telefono!');
END;
/
/*
Se encarga de verificar que se reciban valores numericos
en los campos (ya que use char en vez de number)
NBAÑOSMEDIOS,
NBAÑOSCOMPLETOS,
NESTACIONAMIENTOS,
NHABITACIONES,
TAMAÑOHABITABLEMETROS,
TAMAÑOTERRENO,
UBICADOENPISO,
TOTALENEDIFICIO
*/
CREATE OR REPLACE TRIGGER NUEVO_DEPARTAMENTO BEFORE
  INSERT OR
  UPDATE OF NBAÑOSMEDIOS,
    NBAÑOSCOMPLETOS,
    NESTACIONAMIENTOS,
    NHABITACIONES,
    TAMAÑOHABITABLEMETROS,
    TAMAÑOTERRENO,
    UBICADOENPISO,
    TOTALENEDIFICIO ON DEPARTAMENTO FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.NBAÑOSMEDIOS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.NBAÑOSCOMPLETOS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.NESTACIONAMIENTOS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.NHABITACIONES, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.TAMAÑOHABITABLEMETROS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.TAMAÑOTERRENO, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.UBICADOENPISO, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.TOTALENEDIFICIO, '^[0-9]')) BEGIN RAISE_APPLICATION_ERROR (-20006, 'Debes introducir solo numeros en NBAÑOSMEDIOS,    
NBAÑOSCOMPLETOS,    
NESTACIONAMIENTOS,    
NHABITACIONES,    
NPISOS,    
TAMAÑOHABITABLEMETROS,    
TAMAÑOTERRENO
UBICADOENPISO
TOTALENEDIFICIO!');
END;
/
/*
Verifica que el codigo postal, numero exterior e interior
sean solo caracteres numericos
*/
CREATE OR REPLACE TRIGGER NUEVA_DIRECCION BEFORE
  INSERT OR
  UPDATE OF CP,
    nExterior,
    nInterior ON DIRECCION FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.CP, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.nExterior, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.nInterior, '^[0-9]')) BEGIN RAISE_APPLICATION_ERROR (-20000, 'Debes introducir solo numeros en CP, nExterior e nInterior!!');
END;
/
/*
Se encarga de verificar que se reciban valores numericos
en los campos (ya que use char en vez de number)
NBAÑOSMEDIOS,
NBAÑOSCOMPLETOS,
NESTACIONAMIENTOS,
NHABITACIONES,
NPISOS,
TAMAÑOHABITABLEMETROS,
TAMAÑOTERRENO
*/
CREATE OR REPLACE TRIGGER NUEVA_CASA BEFORE
  INSERT OR
  UPDATE OF NBAÑOSMEDIOS,
    NBAÑOSCOMPLETOS,
    NESTACIONAMIENTOS,
    NHABITACIONES,
    NPISOS,
    TAMAÑOHABITABLEMETROS,
    TAMAÑOTERRENO ON CASA FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.NBAÑOSMEDIOS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.NBAÑOSCOMPLETOS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.NESTACIONAMIENTOS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.NHABITACIONES, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.NPISOS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.TAMAÑOHABITABLEMETROS, '^[0-9]')
  OR NOT REGEXP_LIKE(NEW.TAMAÑOTERRENO, '^[0-9]')) BEGIN RAISE_APPLICATION_ERROR (-20002, 'Solo debes introducir numeros en el telefono!');
END;
/
/*
Trigger que agrega un exdueño cada que la propiedad cambia de dueño
*/
CREATE OR REPLACE TRIGGER AGREGA_EXDUEÑO_TERRENO BEFORE
  UPDATE OF IDDUEÑO ON TERRENO_VENTA_DUEÑO FOR EACH ROW DECLARE BEGIN
  INSERT
  INTO TERRENO_EXDUEÑO VALUES
    (
      :OLD.IDDUEÑO,
      :OLD.NUMREGISTRO,
      SYSDATE,
      :OLD.FADQUISICION
    );
END;
/
/*
Trigger que agrega un exdueño cada que la propiedad cambia de dueño
*/
CREATE OR REPLACE TRIGGER AGREGA_EXDUEÑO_DEPARTAMENTO BEFORE
  UPDATE OF IDDUEÑO ON DEPARTAMENTO_VENTA_DUEÑO FOR EACH ROW DECLARE BEGIN
  INSERT
  INTO DEPARTAMENTO_EXDUEÑO VALUES
    (
      :OLD.IDDUEÑO,
      :OLD.NUMREGISTRO,
      SYSDATE,
      :OLD.FADQUISICION
    );
END;
/
/*
Trigger que agrega un exdueño cada que la propiedad cambia de dueño
*/
CREATE OR REPLACE TRIGGER AGREGA_EXDUEÑO_CASA BEFORE
  UPDATE OF IDDUEÑO ON CASA_VENTA_DUEÑO FOR EACH ROW DECLARE BEGIN
  INSERT
  INTO CASA_EXDUEÑO VALUES
    (
      :OLD.IDDUEÑO,
      :OLD.NUMREGISTRO,
      SYSDATE,
      :OLD.FADQUISICION
    );
END;
/