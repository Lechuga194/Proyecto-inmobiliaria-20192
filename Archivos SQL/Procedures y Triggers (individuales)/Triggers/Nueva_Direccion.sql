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
\