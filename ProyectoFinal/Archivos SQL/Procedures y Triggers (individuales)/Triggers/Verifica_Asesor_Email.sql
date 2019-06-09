/*
Verifica que el email de un dueño contenga un @ y un punto
*/
CREATE OR REPLACE TRIGGER VERIFICA_DUEÑO_EMAIL BEFORE
  INSERT OR
  UPDATE OF CORREO ON DUEÑO_EMAIL FOR EACH ROW WHEN(NOT REGEXP_LIKE(NEW.CORREO, '.*[@].*..*')) BEGIN RAISE_APPLICATION_ERROR (-20001, 'Introduce un email valido, debe llevar un @ y un .');
END;