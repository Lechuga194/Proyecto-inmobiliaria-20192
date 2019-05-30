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