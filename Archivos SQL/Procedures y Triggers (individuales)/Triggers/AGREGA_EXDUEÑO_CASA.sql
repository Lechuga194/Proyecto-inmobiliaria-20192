/*
Trigger que agrega un exdue�o cada que la propiedad cambia de due�o
*/
CREATE OR REPLACE TRIGGER AGREGA_EXDUE�O_CASA BEFORE
  UPDATE OF IDDUE�O ON CASA_VENTA_DUE�O FOR EACH ROW DECLARE BEGIN
  INSERT
  INTO CASA_EXDUE�O VALUES
    (
      :OLD.IDDUE�O,
      :OLD.NUMREGISTRO,
      SYSDATE,
      :OLD.FADQUISICION
    );
END;
\