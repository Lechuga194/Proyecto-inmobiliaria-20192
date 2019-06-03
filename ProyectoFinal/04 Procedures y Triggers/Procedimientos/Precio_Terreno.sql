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
\