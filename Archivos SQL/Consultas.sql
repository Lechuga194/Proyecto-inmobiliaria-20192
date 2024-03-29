--1: Regresa el sueldo promedio de los asesores y los agrupa por empresa
SELECT EMPRESA.NOMBRE,
AVG(SUELDO) AS PROMEDIO
FROM ASESOR
JOIN EMPRESA
ON (ASESOR.IDEMPRESA = EMPRESA.IDEMPRESA)
GROUP BY ASESOR.IDEMPRESA,
EMPRESA.NOMBRE;
/
--2: Regresa los DUE�OS que cumplen a�os el mismo dia y mes (De cualquier a�o) en el que un asesor ingreso a trabajar para cualquier empresa
SELECT DUE�O.NOMBRE AS DUE�O,
DUE�O.FNACIMIENTO AS NACIMIENTODUE�O,
ASESOR.FINGRESO   AS ASESORINGRESO,
ASESOR.NOMBRE     AS ASESOR
FROM DUE�O
CROSS JOIN ASESOR
WHERE EXTRACT(DAY FROM DUE�O.FNACIMIENTO) = EXTRACT(DAY FROM ASESOR.FINGRESO)
AND EXTRACT(MONTH FROM DUE�O.FNACIMIENTO) = EXTRACT(MONTH FROM ASESOR.FINGRESO);
/
--3: Regresa el numero de hospitales que tiene cada colonia
SELECT COLONIA.IDCOLONIA,
COLONIA.NOMBRE,
COUNT(HOSPITALES_CERCANOS.IDCOLONIA)
FROM COLONIA
JOIN HOSPITALES_CERCANOS
ON (COLONIA.IDCOLONIA = HOSPITALES_CERCANOS.IDCOLONIA)
GROUP BY COLONIA.NOMBRE, COLONIA.IDCOLONIA
ORDER BY 3 DESC;
/
--4: Regresa la colonia que tiene m�s recreativos
SELECT COLONIA.IDCOLONIA,
COLONIA.NOMBRE,
COUNT(RECREATIVOS_CERCANOS.IDCOLONIA)
FROM COLONIA
JOIN RECREATIVOS_CERCANOS
ON (COLONIA.IDCOLONIA = RECREATIVOS_CERCANOS.IDCOLONIA)
GROUP BY COLONIA.NOMBRE, COLONIA.IDCOLONIA
ORDER BY 3 DESC
FETCH FIRST 1 ROWS ONLY;
/
--5: Regresa la cantidad de CASAS que se constru entre los a�os 1980 y 2000
SELECT COUNT(NUMREGISTRO)
FROM CASA
WHERE FCONSTRUCCION BETWEEN '01/01/1980' AND '31/12/2000';
--6: Regresa el promedio de ba�os completos de los departamentos registrados que cuentan con al menos 2 amenidades
SELECT ROUND(AVG(DEPARTAMENTO.NBA�OSCOMPLETOS)) as PROMEDIOBA�OS
FROM DEPARTAMENTO
JOIN DEPARTAMENTO_AMENIDAD
ON (DEPARTAMENTO.NUMREGISTRO = DEPARTAMENTO_AMENIDAD.NUMREGISTRO)
HAVING COUNT(DEPARTAMENTO_AMENIDAD.NUMREGISTRO) >= 2;
/
--7: Regresa una tabla ordenando las casas de m�s antigua a m�s reciente
SELECT NUMREGISTRO,
MIN(FCONSTRUCCION) AS FECHA_CONSTRUCCION
FROM CASA
GROUP BY NUMREGISTRO
ORDER BY 2 ASC;
/
--8: Regresa los terrenos que no estan asegurados
SELECT *
FROM TERRENO OUTER
LEFT JOIN TERRENO_SEGURO
ON(TERRENO_SEGURO.NUMREGISTRO = OUTER.NUMREGISTRO) WHERE TERRENO_SEGURO.NUMPOLIZA IS NULL;
/
--9: Regresa todas las casas que se encuentran en OAXACA o Puebla y que su colonia se llame Acatl�n
SELECT *
FROM CASA
JOIN CASA_DIRECCION
ON(CASA.NUMREGISTRO = CASA_DIRECCION.NUMREGISTRO)
JOIN DIRECCION
ON (CASA_DIRECCION.IDDIRECCION = DIRECCION.IDDIRECCION)
JOIN COLONIA ON(DIRECCION.IDCOLONIA = COLONIA.IDCOLONIA)
WHERE DIRECCION.ESTADO         = 'Oaxaca'
OR DIRECCION.ESTADO            = 'Puebla'
AND COLONIA.NOMBRE = 'Acatl�n';
/
--10: Regresa el precio del seguro m�s caro y el promedio de los seguros
SELECT MAX(PRECIOANUAL) AS PRECIOMAXIMO,
AVG(PRECIOANUAL)      AS PROMEDIO
FROM SEGURO;
/
--11: Regresa el numero de asesores por empresa
SELECT EMPRESA.NOMBRE,
COUNT(IDASESOR)
FROM ASESOR
JOIN EMPRESA
ON (ASESOR.IDEMPRESA = EMPRESA.IDEMPRESA)
GROUP BY EMPRESA.NOMBRE
ORDER BY 2 DESC;
/
--12: Regresa cuantas casas se agregaron por a�o desde el 2010 hasta el 2018
SELECT SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2010' AND '31/12/2010'
THEN 1
ELSE 0
END)               AS A_2010,
SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2011' AND '31/12/2011'
THEN 1
ELSE 0
END)               AS A_2011,
SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2012' AND '31/12/2012'
THEN 1
ELSE 0
END)               AS A_2012,
SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2013' AND '31/12/2013'
THEN 1
ELSE 0
END)               AS A_2013,
SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2014' AND '31/12/2014'
THEN 1
ELSE 0
END)               AS A_2014,
SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2015' AND '31/12/2015'
THEN 1
ELSE 0
END)               AS A_2015,
SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2016' AND '31/12/2016'
THEN 1
ELSE 0
END)               AS A_2016,
SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2017' AND '31/12/2017'
THEN 1
ELSE 0
END)               AS A_2017,
SUM(
CASE
WHEN FCONSTRUCCION BETWEEN '01/01/2018' AND '31/12/2018'
THEN 1
ELSE 0
END)               AS A_2018
FROM CASA;
/

