DROP TABLE pf_persona_h CASCADE CONSTRAINTS;

DROP SEQUENCE cve_persona_h_seq;

DROP TABLE pf_email_h CASCADE CONSTRAINTS;

DROP TABLE pf_telefono_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_email_h_seq;

DROP SEQUENCE pf_telefono_h_seq;

DROP TABLE pf_idioma_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_idioma_h_seq;

DROP TABLE pf_pais_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_pais_h_seq;

DROP TABLE pf_colonia_h CASCADE CONSTRAINTS;

DROP TABLE pf_delegacion_h CASCADE CONSTRAINTS;

DROP TABLE pf_estado_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_estado_h_seq;

DROP SEQUENCE pf_delegacion_h_seq;

DROP SEQUENCE pf_colonia_h_seq;

DROP TABLE pf_encargado_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_encargado_h_seq;

DROP TABLE pf_direccion_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_direccion_h_seq;

DROP TABLE pf_usuario_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_usuario_h_seq;

DROP TABLE pf_region_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_region_h_seq;

DROP TABLE pf_empresa_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_empresa_h_seq;

DROP TABLE pf_plan_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_plan_h_seq;

DROP TABLE pf_pago_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_pago_h_seq;

DROP TABLE pf_cuenta_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_cuenta_h_seq;

DROP TABLE pf_tipo_perfil_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_tipo_perfil_h_seq;

DROP TABLE pf_imagen_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_imagen_h_seq;

DROP TABLE pf_genero_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_genero_h_seq;

DROP TABLE pf_informacion_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_informacion_h_seq;

DROP TABLE pf_pelicula_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_pelicula_h_seq;

DROP SEQUENCE pf_serie_h_seq;

DROP TABLE pf_serie_h CASCADE CONSTRAINTS;

DROP TABLE pf_temporada_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_temporada_h_seq;

DROP TABLE pf_episodio_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_episodio_h_seq;

DROP TABLE pf_productora_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_productora_h_seq;

