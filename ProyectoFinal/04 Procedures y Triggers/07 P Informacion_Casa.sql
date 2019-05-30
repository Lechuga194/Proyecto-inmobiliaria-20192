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