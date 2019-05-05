/* 
  DDL.SQL | Tarea 6 | Lechuga Martínez José Eduardo | 314325749 | joselechuga194@ciencias.unam.mx
*/

/*
	Creacion de medico, asignandole una llave primaria que se autoincrementa
*/
CREATE TABLE medico
  (
     idmedico       NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
     nombre     	VARCHAR2(50)   NOT NULL,
     apaterno       VARCHAR2(50)   NOT NULL,
     amaterno       VARCHAR2(50)   NOT NULL,
     calle          VARCHAR2(50)   NOT NULL,
     numero         CHAR(5)        NOT NULL,
     ciudad         VARCHAR2(50)   NOT NULL,
     CP             CHAR(5)    	   NOT NULL,
     CONSTRAINT check_numero_med   CHECK(regexp_like(numero, '^[0-9]{5}$')),
     CONSTRAINT check_CP_med       CHECK(regexp_like(CP, '^[0-9]{5}$')),
     CONSTRAINT idmedico_PK        PRIMARY KEY (idMedico)
  );

/*
	Creacion de la tabla paciente, asignandole una llave que se autoincrementa
*/
CREATE TABLE paciente
  (
  	 idpaciente     NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
     START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
     nombre     	VARCHAR2(50) NOT NULL,
     apaterno       VARCHAR2(50) NOT NULL,
     amaterno       VARCHAR2(50) NOT NULL,
     calle          VARCHAR2(50) NOT NULL,
     numero         CHAR(5)      NOT NULL,
     ciudad         VARCHAR2(50) NOT NULL,
     CP             CHAR(5) NOT NULL,
     CONSTRAINT check_numero_pac   CHECK(regexp_like(numero, '^[0-9]{5}$')),
     CONSTRAINT check_CP_pac       CHECK(regexp_like(CP, '^[0-9]{5}$')),
     CONSTRAINT idpaciente_PK PRIMARY KEY (idpaciente)
  );

/*
	Creacion de especialidad, su llave es un numero identificador
*/
CREATE TABLE especialidad
  (
  	idespecialidad        NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
  	nombre_especialidad   VARCHAR2(50) NOT NULL,
  	CONSTRAINT idespecialidad_PK PRIMARY KEY (idespecialidad)
  );  

/*
	Crea la tabla supervisar, que es una relacion entre medico y medico
	recibe dos llaves foraneas que mantienen integridad referencial por medio de "Cascade"
	su llave primaria es el idmedico_supervisor (El supervisor de los otros medicos)
*/ 
CREATE TABLE supervisar
  (
     idmedico_supervisor      NUMBER NOT NULL,
     idmedico_supervisado     NUMBER NOT NULL,
     CONSTRAINT supervisar_idmedico_supervisor_FK FOREIGN KEY (idmedico_supervisor) REFERENCES medico (idmedico) ON DELETE CASCADE,
     CONSTRAINT supervisar_idmedico_supervisado_FK FOREIGN KEY (idmedico_supervisado) REFERENCES medico (idmedico) ON DELETE CASCADE,
     CONSTRAINT supervisar_PK PRIMARY KEY (idmedico_supervisor, idmedico_supervisado)
  );

/*
	Crea la tabla que indica si un medico tiene especialidad
	Recibe dos llaves foraneas, tanto idmedico y idespecialidad (que mantienen la integridad por medio de "cascade")
	Un medico puede tener muchas especialidades 
*/
CREATE TABLE medico_tener_especialidad
  (
     idmedico        NUMBER,
     idespecialidad  NUMBER,
     CONSTRAINT medico_tener_especialidad_idmedico_FK FOREIGN KEY (idmedico) REFERENCES medico (idmedico) ON DELETE CASCADE,
     CONSTRAINT medico_tener_especialidad_idespecialidad_FK FOREIGN KEY (idespecialidad) REFERENCES especialidad (idespecialidad) ON DELETE CASCADE,
     CONSTRAINT medico_tener_especialidad_PK PRIMARY KEY (idmedico, idespecialidad)
  );

/*
	Crea la tabla de la relacion medico-paciente ingresar
	recibe dos llaves foraneas (idmedico e idpaciente) que mantienen la integridad por medio de "cascade"
*/
CREATE TABLE medico_ingresar_paciente
  (
  	idmedico        NUMBER,
  	idpaciente      NUMBER,
  	num_ingreso     CHAR(15) NOT NULL UNIQUE,
  	habitacion      CHAR(5) NOT NULL,
  	cama            CHAR(5) NOT NULL,
  	fecha_ingreso   DATE DEFAULT sysdate NOT NULL,
  	CONSTRAINT check_num_ingreso  CHECK(regexp_like(num_ingreso, '^[0-9]{15}$')),
    CONSTRAINT check_habitacion   CHECK(regexp_like(habitacion, '^[0-9]{5}$')),
    CONSTRAINT check_cama         CHECK(regexp_like(cama, '^[0-9]{5}$')),
  	CONSTRAINT medico_ingresar_paciente_idmedico_FK FOREIGN KEY (idmedico) REFERENCES medico (idmedico) ON DELETE CASCADE,
    CONSTRAINT medico_ingresar_paciente_idpaciente_FK FOREIGN KEY (idpaciente) REFERENCES paciente (idpaciente) ON DELETE CASCADE,
    CONSTRAINT medico_ingresar_paciente_PK PRIMARY KEY (idmedico, idpaciente, num_ingreso)
  );

/*
	Crea la tabla que nace de la relacion entre medico y paciente, consultar
	Tiene dos llaves foraneas que mantienen la integridad por medio de "cascade"
*/
CREATE TABLE medico_consultar_paciente
  (
  	idmedico        NUMBER,
  	idpaciente      NUMBER,
  	num_consulta    CHAR(15) NOT NULL UNIQUE,
  	consultorio     CHAR(5) NOT NULL,
  	fecha_consulta  DATE DEFAULT sysdate NOT NULL,
  	CONSTRAINT check_num_consulta CHECK(regexp_like(num_consulta, '^[0-9]{15}$')),
    CONSTRAINT check_consultorio  CHECK(regexp_like(consultorio, '^[0-9]{5}$')),
  	CONSTRAINT medico_consultar_paciente_idmedico_FK FOREIGN KEY (idmedico) REFERENCES medico (idmedico) ON DELETE CASCADE,
    CONSTRAINT medico_consultar_paciente_idpaciente_FK FOREIGN KEY (idpaciente) REFERENCES paciente (idpaciente) ON DELETE CASCADE,
    CONSTRAINT medico_consultar_paciente_PK PRIMARY KEY (idmedico, idpaciente, num_consulta)
  );  