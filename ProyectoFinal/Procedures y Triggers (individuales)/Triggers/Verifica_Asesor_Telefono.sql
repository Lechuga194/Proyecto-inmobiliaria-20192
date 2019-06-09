/*
Verifica que el telefono del asesor solo contenga
caracteres numericos
*/
CREATE OR REPLACE TRIGGER VERIFICA_ASESOR_TELEFONO BEFORE
  INSERT OR
  UPDATE OF telefono ON ASESOR_TELEFONO FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.TELEFONO, '^[0-9]')) BEGIN RAISE_APPLICATION_ERROR (-20002, 'Solo debes introducir numeros en el telefono!');
END;
\