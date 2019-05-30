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