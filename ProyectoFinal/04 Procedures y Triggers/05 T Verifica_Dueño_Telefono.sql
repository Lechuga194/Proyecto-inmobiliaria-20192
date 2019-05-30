/*
Verifica que el telefono de un dueño solo contenga numeros
*/
CREATE OR REPLACE TRIGGER VERIFICA_DUEÑO_TELEFONO BEFORE
  INSERT OR
  UPDATE OF telefono ON DUEÑO_TELEFONO FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.TELEFONO, '^[0-9]')) BEGIN RAISE_APPLICATION_ERROR (-20002, 'Solo debes introducir numeros en el telefono!');
END;