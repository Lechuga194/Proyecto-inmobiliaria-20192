/*
Verifica si en el campo existeConstruccion solo se ingresen
valores de SI o NO
*/
CREATE OR REPLACE TRIGGER NUEVO_TERRENO BEFORE
  INSERT OR
  UPDATE OF EXISTECONSTRUCCION ON TERRENO FOR EACH ROW WHEN(NEW.EXISTECONSTRUCCION <> 'SI'
  OR NEW.EXISTECONSTRUCCION                                                        <> 'NO') BEGIN RAISE_APPLICATION_ERROR (-20006, 'Asegurate de ingresar SI o NO en mayusculas!');
END;