CREATE TABLE pf_persona_h (
    cve_persona_h     INTEGER NOT NULL,
    cve_persona       INTEGER NOT NULL,
    nombre            VARCHAR2(50 CHAR) NOT NULL,
    edad              INTEGER NOT NULL,
    apellidopaterno   VARCHAR2(50 CHAR) NOT NULL,
    apellidomaterno   VARCHAR2(50 CHAR) NOT NULL,
    modificado_por    VARCHAR2(50 CHAR),
    modificado_el     DATE,
    accion            VARCHAR2(50 CHAR)
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_persona_h__indx ON
    pf_persona_h (
        cve_persona_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_persona_h__indxv1 ON
    pf_persona_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_persona_h ADD CONSTRAINT pf_persona_h_ck_1 CHECK ( cve_persona_h > 0 );

ALTER TABLE pf_persona_h ADD CONSTRAINT pf_persona_h_ck_2 CHECK ( edad > 0 );

ALTER TABLE pf_persona_h ADD CONSTRAINT pf_persona_ck_3 CHECK (cve_persona > 0);

ALTER TABLE pf_persona_h ADD CONSTRAINT pk_pf_persona_h PRIMARY KEY ( cve_persona_h );

CREATE SEQUENCE cve_persona_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_persona_h BEFORE
    INSERT ON pf_persona
    FOR EACH ROW
    
DECLARE
luser pf_persona_h.modificado_por%type;
BEGIN
    select user into luser from dual;
    insert into pf_persona_h(cve_persona_h, cve_persona,nombre, edad, apellidopaterno, apellidomaterno, modificado_por, modificado_el,accion) values 
    (cve_persona_h_seq.nextval,:new.cve_persona, :new.nombre, :new.edad,:new.apellidopaterno, :new.apellidoMaterno,luser,sysdate,'INSERT');
    
END;
/

CREATE OR REPLACE TRIGGER tub_persona_h BEFORE
    UPDATE ON pf_persona
    FOR EACH ROW
    
DECLARE
luser pf_persona_h.modificado_por%type;
BEGIN
if 
    :new.cve_persona <> :old.cve_persona or
    :new.nombre <> :old.nombre or
    :new.apellidopaterno <> :old.apellidopaterno or
    :new.apellidomaterno <> :old.apellidomaterno or
    :new.edad <> :old.edad
    then
    select user into luser from dual;
    insert into pf_persona_h(cve_persona_h, cve_persona,nombre, edad, apellidopaterno, apellidomaterno, modificado_por, modificado_el,accion) values 
    (cve_persona_h_seq.nextval,:new.cve_persona, :new.nombre, :new.edad,:new.apellidopaterno, :new.apellidoMaterno,luser,sysdate,'UPDATE');
    end if;
END;
/

CREATE OR REPLACE TRIGGER tdb_persona_h BEFORE
    DELETE ON pf_persona
    FOR EACH ROW
    
DECLARE
luser pf_persona_h.modificado_por%type;
BEGIN
    select user into luser from dual;
    insert into pf_persona_h(cve_persona_h, cve_persona,nombre, edad, apellidopaterno, apellidomaterno, modificado_por, modificado_el,accion) values 
    (cve_persona_h_seq.nextval,:old.cve_persona, :old.nombre, :old.edad,:old.apellidopaterno, :old.apellidoMaterno,luser,sysdate,'DELETE');
    
END;
/


CREATE TABLE pf_email_h (
    cve_email_h      INTEGER NOT NULL,
    cve_email        INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_email_h__indx ON
    pf_email_h (
        cve_email_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_email_h__indxv1 ON
    pf_email_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_email_h ADD CONSTRAINT pf_email_h_ck_1 CHECK ( cve_email > 0 );

ALTER TABLE pf_email_h ADD CONSTRAINT pf_email_h_ck_2 CHECK ( cve_email_h > 0 );

ALTER TABLE pf_email_h ADD CONSTRAINT pk_pf_email_h PRIMARY KEY ( cve_email_h );

CREATE TABLE pf_telefono_h (
    cve_telefono_h   INTEGER NOT NULL,
    cve_telefono     INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_telefono_h__indx ON
    pf_telefono_h (
        cve_telefono_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_telefono_h__indxv1 ON
    pf_telefono_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_telefono_h ADD CONSTRAINT pf_telefono_h_ck_1 CHECK ( cve_telefono_h > 0 );

ALTER TABLE pf_telefono_h ADD CONSTRAINT pf_telefono_h_ck_2 CHECK ( cve_telefono > 0 );

ALTER TABLE pf_telefono_h ADD CONSTRAINT pk_pf_telefono_h PRIMARY KEY ( cve_telefono_h );

CREATE SEQUENCE pf_email_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_email_h BEFORE
    INSERT ON pf_email
    FOR EACH ROW
DECLARE
luser pf_email_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_email_h (cve_email_h,cve_email,descripcion,modificado_por,modificado_el,accion) 
    VALUES (pf_email_h_seq.nextval,:new.cve_email,:new.descripcion,luser,sysdate,'INSERT');
    
END;
/
CREATE OR REPLACE TRIGGER tub_pf_email_h BEFORE
    UPDATE ON pf_email
    FOR EACH ROW
DECLARE
luser pf_email_h.modificado_por%type;
BEGIN
IF
    :new.cve_email <> :old.cve_email or
    :new.descripcion <> :old.descripcion
THEN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_email_h (cve_email_h,cve_email,descripcion,modificado_por,modificado_el,accion) 
    VALUES (pf_email_h_seq.nextval,:new.cve_email,:new.descripcion,luser,sysdate,'UPDATE');
END IF;
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_email_h BEFORE
    DELETE ON pf_email
    FOR EACH ROW
DECLARE
luser pf_email_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_email_h (cve_email_h,cve_email,descripcion,modificado_por,modificado_el,accion) 
    VALUES (pf_email_h_seq.nextval,:old.cve_email,:old.descripcion,luser,sysdate,'DELETE');
END;
/
CREATE SEQUENCE pf_telefono_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_telefono_h BEFORE
    INSERT ON pf_telefono
    FOR EACH ROW
DECLARE
luser pf_telefono_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_telefono_h (cve_telefono_h,cve_telefono,descripcion,modificado_por,modificado_el,accion) VALUES
    (pf_telefono_h_seq.nextval,:new.cve_telefono,:new.descripcion,luser,sysdate,'INSERT');
    
END;
/
CREATE OR REPLACE TRIGGER tub_pf_telefono_h BEFORE
    UPDATE ON pf_telefono
    FOR EACH ROW
DECLARE
luser pf_telefono_h.modificado_por%type;
BEGIN
IF
    :new.cve_telefono <> :old.cve_telefono or
    :new.descripcion <> :old.descripcion
THEN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_telefono_h (cve_telefono_h,cve_telefono,descripcion,modificado_por,modificado_el,accion) VALUES
    (pf_telefono_h_seq.nextval,:new.cve_telefono,:new.descripcion,luser,sysdate,'UPDATE');
END IF; 
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_telefono_h BEFORE
    DELETE ON pf_telefono
    FOR EACH ROW
DECLARE
luser pf_telefono_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_telefono_h (cve_telefono_h,cve_telefono,descripcion,modificado_por,modificado_el,accion) VALUES
    (pf_telefono_h_seq.nextval,:old.cve_telefono,:old.descripcion,luser,sysdate,'DELETE'); 
END;
/


CREATE TABLE pf_idioma_h (
    cve_idioma_h     INTEGER NOT NULL,
    cve_idioma       INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_idioma_h__indx ON
    pf_idioma_h (
        cve_idioma_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_idioma_h__indxv1 ON
    pf_idioma_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_idioma_h ADD CONSTRAINT pf_idioma_h_ck_1 CHECK ( cve_idioma_h > 0 );

ALTER TABLE pf_idioma_h ADD CONSTRAINT pf_idioma_h_ck_2 CHECK ( cve_idioma > 0 );

ALTER TABLE pf_idioma_h ADD CONSTRAINT pk_pf_idioma_h PRIMARY KEY ( cve_idioma_h );

CREATE SEQUENCE pf_idioma_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_idioma_h BEFORE
    INSERT ON pf_idioma
    FOR EACH ROW
DECLARE 
luser pf_idioma_h.modificado_por%type;
BEGIN
    select user into luser from dual;
    INSERT INTO pf_idioma_h (cve_idioma_h,cve_idioma,descripcion,modificado_por,modificado_el,accion)
    values (pf_idioma_h_seq.nextval,:new.cve_idioma,:new.descripcion,luser,sysdate,'INSERT');
   
END;
/

CREATE OR REPLACE TRIGGER tub_idioma_h BEFORE
    UPDATE ON pf_idioma
    FOR EACH ROW
DECLARE 
luser pf_idioma_h.modificado_por%type;
BEGIN
IF
    :new.cve_idioma <> :old.cve_idioma or
    :new.descripcion <> :old.descripcion
THEN
    select user into luser from dual;
    INSERT INTO pf_idioma_h (cve_idioma_h,cve_idioma,descripcion,modificado_por,modificado_el,accion)
    values (pf_idioma_h_seq.nextval,:new.cve_idioma,:new.descripcion,luser,sysdate,'UPDATE');
END IF;
END;
/
CREATE OR REPLACE TRIGGER tdb_idioma_h BEFORE
    DELETE ON pf_idioma
    FOR EACH ROW
DECLARE 
luser pf_idioma_h.modificado_por%type;
BEGIN
    select user into luser from dual;
    INSERT INTO pf_idioma_h (cve_idioma_h,cve_idioma,descripcion,modificado_por,modificado_el,accion)
    values (pf_idioma_h_seq.nextval,:old.cve_idioma,:old.descripcion,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_pais_h (
    cve_pais_h       INTEGER NOT NULL,
    cve_pais         INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_pais_h__indx ON
    pf_pais_h (
        cve_pais_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_pais_h__indxv1 ON
    pf_pais_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_pais_h ADD CONSTRAINT pf_pais_h_ck_1 CHECK ( cve_pais_h > 0 );

ALTER TABLE pf_pais_h ADD CONSTRAINT pf_pais_h_ck_2 CHECK ( cve_pais > 0 );

ALTER TABLE pf_pais_h ADD CONSTRAINT pk_pf_pais_h PRIMARY KEY ( cve_pais_h );

CREATE SEQUENCE pf_pais_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_pais_h BEFORE
    INSERT ON pf_pais
    FOR EACH ROW
DECLARE
luser pf_pais_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pais_h VALUES (pf_pais_h_seq.nextval,:new.cve_pais,:new.descripcion,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_pais_h BEFORE
    DELETE ON pf_pais
    FOR EACH ROW
DECLARE
luser pf_pais_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pais_h VALUES (pf_pais_h_seq.nextval,:old.cve_pais,:old.descripcion,luser,sysdate,'DELETE');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_pais_h BEFORE
    UPDATE ON pf_pais
    FOR EACH ROW
DECLARE
luser pf_pais_h.modificado_por%type;
BEGIN
IF
    :new.cve_pais <> :old.cve_pais or
    :new.descripcion <> :old.descripcion
THEN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pais_h VALUES (pf_pais_h_seq.nextval,:new.cve_pais,:new.descripcion,luser,sysdate,'UPDATE');
END IF;
END;
/


CREATE TABLE pf_colonia_h (
    cve_colonia_h    INTEGER NOT NULL,
    cve_colonia      INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    cve_delegacion   INTEGER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_colonia_h__indx ON
    pf_colonia_h (
        cve_colonia_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_colonia_h__indxv1 ON
    pf_colonia_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_colonia_h ADD CONSTRAINT pf_colonia_h_ck_1 CHECK ( cve_colonia_h > 0 );

ALTER TABLE pf_colonia_h ADD CONSTRAINT pf_colonia_h_ck_2 CHECK ( cve_colonia > 0 );

ALTER TABLE pf_colonia_h ADD CONSTRAINT pf_colonia_h_ck_3 CHECK ( cve_delegacion > 0 );

ALTER TABLE pf_colonia_h ADD CONSTRAINT pk_pf_colonia_h PRIMARY KEY ( cve_colonia_h );

CREATE TABLE pf_delegacion_h (
    cve_delegacion_h   INTEGER NOT NULL,
    cve_delegacion     INTEGER NOT NULL,
    descripcion        VARCHAR2(50 CHAR) NOT NULL,
    cve_estado         INTEGER NOT NULL,
    modificado_por     VARCHAR2(50 CHAR) NOT NULL,
    modificado_el      DATE NOT NULL,
    accion             VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_delegacion_h__indx ON
    pf_delegacion_h (
        cve_delegacion_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_delegacion_h__indxv1 ON
    pf_delegacion_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_delegacion_h ADD CONSTRAINT pf_delegacion_h_ck_1 CHECK ( cve_delegacion_h > 0 );

ALTER TABLE pf_delegacion_h ADD CONSTRAINT pf_delegacion_h_ck_2 CHECK ( cve_delegacion > 0 );

ALTER TABLE pf_delegacion_h ADD CONSTRAINT pf_delegacion_h_ck_3 CHECK ( cve_estado > 0 );

ALTER TABLE pf_delegacion_h ADD CONSTRAINT pk_pf_delegacion_h PRIMARY KEY ( cve_delegacion_h );

CREATE TABLE pf_estado_h (
    cve_estado_h     INTEGER NOT NULL,
    cve_estado       INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    cve_pais         INTEGER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_estado_h__indx ON
    pf_estado_h (
        cve_estado_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_estado_h__indxv1 ON
    pf_estado_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_estado_h ADD CONSTRAINT pf_estado_h_ck_1 CHECK ( cve_estado_h > 0 );

ALTER TABLE pf_estado_h ADD CONSTRAINT pf_estado_h_ck_2 CHECK ( cve_estado > 0 );

ALTER TABLE pf_estado_h ADD CONSTRAINT pf_estado_h_ck_3 CHECK ( cve_pais > 0 );

ALTER TABLE pf_estado_h ADD CONSTRAINT pk_pf_estado_h PRIMARY KEY ( cve_estado_h );

CREATE SEQUENCE pf_colonia_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_colonia_h BEFORE
    INSERT ON pf_colonia
    FOR EACH ROW
DECLARE 
luser pf_colonia_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_colonia_h VALUES (pf_colonia_h_seq.nextval,:new.cve_colonia,:new.descripcion,:new.cve_delegacion,luser,sysdate,
    'INSERT');
    
END;
/
CREATE OR REPLACE TRIGGER tub_pf_colonia_h BEFORE
    UPDATE ON pf_colonia
    FOR EACH ROW
DECLARE 
luser pf_colonia_h.modificado_por%type;
BEGIN
IF
    :new.cve_colonia <> :old.cve_colonia or
    :new.descripcion <> :old.descripcion or
    :new.cve_delegacion <> :old.cve_delegacion
THEN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_colonia_h VALUES (pf_colonia_h_seq.nextval,:new.cve_colonia,:new.descripcion,:new.cve_delegacion,luser,sysdate,
    'UPDATE');
END IF;    
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_colonia_h BEFORE
    DELETE ON pf_colonia
    FOR EACH ROW
DECLARE 
luser pf_colonia_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_colonia_h VALUES (pf_colonia_h_seq.nextval,:old.cve_colonia,:old.descripcion,:old.cve_delegacion,luser,sysdate,
    'DELETE');
    
END;
/

CREATE SEQUENCE pf_delegacion_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_delegacion_h BEFORE
    INSERT ON pf_delegacion
    FOR EACH ROW
DECLARE
luser pf_delegacion_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_delegacion_h VALUES (pf_delegacion_h_seq.nextval,:new.cve_delegacion,:new.descripcion,:new.cve_estado,luser,sysdate,
    'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_delegacion_h BEFORE
    UPDATE ON pf_delegacion
    FOR EACH ROW
DECLARE
luser pf_delegacion_h.modificado_por%type;
BEGIN
IF
    :new.cve_delegacion <> :old.cve_delegacion or
    :new.descripcion <> :old.descripcion or
    :new.cve_estado <> :old.cve_estado
THEN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_delegacion_h VALUES (pf_delegacion_h_seq.nextval,:new.cve_delegacion,:new.descripcion,:new.cve_estado,luser,sysdate,
    'UPDATE');
END IF;
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_delegacion_h BEFORE
    DELETE ON pf_delegacion
    FOR EACH ROW
DECLARE
luser pf_delegacion_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_delegacion_h VALUES (pf_delegacion_h_seq.nextval,:old.cve_delegacion,:old.descripcion,:old.cve_estado,luser,sysdate,
    'DELETE');
END;
/



CREATE SEQUENCE pf_estado_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_estado_h BEFORE
    INSERT ON pf_estado
    FOR EACH ROW
DECLARE
luser pf_estado_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_estado_h VALUES (pf_estado_h_seq.nextval,:new.cve_estado,:new.descripcion,:new.cve_pais,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_estado_h BEFORE
    UPDATE ON pf_estado
    FOR EACH ROW
DECLARE
luser pf_estado_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_estado_h VALUES (pf_estado_h_seq.nextval,:new.cve_estado,:new.descripcion,:new.cve_pais,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_estado_h BEFORE
    DELETE ON pf_estado
    FOR EACH ROW
DECLARE
luser pf_estado_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_estado_h VALUES (pf_estado_h_seq.nextval,:old.cve_estado,:old.descripcion,:old.cve_pais,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_encargado_h (
    cve_encargado_h   INTEGER NOT NULL,
    cve_encargado     INTEGER NOT NULL,
    cve_persona       INTEGER NOT NULL,
    cve_telefono      INTEGER NOT NULL,
    cve_email         INTEGER NOT NULL,
    modificado_por    VARCHAR2(50 CHAR) NOT NULL,
    modificado_el     VARCHAR2(50 CHAR) NOT NULL,
    accion            VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_encargado_h__indx ON
    pf_encargado_h (
        cve_encargado_h
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_encargado_h ADD CONSTRAINT pf_encargado_h_ck_1 CHECK ( cve_encargado_h > 0 );

ALTER TABLE pf_encargado_h ADD CONSTRAINT pf_encargado_h_ck_2 CHECK ( cve_encargado > 0 );

ALTER TABLE pf_encargado_h ADD CONSTRAINT pf_encargado_h_ck_3 CHECK ( cve_persona > 0 );

ALTER TABLE pf_encargado_h ADD CONSTRAINT pf_encargado_h_ck_4 CHECK ( cve_telefono > 0 );

ALTER TABLE pf_encargado_h ADD CONSTRAINT pf_encargado_h_ck_5 CHECK ( cve_email > 0 );

ALTER TABLE pf_encargado_h ADD CONSTRAINT pk_pf_encargado_h PRIMARY KEY ( cve_encargado_h );

CREATE SEQUENCE pf_encargado_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_encargado_h BEFORE
    INSERT ON pf_encargado
    FOR EACH ROW
DECLARE
luser pf_encargado_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_encargado_h VALUES (pf_encargado_h_seq.nextval,:new.cve_encargado,:new.cve_persona,:new.cve_telefono,:new.cve_email,luser,sysdate,'INSERT');
    
END;
/
CREATE OR REPLACE TRIGGER tub_pf_encargado_h BEFORE
    UPDATE ON pf_encargado
    FOR EACH ROW
DECLARE
luser pf_encargado_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_encargado_h VALUES (pf_encargado_h_seq.nextval,:new.cve_encargado,:new.cve_persona,:new.cve_telefono,:new.cve_email,luser,sysdate,'UPDATE');
    
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_encargado_h BEFORE
    DELETE ON pf_encargado
    FOR EACH ROW
DECLARE
luser pf_encargado_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_encargado_h VALUES (pf_encargado_h_seq.nextval,:old.cve_encargado,:old.cve_persona,:old.cve_telefono,:old.cve_email,luser,sysdate,'DELETE');
    
END;
/


CREATE TABLE pf_direccion_h (
    cve_direccion_h   INTEGER NOT NULL,
    cve_direccion     INTEGER NOT NULL,
    calle             VARCHAR2(50 CHAR) NOT NULL,
    cp                INTEGER NOT NULL,
    numero            INTEGER NOT NULL,
    cve_colonia       INTEGER NOT NULL,
    modificado_por    VARCHAR2(50 CHAR) NOT NULL,
    modificado_el     DATE NOT NULL,
    accion            VARCHAR2(50 CHAR)
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_direccion_h__indx ON
    pf_direccion_h (
        cve_direccion_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_direccion_h__indxv1 ON
    pf_direccion_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_direccion_h ADD CONSTRAINT pf_direccion_h_ck_1 CHECK ( cve_direccion_h > 0 );

ALTER TABLE pf_direccion_h ADD CONSTRAINT pf_direccion_h_ck_2 CHECK ( cve_direccion > 0 );

ALTER TABLE pf_direccion_h ADD CONSTRAINT pf_direccion_h_ck_4 CHECK ( cp > 0 );

ALTER TABLE pf_direccion_h ADD CONSTRAINT pf_direccion_h_ck_4v1 CHECK ( numero > 0 );

ALTER TABLE pf_direccion_h ADD CONSTRAINT pf_direccion_h_ck_5 CHECK ( cve_colonia > 0 );

ALTER TABLE pf_direccion_h ADD CONSTRAINT pk_pf_direccion_h PRIMARY KEY ( cve_direccion_h );

CREATE SEQUENCE pf_direccion_h_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_direccion_h BEFORE
    INSERT ON pf_direccion
    FOR EACH ROW
DECLARE
luser pf_direccion_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_direccion_h VALUES (pf_direccion_h_seq.nextval,:new.cve_direccion,:new.calle,:new.cp,:new.numero,:new.cve_colonia,
    luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_direccion_h BEFORE
    UPDATE ON pf_direccion
    FOR EACH ROW
DECLARE
luser pf_direccion_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_direccion_h VALUES (pf_direccion_h_seq.nextval,:new.cve_direccion,:new.calle,:new.cp,:new.numero,:new.cve_colonia,
    luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_direccion_h BEFORE
    DELETE ON pf_direccion
    FOR EACH ROW
DECLARE
luser pf_direccion_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_direccion_h VALUES (pf_direccion_h_seq.nextval,:old.cve_direccion,:old.calle,:old.cp,:old.numero,:old.cve_colonia,
    luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_usuario_h (
    cve_usuario_h    INTEGER NOT NULL,
    cve_usuario      INTEGER NOT NULL,
    cve_persona      INTEGER NOT NULL,
    cve_email        INTEGER NOT NULL,
    cve_telefono     INTEGER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_usuario_h__indx ON
    pf_usuario_h (
        cve_usuario_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_usuario_h__indxv1 ON
    pf_usuario_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_usuario_h ADD CONSTRAINT pf_usuario_h_ck_1 CHECK ( cve_usuario_h > 0 );

ALTER TABLE pf_usuario_h ADD CONSTRAINT pf_usuario_h_ck_2 CHECK ( cve_usuario > 0 );

ALTER TABLE pf_usuario_h ADD CONSTRAINT pf_usuario_h_ck_3 CHECK ( cve_persona > 0 );

ALTER TABLE pf_usuario_h ADD CONSTRAINT pf_usuario_h_ck_4 CHECK ( cve_email > 0 );

ALTER TABLE pf_usuario_h ADD CONSTRAINT pf_usuario_h_ck_5 CHECK ( cve_telefono > 0 );

ALTER TABLE pf_usuario_h ADD CONSTRAINT pk_pf_usuario_h PRIMARY KEY ( cve_usuario_h );

CREATE SEQUENCE pf_usuario_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_usuario_h BEFORE
    INSERT ON pf_usuario
    FOR EACH ROW
DECLARE
luser pf_usuario_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_usuario_H VALUES (pf_usuario_h_seq.nextval,:new.cve_usuario,:new.cve_persona,:new.cve_email,
    :new.cve_telefono,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_usuario_h BEFORE
    UPDATE ON pf_usuario
    FOR EACH ROW
DECLARE
luser pf_usuario_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_usuario_H VALUES (pf_usuario_h_seq.nextval,:new.cve_usuario,:new.cve_persona,:new.cve_email,
    :new.cve_telefono,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_usuario_h BEFORE
    DELETE ON pf_usuario
    FOR EACH ROW
DECLARE
luser pf_usuario_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_usuario_H VALUES (pf_usuario_h_seq.nextval,:old.cve_usuario,:old.cve_persona,:old.cve_email,
    :old.cve_telefono,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_region_h (
    cve_region_h     INTEGER NOT NULL,
    cve_region       INTEGER NOT NULL,
    cve_pais         INTEGER NOT NULL,
    cve_idioma       INTEGER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_region_h__indx ON
    pf_region_h (
        cve_region_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_region_h__indxv1 ON
    pf_region_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_region_h ADD CONSTRAINT pf_region_h_ck_1 CHECK ( cve_region_h > 0 );

ALTER TABLE pf_region_h ADD CONSTRAINT pf_region_h_ck_2 CHECK ( cve_region > 0 );

ALTER TABLE pf_region_h ADD CONSTRAINT pf_region_h_ck_3 CHECK ( cve_pais > 0 );

ALTER TABLE pf_region_h ADD CONSTRAINT pf_region_h_ck_4 CHECK ( cve_idioma > 0 );

ALTER TABLE pf_region_h ADD CONSTRAINT pk_pf_region_h PRIMARY KEY ( cve_region_h );

CREATE SEQUENCE pf_region_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_region_h BEFORE
    INSERT ON pf_region
    FOR EACH ROW
DECLARE
luser pf_region_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_region_h VALUES (pf_region_h_seq.nextval,:new.cve_region,:new.cve_pais,:new.cve_idioma,
    luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_region_h BEFORE
    UPDATE ON pf_region
    FOR EACH ROW
DECLARE
luser pf_region_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_region_h VALUES (pf_region_h_seq.nextval,:new.cve_region,:new.cve_pais,:new.cve_idioma,
    luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_region_h BEFORE
    DELETE ON pf_region
    FOR EACH ROW
DECLARE
luser pf_region_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_region_h VALUES (pf_region_h_seq.nextval,:old.cve_region,:old.cve_pais,:old.cve_idioma,
    luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_empresa_h (
    cve_empresa_h    INTEGER NOT NULL,
    cve_empresa      INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    cve_direccion    INTEGER NOT NULL,
    cve_email        INTEGER NOT NULL,
    cve_telefono     INTEGER NOT NULL,
    cve_encargado    INTEGER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_empresa_h__indx ON
    pf_empresa_h (
        cve_empresa_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_empresa_h__indxv1 ON
    pf_empresa_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_empresa_h ADD CONSTRAINT pf_empresa_h_ck_1 CHECK ( cve_empresa_h > 0 );

ALTER TABLE pf_empresa_h ADD CONSTRAINT pf_empresa_h_ck_2 CHECK ( cve_empresa > 0 );

ALTER TABLE pf_empresa_h ADD CONSTRAINT pf_empresa_h_ck_3 CHECK ( cve_direccion > 0 );

ALTER TABLE pf_empresa_h ADD CONSTRAINT pf_empresa_h_ck_4 CHECK ( cve_email > 0 );

ALTER TABLE pf_empresa_h ADD CONSTRAINT pf_empresa_h_ck_5 CHECK ( cve_telefono > 0 );

ALTER TABLE pf_empresa_h ADD CONSTRAINT pf_empresa_h_ck_6 CHECK ( cve_encargado > 0 );

ALTER TABLE pf_empresa_h ADD CONSTRAINT pk_pf_empresa_h PRIMARY KEY ( cve_empresa_h );

CREATE SEQUENCE pf_empresa_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_empresa_h BEFORE
    INSERT ON pf_empresa
    FOR EACH ROW
    DECLARE
luser pf_empresa_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_empresa_h VALUES (pf_empresa_h_seq.nextval,:new.cve_empresa,:new.descripcion,:new.cve_direccion,
    :new.cve_email,:new.cve_telefono,:new.cve_encargado,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_empresa_h BEFORE
    UPDATE ON pf_empresa
    FOR EACH ROW
    DECLARE
luser pf_empresa_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_empresa_h VALUES (pf_empresa_h_seq.nextval,:new.cve_empresa,:new.descripcion,:new.cve_direccion,
    :new.cve_email,:new.cve_telefono,:new.cve_encargado,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_empresa_h BEFORE
    DELETE ON pf_empresa
    FOR EACH ROW
    DECLARE
luser pf_empresa_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_empresa_h VALUES (pf_empresa_h_seq.nextval,:old.cve_empresa,:old.descripcion,:old.cve_direccion,
    :old.cve_email,:old.cve_telefono,:old.cve_encargado,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_plan_h (
    cve_plan_h       INTEGER NOT NULL,
    cve_plan         INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    calidad          VARCHAR2(50 CHAR) NOT NULL,
    cve_empresa      INTEGER NOT NULL,
    costo            NUMBER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_plan_h__indx ON
    pf_plan_h (
        cve_plan_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_plan_h__indxv1 ON
    pf_plan_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_plan_h ADD CONSTRAINT pf_plan_h_ck_1 CHECK ( cve_plan_h > 0 );

ALTER TABLE pf_plan_h ADD CONSTRAINT pf_plan_h_ck_2 CHECK ( cve_plan > 0 );

ALTER TABLE pf_plan_h ADD CONSTRAINT pf_plan_h_ck_3 CHECK ( cve_empresa > 0 );

ALTER TABLE pf_plan_h ADD CONSTRAINT pk_pf_plan_h PRIMARY KEY ( cve_plan_h );

CREATE SEQUENCE pf_plan_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_plan_h BEFORE
    INSERT ON pf_plan
    FOR EACH ROW
DECLARE
luser pf_plan_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_plan_h VALUES(pf_plan_h_seq.nextval,:new.cve_plan,:new.descripcion,:new.calidad,:new.cve_empresa,:new.costo,luser,
    sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_plan_h BEFORE
    UPDATE ON pf_plan
    FOR EACH ROW
DECLARE
luser pf_plan_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_plan_h VALUES(pf_plan_h_seq.nextval,:new.cve_plan,:new.descripcion,:new.calidad,:new.cve_empresa,:new.costo,luser,
    sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_plan_h BEFORE
    DELETE ON pf_plan
    FOR EACH ROW
DECLARE
luser pf_plan_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_plan_h VALUES(pf_plan_h_seq.nextval,:old.cve_plan,:old.descripcion,:old.calidad,:old.cve_empresa,:old.costo,luser,
    sysdate,'DELETE');
END;
/


CREATE TABLE pf_pago_h (
    cve_pago_h       INTEGER NOT NULL,
    cve_pago         INTEGER NOT NULL,
    fechapago        DATE NOT NULL,
    monto            NUMBER NOT NULL,
    cve_plan         INTEGER NOT NULL,
    cve_usuario      INTEGER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_pago_h__indx ON
    pf_pago_h (
        cve_pago_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_pago_h__indxv1 ON
    pf_pago_h (
        fechapago
    ASC )
        TABLESPACE datos LOGGING;

CREATE INDEX pf_pago_h__indxv2 ON
    pf_pago_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_pago_h ADD CONSTRAINT pf_pago_h_ck_1 CHECK ( cve_pago_h > 0 );

ALTER TABLE pf_pago_h ADD CONSTRAINT pf_pago_h_ck_2 CHECK ( cve_pago > 0 );

ALTER TABLE pf_pago_h ADD CONSTRAINT pf_pago_h_ck_3 CHECK ( monto > 0 );

ALTER TABLE pf_pago_h ADD CONSTRAINT pf_pago_h_ck_4 CHECK ( cve_plan > 0 );

ALTER TABLE pf_pago_h ADD CONSTRAINT pf_pago_h_ck_5 CHECK ( cve_usuario > 0 );

ALTER TABLE pf_pago_h ADD CONSTRAINT pk_pf_pago_h PRIMARY KEY ( cve_pago_h );

CREATE SEQUENCE pf_pago_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_pago_h BEFORE
    INSERT ON pf_pago
    FOR EACH ROW
DECLARE
luser pf_pago_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pago_h VALUES (pf_pago_h_seq.nextval,:new.cve_pago,:new.fechaPago,:new.monto,
    :new.cve_plan,:new.cve_usuario,luser,sysdate,'INSERT');
    
END;
/
CREATE OR REPLACE TRIGGER tub_pf_pago_h BEFORE
    UPDATE ON pf_pago
    FOR EACH ROW
DECLARE
luser pf_pago_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pago_h VALUES (pf_pago_h_seq.nextval,:new.cve_pago,:new.fechaPago,:new.monto,
    :new.cve_plan,:new.cve_usuario,luser,sysdate,'UPDATE');
    
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_pago_h BEFORE
    DELETE ON pf_pago
    FOR EACH ROW
DECLARE
luser pf_pago_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pago_h VALUES (pf_pago_h_seq.nextval,:old.cve_pago,:old.fechaPago,:old.monto,
    :old.cve_plan,:old.cve_usuario,luser,sysdate,'DELETE');
    
END;
/


CREATE TABLE pf_cuenta_h (
    cve_cuenta_h     INTEGER NOT NULL,
    cve_cuenta       INTEGER NOT NULL,
    contraseña       VARCHAR2(50 CHAR) NOT NULL,
    cve_usuario      INTEGER NOT NULL,
    cve_region       INTEGER NOT NULL,
    cve_plan         INTEGER,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR)
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_cuenta_h__indx ON
    pf_cuenta_h (
        cve_cuenta_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_cuenta_h__indxv1 ON
    pf_cuenta_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_cuenta_h ADD CONSTRAINT pf_cuenta_h_ck_1 CHECK ( cve_cuenta_h > 0 );

ALTER TABLE pf_cuenta_h ADD CONSTRAINT pf_cuenta_h_ck_2 CHECK ( cve_cuenta > 0 );

ALTER TABLE pf_cuenta_h ADD CONSTRAINT pf_cuenta_h_ck_3 CHECK ( cve_usuario > 0 );

ALTER TABLE pf_cuenta_h ADD CONSTRAINT pf_cuenta_h_ck_4 CHECK ( cve_region > 0 );

ALTER TABLE pf_cuenta_h ADD CONSTRAINT pf_cuenta_h_ck_5 CHECK ( cve_plan > 0 );

ALTER TABLE pf_cuenta_h ADD CONSTRAINT pk_pf_cuenta_h PRIMARY KEY ( cve_cuenta_h );

CREATE SEQUENCE pf_cuenta_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_cuenta_h BEFORE
    INSERT ON pf_cuenta
    FOR EACH ROW
DECLARE
luser pf_cuenta_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_cuenta_h VALUES (pf_cuenta_h_seq.nextval,:new.cve_cuenta,:new.contraseña,:new.cve_usuario,
    :new.cve_region,:new.cve_plan,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_cuenta_h BEFORE
    UPDATE ON pf_cuenta
    FOR EACH ROW
DECLARE
luser pf_cuenta_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_cuenta_h VALUES (pf_cuenta_h_seq.nextval,:new.cve_cuenta,:new.contraseña,:new.cve_usuario,
    :new.cve_region,:new.cve_plan,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_cuenta_h BEFORE
    DELETE ON pf_cuenta
    FOR EACH ROW
DECLARE
luser pf_cuenta_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_cuenta_h VALUES (pf_cuenta_h_seq.nextval,:old.cve_cuenta,:old.contraseña,:old.cve_usuario,
    :old.cve_region,:old.cve_plan,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_tipo_perfil_h (
    cve_tipo_perfil_h   INTEGER NOT NULL,
    cve_tipo_perfil     INTEGER NOT NULL,
    descripcion         VARCHAR2(50 CHAR) NOT NULL,
    modificado_por      VARCHAR2(50 CHAR) NOT NULL,
    modificado_el       DATE NOT NULL,
    accion              VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_tipo_perfil_h__indx ON
    pf_tipo_perfil_h (
        cve_tipo_perfil_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_tipo_perfil_h__indxv1 ON
    pf_tipo_perfil_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_tipo_perfil_h ADD CONSTRAINT pf_tipo_perfil_h_ck_1 CHECK ( cve_tipo_perfil_h > 0 );

ALTER TABLE pf_tipo_perfil_h ADD CONSTRAINT pf_tipo_perfil_h_ck_2 CHECK ( cve_tipo_perfil > 0 );

ALTER TABLE pf_tipo_perfil_h ADD CONSTRAINT pk_pf_tipo_perfil_h PRIMARY KEY ( cve_tipo_perfil_h );

CREATE SEQUENCE pf_tipo_perfil_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_tipo_perfil_h BEFORE
    INSERT ON pf_tipo_perfil
    FOR EACH ROW
DECLARE
luser pf_tipo_perfil_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_tipo_perfil_h VALUES (pf_tipo_perfil_h_seq.nextval,:new.cve_tipo_perfil,:new.descripcion,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_tipo_perfil_h BEFORE
    UPDATE ON pf_tipo_perfil
    FOR EACH ROW
DECLARE
luser pf_tipo_perfil_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_tipo_perfil_h VALUES (pf_tipo_perfil_h_seq.nextval,:new.cve_tipo_perfil,:new.descripcion,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_tipo_perfil_h BEFORE
    DELETE ON pf_tipo_perfil
    FOR EACH ROW
DECLARE
luser pf_tipo_perfil_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_tipo_perfil_h VALUES (pf_tipo_perfil_h_seq.nextval,:old.cve_tipo_perfil,:old.descripcion,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_imagen_h (
    cve_imagen_h     INTEGER NOT NULL,
    cve_imagen       INTEGER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_imagen_h__indx ON
    pf_imagen_h (
        cve_imagen_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_imagen_h__indxv1 ON
    pf_imagen_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_imagen_h ADD CONSTRAINT pf_imagen_h_ck_1 CHECK ( cve_imagen_h > 0 );

ALTER TABLE pf_imagen_h ADD CONSTRAINT pf_imagen_h_ck_2 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_imagen_h ADD CONSTRAINT pk_pf_imagen_h PRIMARY KEY ( cve_imagen_h );

CREATE SEQUENCE pf_imagen_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_imagen_h BEFORE
    INSERT ON pf_imagen
    FOR EACH ROW
DECLARE
luser pf_imagen_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_imagen_h VALUES (pf_imagen_h_seq.nextval,:new.cve_imagen,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_imagen_h BEFORE
    UPDATE ON pf_imagen
    FOR EACH ROW
DECLARE
luser pf_imagen_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_imagen_h VALUES (pf_imagen_h_seq.nextval,:new.cve_imagen,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_imagen_h BEFORE
    DELETE ON pf_imagen
    FOR EACH ROW
DECLARE
luser pf_imagen_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_imagen_h VALUES (pf_imagen_h_seq.nextval,:old.cve_imagen,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_genero_h (
    cve_genero_h     INTEGER NOT NULL,
    cve_genero       INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    modificado_por   VARCHAR2(50 CHAR),
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_genero_h__indx ON
    pf_genero_h (
        cve_genero_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_genero_h__indxv1 ON
    pf_genero_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_genero_h ADD CONSTRAINT pf_genero_h_ck_1 CHECK ( cve_genero_h > 0 );

ALTER TABLE pf_genero_h ADD CONSTRAINT pf_genero_h_ck_2 CHECK ( cve_genero > 0 );

ALTER TABLE pf_genero_h ADD CONSTRAINT pk_pf_genero_h PRIMARY KEY ( cve_genero_h );

CREATE SEQUENCE pf_genero_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_genero_h BEFORE
    INSERT ON pf_genero
    FOR EACH ROW
DECLARE
luser pf_genero_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_genero_h VALUES (pf_genero_h_seq.nextval,:new.cve_genero,:new.descripcion,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_genero_h BEFORE
    UPDATE ON pf_genero
    FOR EACH ROW
DECLARE
luser pf_genero_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_genero_h VALUES (pf_genero_h_seq.nextval,:new.cve_genero,:new.descripcion,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_genero_h BEFORE
    DELETE ON pf_genero
    FOR EACH ROW
DECLARE
luser pf_genero_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_genero_h VALUES (pf_genero_h_seq.nextval,:old.cve_genero,:old.descripcion,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_informacion_h (
    cve_informacion_h   INTEGER NOT NULL,
    cve_informacion     INTEGER NOT NULL,
    nombre              VARCHAR2(50 CHAR) NOT NULL,
    fechasalida         DATE NOT NULL,
    rating              NUMBER NOT NULL,
    duracion            NUMBER NOT NULL,
    cve_genero          INTEGER NOT NULL,
    modificado_por      VARCHAR2(50 CHAR) NOT NULL,
    modificado_el       DATE NOT NULL,
    accion              VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_informacion_h__indx ON
    pf_informacion_h (
        cve_informacion_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_informacion_h__indxv1 ON
    pf_informacion_h (
        fechasalida
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_informacion_h__indxv2 ON
    pf_informacion_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_informacion_h ADD CONSTRAINT pf_informacion_h_ck_1 CHECK ( cve_informacion_h > 0 );

ALTER TABLE pf_informacion_h ADD CONSTRAINT pf_informacion_h_ck_2 CHECK ( cve_informacion > 0 );

ALTER TABLE pf_informacion_h ADD CONSTRAINT pf_informacion_h_ck_3 CHECK ( rating > 0 );

ALTER TABLE pf_informacion_h ADD CONSTRAINT pf_informacion_h_ck_4 CHECK ( duracion > 0 );

ALTER TABLE pf_informacion_h ADD CONSTRAINT pf_informacion_h_ck_5 CHECK ( cve_genero > 0 );

ALTER TABLE pf_informacion_h ADD CONSTRAINT pk_pf_informacion_h PRIMARY KEY ( cve_informacion_h );

CREATE SEQUENCE pf_informacion_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_informacion_h BEFORE
    INSERT ON pf_informacion
    FOR EACH ROW
DECLARE
luser pf_informacion_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_informacion_h VALUES (pf_informacion_h_seq.nextval,:new.cve_informacion,:new.nombre,:new.fechaSalida,
    :new.rating,:new.duracion,:new.cve_genero,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_informacion_h BEFORE
    UPDATE ON pf_informacion
    FOR EACH ROW
DECLARE
luser pf_informacion_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_informacion_h VALUES (pf_informacion_h_seq.nextval,:new.cve_informacion,:new.nombre,:new.fechaSalida,
    :new.rating,:new.duracion,:new.cve_genero,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_informacion_h BEFORE
    DELETE ON pf_informacion
    FOR EACH ROW
DECLARE
luser pf_informacion_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_informacion_h VALUES (pf_informacion_h_seq.nextval,:old.cve_informacion,:old.nombre,:old.fechaSalida,
    :old.rating,:old.duracion,:old.cve_genero,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_pelicula_h (
    cve_pelicula_h    INTEGER NOT NULL,
    cve_pelicula      INTEGER NOT NULL,
    cve_informacion   INTEGER NOT NULL,
    cve_imagen        INTEGER NOT NULL,
    modificado_por    VARCHAR2(50 CHAR) NOT NULL,
    modificado_el     DATE NOT NULL,
    accion            VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_pelicula_h__indx ON
    pf_pelicula_h (
        cve_pelicula_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_pelicula_h__indxv1 ON
    pf_pelicula_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_pelicula_h ADD CONSTRAINT pf_pelicula_h_ck_1 CHECK ( cve_pelicula_h > 0 );

ALTER TABLE pf_pelicula_h ADD CONSTRAINT pf_pelicula_h_ck_2 CHECK ( cve_pelicula > 0 );

ALTER TABLE pf_pelicula_h ADD CONSTRAINT pf_pelicula_h_ck_3 CHECK ( cve_informacion > 0 );

ALTER TABLE pf_pelicula_h ADD CONSTRAINT pf_pelicula_h_ck_4 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_pelicula_h ADD CONSTRAINT pk_pf_pelicula_h PRIMARY KEY ( cve_pelicula_h );

CREATE SEQUENCE pf_pelicula_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_pelicula_h BEFORE
    INSERT ON pf_pelicula
    FOR EACH ROW
DECLARE
luser pf_pelicula_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pelicula_h VALUES (pf_pelicula_h_seq.nextval,:new.cve_pelicula,:new.cve_informacion,:new.cve_imagen,luser,sysdate,
    'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_pelicula_h BEFORE
    UPDATE ON pf_pelicula
    FOR EACH ROW
DECLARE
luser pf_pelicula_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pelicula_h VALUES (pf_pelicula_h_seq.nextval,:new.cve_pelicula,:new.cve_informacion,:new.cve_imagen,luser,sysdate,
    'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_pelicula_h BEFORE
    DELETE ON pf_pelicula
    FOR EACH ROW
DECLARE
luser pf_pelicula_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_pelicula_h VALUES (pf_pelicula_h_seq.nextval,:old.cve_pelicula,:old.cve_informacion,:old.cve_imagen,luser,sysdate,
    'DELETE');
END;
/


CREATE TABLE pf_serie_h (
    cve_serie_h       INTEGER NOT NULL,
    cve_serie         INTEGER NOT NULL,
    cve_informacion   INTEGER NOT NULL,
    cve_imagen        INTEGER NOT NULL,
    modificado_por    VARCHAR2(50 CHAR) NOT NULL,
    modificado_el     DATE NOT NULL,
    accion            VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_serie_h__indx ON
    pf_serie_h (
        cve_serie_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_serie_h__indxv1 ON
    pf_serie_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_serie_h ADD CONSTRAINT pf_serie_h_ck_1 CHECK ( cve_serie_h > 0 );

ALTER TABLE pf_serie_h ADD CONSTRAINT pf_serie_h_ck_2 CHECK ( cve_serie > 0 );

ALTER TABLE pf_serie_h ADD CONSTRAINT pf_serie_h_ck_3 CHECK ( cve_informacion > 0 );

ALTER TABLE pf_serie_h ADD CONSTRAINT pf_serie_h_ck_4 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_serie_h ADD CONSTRAINT pk_pf_serie PRIMARY KEY ( cve_serie_h );

CREATE SEQUENCE pf_serie_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_serie_h BEFORE
    INSERT ON pf_serie
    FOR EACH ROW
DECLARE
luser pf_serie_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_serie_h VALUES (pf_serie_h_seq.nextval,:new.cve_serie,:new.cve_informacion,:new.cve_imagen,
    luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_serie_h BEFORE
    UPDATE ON pf_serie
    FOR EACH ROW
DECLARE
luser pf_serie_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_serie_h VALUES (pf_serie_h_seq.nextval,:new.cve_serie,:new.cve_informacion,:new.cve_imagen,
    luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_serie_h BEFORE
    DELETE ON pf_serie
    FOR EACH ROW
DECLARE
luser pf_serie_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_serie_h VALUES (pf_serie_h_seq.nextval,:old.cve_serie,:old.cve_informacion,:old.cve_imagen,
    luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_temporada_h (
    cve_temporada_h   INTEGER NOT NULL,
    cve_temporada     INTEGER NOT NULL,
    descripcion       VARCHAR2(50 CHAR) NOT NULL,
    episodios        INTEGER NOT NULL,
    cve_serie         INTEGER NOT NULL,
    modificado_por    VARCHAR2(50 CHAR) NOT NULL,
    modificado_el     DATE NOT NULL,
    accion            VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_temporada_h__indx ON
    pf_temporada_h (
        cve_temporada_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_temporada_h__indxv1 ON
    pf_temporada_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_temporada_h ADD CONSTRAINT pf_temporada_h_ck_1 CHECK ( cve_temporada_h > 0 );

ALTER TABLE pf_temporada_h ADD CONSTRAINT pf_temporada_h_ck_2 CHECK ( cve_temporada > 0 );

ALTER TABLE pf_temporada_h ADD CONSTRAINT pf_temporada_h_ck_3 CHECK ( episodios > 0 );

ALTER TABLE pf_temporada_h ADD CONSTRAINT pf_temporada_h_ck_4 CHECK ( cve_serie > 0 );

ALTER TABLE pf_temporada_h ADD CONSTRAINT pk_pf_temporada_h PRIMARY KEY ( cve_temporada_h );

CREATE SEQUENCE pf_temporada_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_temporada_h BEFORE
    INSERT ON pf_temporada
    FOR EACH ROW
DECLARE
luser pf_temporada_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_temporada_h VALUES (pf_temporada_h_seq.nextval,:new.cve_temporada,:new.descripcion,:new.episodios,
    :new.cve_serie,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_temporada_h BEFORE
    UPDATE ON pf_temporada
    FOR EACH ROW
DECLARE
luser pf_temporada_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_temporada_h VALUES (pf_temporada_h_seq.nextval,:new.cve_temporada,:new.descripcion,:new.episodios,
    :new.cve_serie,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_temporada_h BEFORE
    DELETE ON pf_temporada
    FOR EACH ROW
DECLARE
luser pf_temporada_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_temporada_h VALUES (pf_temporada_h_seq.nextval,:old.cve_temporada,:old.descripcion,:old.episodios,
    :old.cve_serie,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_episodio_h (
    cve_episodio_h    INTEGER NOT NULL,
    cve_episodio      INTEGER NOT NULL,
    cve_temporada     INTEGER NOT NULL,
    cve_imagen        INTEGER NOT NULL,
    cve_informacion   INTEGER NOT NULL,
    modificado_por    VARCHAR2(50 CHAR) NOT NULL,
    modificado_el     DATE,
    accion            VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_episodio_h__indx ON
    pf_episodio_h (
        cve_episodio_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_episodio_h__indxv1 ON
    pf_episodio_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_episodio_h ADD CONSTRAINT pf_episodio_h_ck_1 CHECK ( cve_episodio_h > 0 );

ALTER TABLE pf_episodio_h ADD CONSTRAINT pf_episodio_h_ck_2 CHECK ( cve_episodio > 0 );

ALTER TABLE pf_episodio_h ADD CONSTRAINT pf_episodio_h_ck_3 CHECK ( cve_temporada > 0 );

ALTER TABLE pf_episodio_h ADD CONSTRAINT pf_episodio_h_ck_4 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_episodio_h ADD CONSTRAINT pf_episodio_h_ck_5 CHECK ( cve_informacion > 0 );

ALTER TABLE pf_episodio_h ADD CONSTRAINT pk_pf_episodio_h PRIMARY KEY ( cve_episodio_h );

CREATE SEQUENCE pf_episodio_h_seq START WITH 1 MINVALUE 1 MAXVALUE 99999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_episodio_h BEFORE
    INSERT ON pf_episodio
    FOR EACH ROW
DECLARE
luser pf_episodio_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_episodio_h VALUES (pf_episodio_h_seq.nextval,:new.cve_episodio,:new.cve_temporada,:new.cve_imagen,
    :new.cve_informacion,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_episodio_h BEFORE
    UPDATE ON pf_episodio
    FOR EACH ROW
DECLARE
luser pf_episodio_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_episodio_h VALUES (pf_episodio_h_seq.nextval,:new.cve_episodio,:new.cve_temporada,:new.cve_imagen,
    :new.cve_informacion,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_episodio_h BEFORE
    DELETE ON pf_episodio
    FOR EACH ROW
DECLARE
luser pf_episodio_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_episodio_h VALUES (pf_episodio_h_seq.nextval,:old.cve_episodio,:old.cve_temporada,:old.cve_imagen,
    :old.cve_informacion,luser,sysdate,'DELETE');
END;
/


CREATE TABLE pf_productora_h (
    cve_productora_h   INTEGER NOT NULL,
    cve_productora     INTEGER NOT NULL,
    descripcion        VARCHAR2(50 CHAR) NOT NULL,
    cve_direccion      INTEGER NOT NULL,
    cve_empresa        INTEGER NOT NULL,
    modificado_por     VARCHAR2(50 CHAR) NOT NULL,
    modificado_el      DATE NOT NULL,
    accion             VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_productora_h__indx ON
    pf_productora_h (
        cve_productora_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_productora_h__indxv1 ON
    pf_productora_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_productora_h ADD CONSTRAINT pf_productora_h_ck_1 CHECK ( cve_productora_h > 0 );

ALTER TABLE pf_productora_h ADD CONSTRAINT pf_productora_h_ck_2 CHECK ( cve_productora > 0 );

ALTER TABLE pf_productora_h ADD CONSTRAINT pf_productora_h_ck_3 CHECK ( cve_direccion > 0 );

ALTER TABLE pf_productora_h ADD CONSTRAINT pf_productora_h_ck_4 CHECK ( cve_empresa > 0 );

ALTER TABLE pf_productora_h ADD CONSTRAINT pk_pf_productora_h PRIMARY KEY ( cve_productora_h );

CREATE SEQUENCE pf_productora_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_productora_h BEFORE
    INSERT ON pf_productora
    FOR EACH ROW
DECLARE
luser pf_productora_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_productora_h VALUES (pf_productora_h_seq.nextval,:new.cve_productora,:new.descripcion,:new.cve_direccion,
    :new.cve_empresa,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_productora_h BEFORE
    DELETE ON pf_productora
    FOR EACH ROW
DECLARE
luser pf_productora_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_productora_h VALUES (pf_productora_h_seq.nextval,:old.cve_productora,:old.descripcion,:old.cve_direccion,
    :old.cve_empresa,luser,sysdate,'DELETE');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_productora_h BEFORE
    UPDATE ON pf_productora
    FOR EACH ROW
DECLARE
luser pf_productora_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_productora_h VALUES (pf_productora_h_seq.nextval,:new.cve_productora,:new.descripcion,:new.cve_direccion,
    :new.cve_empresa,luser,sysdate,'UPDATE');
END;
/



DROP TABLE pf_contrato_h CASCADE CONSTRAINTS;

DROP SEQUENCE pf_contrato_h_seq;

CREATE TABLE pf_contrato_h (
    cve_contrato_h   INTEGER NOT NULL,
    cve_contrato     INTEGER NOT NULL,
    fechacontrato    DATE NOT NULL,
    cve_empresa      INTEGER NOT NULL,
    cve_productora   INTEGER NOT NULL,
    modificado_por   VARCHAR2(50 CHAR) NOT NULL,
    modificado_el    DATE NOT NULL,
    accion           VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pf_contrato_h__indx ON
    pf_contrato_h (
        cve_contrato_h
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_contrato_h__indxv1 ON
    pf_contrato_h (
        fechacontrato
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pf_contrato_h__indxv2 ON
    pf_contrato_h (
        modificado_el
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_contrato_h ADD CONSTRAINT pf_contrato_h_ck_1 CHECK ( cve_contrato_h > 0 );

ALTER TABLE pf_contrato_h ADD CONSTRAINT pf_contrato_h_ck_2 CHECK ( cve_contrato > 0 );

ALTER TABLE pf_contrato_h ADD CONSTRAINT pf_contrato_h_ck_3 CHECK ( cve_empresa > 0 );

ALTER TABLE pf_contrato_h ADD CONSTRAINT pf_contrato_h_ck_4 CHECK ( cve_productora > 0 );

ALTER TABLE pf_contrato_h ADD CONSTRAINT pk_pf_contrato_h PRIMARY KEY ( cve_contrato_h );

CREATE SEQUENCE pf_contrato_h_seq START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tib_pf_contrato_h BEFORE
    INSERT ON pf_contrato
    FOR EACH ROW
DECLARE
luser pf_contrato_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_contrato_h VALUES (pf_contrato_h_seq.nextval,:new.cve_contrato,:new.fechaContrato,:new.cve_empresa
    ,:new.cve_productora,luser,sysdate,'INSERT');
END;
/
CREATE OR REPLACE TRIGGER tub_pf_contrato_h BEFORE
    UPDATE ON pf_contrato
    FOR EACH ROW
DECLARE
luser pf_contrato_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_contrato_h VALUES (pf_contrato_h_seq.nextval,:new.cve_contrato,:new.fechaContrato,:new.cve_empresa
    ,:new.cve_productora,luser,sysdate,'UPDATE');
END;
/
CREATE OR REPLACE TRIGGER tdb_pf_contrato_h BEFORE
    DELETE ON pf_contrato
    FOR EACH ROW
DECLARE
luser pf_contrato_h.modificado_por%type;
BEGIN
    SELECT USER INTO luser FROM DUAL;
    INSERT INTO pf_contrato_h VALUES (pf_contrato_h_seq.nextval,:old.cve_contrato,:old.fechaContrato,:old.cve_empresa
    ,:old.cve_productora,luser,sysdate,'DELETE');
END;
/