--13: Regresa a los asesores que ganan m�s de 1500 de suelod
SELECT * FROM ASESOR WHERE SUELDO > 10000;
/

--14: Regresa el valor catastral m�s alto de la tabla casa
SELECT MAX(VALORCATASTRAL) FROM CASA;
/

--15: Regresa el CURP de los due�os que nacieron en 1998
SELECT *
FROM DUE�O
JOIN DUE�O_CURP
ON(DUE�O_CURP."IDDUE�O" = DUE�O."IDDUE�O")
JOIN CURP
ON(DUE�O_CURP.IDCURP = CURP.IDCURP)
WHERE FNACIMIENTO BETWEEN '01/01/1998' AND '31/12/1998';
/

--16: Regresa el departamento ordenados de mayor a menor cantidad de caracteristicas
SELECT NUMREGISTRO,
  COUNT(IDCARACTERISTICA)
FROM DEPARTAMENTO_CARACTERISTICA
GROUP BY NUMREGISTRO
ORDER BY 2 DESC;
/

----17: Regresa a los due�os que no tienen ningun correo registrado
SELECT *
FROM DUE�O
LEFT JOIN DUE�O_EMAIL
ON(DUE�O_EMAIL."IDDUE�O" = DUE�O."IDDUE�O")
WHERE CORREO            IS NULL;
/

--18: Regresa los departamentos que cuentan con elevador y cocina
SELECT DEPARTAMENTO.NUMREGISTRO,
  COUNT(DEPARTAMENTO_CARACTERISTICA.IDCARACTERISTICA)
FROM DEPARTAMENTO
JOIN DEPARTAMENTO_CARACTERISTICA
ON(DEPARTAMENTO.NUMREGISTRO = DEPARTAMENTO_CARACTERISTICA.NUMREGISTRO)
JOIN CARACTERISTICA
ON(DEPARTAMENTO_CARACTERISTICA.IDCARACTERISTICA = CARACTERISTICA.IDCARACTERISTICA)
WHERE CARACTERISTICA.IDCARACTERISTICA           = 3
OR CARACTERISTICA.IDCARACTERISTICA              = 4
GROUP BY DEPARTAMENTO.NUMREGISTRO
HAVING COUNT(DEPARTAMENTO_CARACTERISTICA.IDCARACTERISTICA)=2;
/

--19: Selecciona los asesores tal que su apellido paterno inicie con c
SELECT * FROM ASESOR WHERE APATERNO LIKE 'C%';
/

--20: Selecciona todas los CURP's que contienen la subcadea XD
SELECT * FROM CURP WHERE regexp_like (CURP, '.*[X][D].');