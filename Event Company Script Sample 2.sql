-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2022-09-16 20:34:09 CDT
--   sitio:      Oracle Database 10g
--   tipo:      Oracle Database 10g

--En mi máquina local no tengo los create tablespace, los comente

CREATE TABLE agenda (
    cve_agenda    INTEGER NOT NULL,
    cve_fecha     INTEGER NOT NULL,
    cve_horario   INTEGER NOT NULL,
    cve_evento    INTEGER NOT NULL,
    cve_tema      INTEGER NOT NULL
);
--TABLESPACE datos LOGGING;

ALTER TABLE agenda ADD CONSTRAINT pk_agenda PRIMARY KEY ( cve_agenda );

CREATE TABLE agendaexpositor (
    cve_agenda      INTEGER NOT NULL,
    cve_expositor   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE agendaexpositor ADD CONSTRAINT pk_eventoexpositor PRIMARY KEY ( cve_agenda,
                                                                            cve_expositor );

CREATE TABLE colonia (
    cve_colonia   INTEGER NOT NULL,
    Nombre           VARCHAR2(50 CHAR),
    cve_estado    INTEGER NOT NULL
)
LOGGING;

ALTER TABLE colonia ADD CONSTRAINT pk_colonia PRIMARY KEY ( cve_colonia );

CREATE TABLE correo (
    cve_correo     INTEGER NOT NULL,
    correo         VARCHAR2(50 CHAR) NOT NULL,
    cve_invitado   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE correo ADD CONSTRAINT pk_correo PRIMARY KEY ( cve_correo );

CREATE TABLE cortesia (
    cve_cortesia      INTEGER NOT NULL,
    nombre_cortesia   VARCHAR2(50 CHAR) NOT NULL,
    descripcion       VARCHAR2(100 CHAR) NOT NULL
)
LOGGING;

ALTER TABLE cortesia ADD CONSTRAINT pk_cortesia PRIMARY KEY ( cve_cortesia );

CREATE TABLE departamento (
    cve_departamento   INTEGER 
         --  ERROR: Column Departamento.cve_Departamento check constraint name length exceeds maximum allowed length(30) 
        CONSTRAINT nnc_departamento_id_departamento NOT NULL,
    cve_direccion      INTEGER
        CONSTRAINT nnc_departamento_cve_direccion NOT NULL,
    cve_responsable    INTEGER NOT NULL
);
--TABLESPACE datos LOGGING;

CREATE INDEX idx_departamento ON
    departamento (
        cve_departamento
    ASC )
        TABLESPACE datos LOGGING;

ALTER TABLE departamento ADD CONSTRAINT pk_departamento PRIMARY KEY ( cve_departamento );

CREATE TABLE direccion (
    cve_direccion   INTEGER NOT NULL,
    calle           VARCHAR2(50 CHAR),
    numero          INTEGER,
    cp              VARCHAR2(50 CHAR),
    cve_colonia     INTEGER NOT NULL
)
LOGGING;

CREATE INDEX idx_direccion ON
    direccion (
        cve_direccion
    ASC,
        cve_colonia
    ASC )
        LOGGING;

ALTER TABLE direccion ADD CONSTRAINT pk_direccion PRIMARY KEY ( cve_direccion );

CREATE TABLE empresa (
    cve_emprea        INTEGER NOT NULL,
    razon_social      VARCHAR2(50 CHAR) NOT NULL,
    cve_direccion     INTEGER NOT NULL,
    cve_responsable   INTEGER NOT NULL
)
LOGGING;

CREATE INDEX idx_empresa ON
    empresa (
        cve_emprea
    ASC,
        cve_responsable
    ASC )
        LOGGING;

ALTER TABLE empresa ADD CONSTRAINT pk_empresa PRIMARY KEY ( cve_emprea );

CREATE TABLE empresainvitado (
    cve_empresa    INTEGER NOT NULL,
    cve_invitado   INTEGER NOT NULL,
    cve_emprea     INTEGER NOT NULL
)
LOGGING;

ALTER TABLE empresainvitado ADD CONSTRAINT pk_empresainvitado PRIMARY KEY ( cve_empresa,
                                                                            cve_invitado );

CREATE TABLE estado (
    cve_estado   INTEGER NOT NULL,
    Nombre           VARCHAR2(50 CHAR),
    cve_pais     INTEGER NOT NULL
)
LOGGING;

ALTER TABLE estado ADD CONSTRAINT pk_estado PRIMARY KEY ( cve_estado );

CREATE TABLE evento (
    cve_evento   INTEGER NOT NULL,
    nombre       VARCHAR2(50 CHAR) NOT NULL,
    precio       INTEGER NOT NULL,
    cve_emprea   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE evento ADD CONSTRAINT pk_evento PRIMARY KEY ( cve_evento );

CREATE TABLE eventoinvitado (
    cve_evento             INTEGER NOT NULL,
    cve_invitado           INTEGER NOT NULL,
    descripcion_registro   VARCHAR2(100 CHAR) NOT NULL
)
LOGGING;

ALTER TABLE eventoinvitado ADD CONSTRAINT pk_eventoinvitado PRIMARY KEY ( cve_evento,
                                                                          cve_invitado );

CREATE TABLE expositor (
    cve_expositor   INTEGER NOT NULL,
    cve_persona     INTEGER NOT NULL
)
LOGGING;

ALTER TABLE expositor ADD CONSTRAINT pk_expositor PRIMARY KEY ( cve_expositor );

CREATE TABLE fecha (
    cve_fecha INTEGER NOT NULL
)
LOGGING;

ALTER TABLE fecha ADD CONSTRAINT pk_fecha PRIMARY KEY ( cve_fecha );

CREATE TABLE horario (
    cve_horario   INTEGER NOT NULL,
    hora_inicio   DATE NOT NULL,
    hora_fin      DATE NOT NULL
)
LOGGING;

ALTER TABLE horario ADD CONSTRAINT pk_horario PRIMARY KEY ( cve_horario );

CREATE TABLE horariotrabajo (
    cve_horariotrabajo   INTEGER NOT NULL,
    hora_inicio          DATE NOT NULL,
    hora_fin             DATE NOT NULL
)
LOGGING;

ALTER TABLE horariotrabajo ADD CONSTRAINT pk_horariotrabajo PRIMARY KEY ( cve_horariotrabajo );

CREATE TABLE invitado (
    cve_invitado    INTEGER NOT NULL,
    cve_direccion   INTEGER NOT NULL,
    cve_persona     INTEGER NOT NULL
);
--TABLESPACE datos LOGGING;

CREATE INDEX idx_invitado ON
    invitado (
        cve_invitado
    ASC )
        LOGGING;

ALTER TABLE invitado ADD CONSTRAINT pk_invitado PRIMARY KEY ( cve_invitado );

CREATE TABLE pago (
    cve_pago       INTEGER NOT NULL,
    forma_pago     VARCHAR2(50 CHAR) NOT NULL,
    cve_evento     INTEGER NOT NULL,
    cve_invitado   INTEGER NOT NULL,
    cve_cortesia   INTEGER
);
--TABLESPACE datos LOGGING;

ALTER TABLE pago ADD CONSTRAINT pk_pago PRIMARY KEY ( cve_pago );

CREATE TABLE pais (
    cve_pais INTEGER NOT NULL,
    Nombre           VARCHAR2(50 CHAR)
)
LOGGING;

ALTER TABLE pais ADD CONSTRAINT pk_pais PRIMARY KEY ( cve_pais );

CREATE TABLE persona (
    cve_persona   INTEGER
        CONSTRAINT nnc_persona_cve_persona NOT NULL,
    nombre        VARCHAR2(50 CHAR) NOT NULL,
    paterno       VARCHAR2(50 CHAR),
    materno       VARCHAR2(50 CHAR)
);
--TABLESPACE datos LOGGING;

ALTER TABLE persona ADD CONSTRAINT pk_persona PRIMARY KEY ( cve_persona );

CREATE TABLE registro (
    cve_registro    INTEGER NOT NULL,
    codigo_barras   BLOB NOT NULL,
    cve_evento      INTEGER NOT NULL,
    cve_invitado    INTEGER NOT NULL
)
LOGGING;

ALTER TABLE registro ADD CONSTRAINT pk_registro PRIMARY KEY ( cve_registro );

CREATE TABLE responsable (
    cve_responsable      INTEGER NOT NULL,
    cve_horariotrabajo   INTEGER NOT NULL,
    cve_persona          INTEGER NOT NULL
)
LOGGING;

ALTER TABLE responsable ADD CONSTRAINT pk_responsable PRIMARY KEY ( cve_responsable );

CREATE TABLE telefono (
    cve_telefono   INTEGER NOT NULL,
    lada           INTEGER,
    numero         INTEGER,
    cve_invitado   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE telefono ADD CONSTRAINT pk_telefono PRIMARY KEY ( cve_telefono );

CREATE TABLE tema (
    cve_tema   INTEGER NOT NULL,
    nombre     VARCHAR2(50 CHAR)
)
LOGGING;

ALTER TABLE tema ADD CONSTRAINT pk_tema PRIMARY KEY ( cve_tema );

CREATE TABLE tematica (
    cve_tematica       INTEGER NOT NULL,
    nombre_tematica    VARCHAR2(50 CHAR) NOT NULL,
    cve_departamento   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE tematica ADD CONSTRAINT pk_tematica PRIMARY KEY ( cve_tematica );

CREATE TABLE tipoevento (
    cve_tipoevento   INTEGER NOT NULL,
    cve_evento       INTEGER NOT NULL,
    nombre           VARCHAR2(50 CHAR) NOT NULL
)
LOGGING;

CREATE INDEX idx_tipoevento ON
    tipoevento (
        cve_tipoevento
    ASC,
        nombre
    ASC )
        LOGGING;

ALTER TABLE tipoevento ADD CONSTRAINT pk_tipoevento PRIMARY KEY ( cve_tipoevento );

ALTER TABLE agendaexpositor
    ADD CONSTRAINT fk_agenda_agendaexpositor FOREIGN KEY ( cve_agenda )
        REFERENCES agenda ( cve_agenda )
    NOT DEFERRABLE;

ALTER TABLE direccion
    ADD CONSTRAINT fk_colonia_direccion FOREIGN KEY ( cve_colonia )
        REFERENCES colonia ( cve_colonia )
    NOT DEFERRABLE;

ALTER TABLE pago
    ADD CONSTRAINT fk_cortesia_pago FOREIGN KEY ( cve_cortesia )
        REFERENCES cortesia ( cve_cortesia )
    NOT DEFERRABLE;

ALTER TABLE tematica
    ADD CONSTRAINT fk_departamento_tematica FOREIGN KEY ( cve_departamento )
        REFERENCES departamento ( cve_departamento )
    NOT DEFERRABLE;

ALTER TABLE departamento
    ADD CONSTRAINT fk_dir_dep FOREIGN KEY ( cve_direccion )
        REFERENCES direccion ( cve_direccion )
    NOT DEFERRABLE;

ALTER TABLE empresa
    ADD CONSTRAINT fk_direccion_empresa FOREIGN KEY ( cve_direccion )
        REFERENCES direccion ( cve_direccion )
    NOT DEFERRABLE;

ALTER TABLE invitado
    ADD CONSTRAINT fk_direccion_invitado FOREIGN KEY ( cve_direccion )
        REFERENCES direccion ( cve_direccion )
    NOT DEFERRABLE;

ALTER TABLE empresainvitado
    ADD CONSTRAINT fk_empresa_empresainvitado FOREIGN KEY ( cve_emprea )
        REFERENCES empresa ( cve_emprea )
    NOT DEFERRABLE;

ALTER TABLE evento
    ADD CONSTRAINT fk_empresa_evento FOREIGN KEY ( cve_emprea )
        REFERENCES empresa ( cve_emprea )
    NOT DEFERRABLE;

ALTER TABLE colonia
    ADD CONSTRAINT fk_estado_colonia FOREIGN KEY ( cve_estado )
        REFERENCES estado ( cve_estado )
    NOT DEFERRABLE;

ALTER TABLE agenda
    ADD CONSTRAINT fk_evento_agenda FOREIGN KEY ( cve_evento )
        REFERENCES evento ( cve_evento )
    NOT DEFERRABLE;

ALTER TABLE eventoinvitado
    ADD CONSTRAINT fk_evento_eventoinvitado FOREIGN KEY ( cve_evento )
        REFERENCES evento ( cve_evento )
    NOT DEFERRABLE;

ALTER TABLE tipoevento
    ADD CONSTRAINT fk_evento_tipoevento FOREIGN KEY ( cve_evento )
        REFERENCES evento ( cve_evento )
    NOT DEFERRABLE;

ALTER TABLE pago
    ADD CONSTRAINT fk_eventoinvitado_pago FOREIGN KEY ( cve_evento,
                                                        cve_invitado )
        REFERENCES eventoinvitado ( cve_evento,
                                    cve_invitado )
    NOT DEFERRABLE;

ALTER TABLE registro
    ADD CONSTRAINT fk_eventoinvitado_registro FOREIGN KEY ( cve_evento,
                                                            cve_invitado )
        REFERENCES eventoinvitado ( cve_evento,
                                    cve_invitado )
    NOT DEFERRABLE;

ALTER TABLE agendaexpositor
    ADD CONSTRAINT fk_expositor_eventoexpositor FOREIGN KEY ( cve_expositor )
        REFERENCES expositor ( cve_expositor )
    NOT DEFERRABLE;

ALTER TABLE agenda
    ADD CONSTRAINT fk_fecha_agenda FOREIGN KEY ( cve_fecha )
        REFERENCES fecha ( cve_fecha )
    NOT DEFERRABLE;

ALTER TABLE agenda
    ADD CONSTRAINT fk_horario_agenda FOREIGN KEY ( cve_horario )
        REFERENCES horario ( cve_horario )
    NOT DEFERRABLE;

ALTER TABLE responsable
    ADD CONSTRAINT fk_horariotrabajo_responsable FOREIGN KEY ( cve_horariotrabajo )
        REFERENCES horariotrabajo ( cve_horariotrabajo )
    NOT DEFERRABLE;

ALTER TABLE correo
    ADD CONSTRAINT fk_invitado_correo FOREIGN KEY ( cve_invitado )
        REFERENCES invitado ( cve_invitado )
    NOT DEFERRABLE;

ALTER TABLE empresainvitado
    ADD CONSTRAINT fk_invitado_empresainvitado FOREIGN KEY ( cve_invitado )
        REFERENCES invitado ( cve_invitado )
    NOT DEFERRABLE;

ALTER TABLE eventoinvitado
    ADD CONSTRAINT fk_invitado_eventoinvitado FOREIGN KEY ( cve_invitado )
        REFERENCES invitado ( cve_invitado )
    NOT DEFERRABLE;

ALTER TABLE telefono
    ADD CONSTRAINT fk_invitado_telefono FOREIGN KEY ( cve_invitado )
        REFERENCES invitado ( cve_invitado )
    NOT DEFERRABLE;

ALTER TABLE estado
    ADD CONSTRAINT fk_pais_estado FOREIGN KEY ( cve_pais )
        REFERENCES pais ( cve_pais )
    NOT DEFERRABLE;

ALTER TABLE expositor
    ADD CONSTRAINT fk_persona_expositor FOREIGN KEY ( cve_persona )
        REFERENCES persona ( cve_persona )
    NOT DEFERRABLE;

ALTER TABLE invitado
    ADD CONSTRAINT fk_persona_invitado FOREIGN KEY ( cve_persona )
        REFERENCES persona ( cve_persona )
    NOT DEFERRABLE;

ALTER TABLE responsable
    ADD CONSTRAINT fk_persona_responsable FOREIGN KEY ( cve_persona )
        REFERENCES persona ( cve_persona )
    NOT DEFERRABLE;

ALTER TABLE departamento
    ADD CONSTRAINT fk_res_dep FOREIGN KEY ( cve_responsable )
        REFERENCES responsable ( cve_responsable )
    NOT DEFERRABLE;

ALTER TABLE empresa
    ADD CONSTRAINT fk_responsable_empresa FOREIGN KEY ( cve_responsable )
        REFERENCES responsable ( cve_responsable )
    NOT DEFERRABLE;

ALTER TABLE agenda
    ADD CONSTRAINT fk_tema_agenda FOREIGN KEY ( cve_tema )
        REFERENCES tema ( cve_tema )
    NOT DEFERRABLE;

--DESCRIBE AGENDA;
--ROLLBACK;
--Commit;
-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            26
-- CREATE INDEX                             5
-- ALTER TABLE                             56
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        1
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 1
