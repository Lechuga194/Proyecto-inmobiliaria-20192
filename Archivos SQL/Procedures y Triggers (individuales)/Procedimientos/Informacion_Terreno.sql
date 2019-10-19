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
\