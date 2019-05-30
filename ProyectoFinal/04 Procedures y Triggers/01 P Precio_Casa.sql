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
  WHERE CASA_PRECIO.NUMREGISTRO = CASA AND FECHA = CASA_PRECIO.FECHA;
  DBMS_OUTPUT.PUT_LINE('Casa: ' || CASA || ' Precio: ' || COSTO);
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('Casa no encontrada!');
END;