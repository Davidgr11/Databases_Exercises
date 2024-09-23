-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2022-09-30 16:15:59 CDT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE p3agente (
    cve_p3agente           NUMBER NOT NULL,
    cve_p3persona          NUMBER NOT NULL,
    cve_p3horariotrabajo   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3agente ON
    p3agente (
        cve_p3agente
    ASC )TABLESPACE INDX;

ALTER TABLE p3agente ADD CONSTRAINT pk_p3agente PRIMARY KEY ( cve_p3agente );

ALTER TABLE p3agente ADD CONSTRAINT cve_p3persona_ck CHECK (cve_p3persona >0);
ALTER TABLE p3agente ADD CONSTRAINT cve_p3agente_ck CHECK (cve_p3agente >0);
ALTER TABLE p3agente ADD CONSTRAINT cve_p3horariotrabajo_ck CHECK (cve_p3horariotrabajo >0);

CREATE TABLE p3aseguradora (
    cve_p3aseguradora   NUMBER NOT NULL,
    razon_social        VARCHAR2(50) NOT NULL,
    rfc                 VARCHAR2(13) NOT NULL,
    cve_p3direccion     NUMBER NOT NULL,
    cve_p3pagina_web    NUMBER NOT NULL,
    cve_p3branding      NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3aseguradora ON
    p3aseguradora (
        cve_p3aseguradora
    ASC )TABLESPACE INDX;

ALTER TABLE p3aseguradora ADD CONSTRAINT pk_p3aseguradora PRIMARY KEY ( cve_p3aseguradora );

ALTER TABLE p3aseguradora ADD CONSTRAINT cve_p3direccion_ck CHECK (cve_p3direccion >0);
ALTER TABLE p3aseguradora ADD CONSTRAINT cve_p3pagina_web_ck CHECK (cve_p3pagina_web >0);
ALTER TABLE p3aseguradora ADD CONSTRAINT cve_p3branding_ck CHECK (cve_p3branding >0);

CREATE TABLE p3aseguradora_p3agente (
    cve_p3aseguradora_p3agente   NUMBER NOT NULL,
    cve_p3aseguradora            NUMBER NOT NULL,
    cve_p3agente                 NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3aseguradora_p3agente ON
    p3aseguradora_p3agente (
        cve_p3aseguradora_p3agente
    ASC )TABLESPACE INDX;

ALTER TABLE p3aseguradora_p3agente ADD CONSTRAINT pk_p3aseguradora_p3agente PRIMARY KEY ( cve_p3aseguradora_p3agente );

CREATE TABLE p3aseguradora_p3cliente (
    cve_p3aseguradora_p3cliente   NUMBER NOT NULL,
    cve_p3aseguradora             NUMBER NOT NULL,
    cve_p3cliente                 NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3aseguradora_p3cliente ON
    p3aseguradora_p3cliente (
        cve_p3aseguradora_p3cliente
    ASC )TABLESPACE INDX;

ALTER TABLE p3aseguradora_p3cliente ADD CONSTRAINT pk_p3aseguradora_p3cliente PRIMARY KEY ( cve_p3aseguradora_p3cliente );

CREATE TABLE "P3 Beneficiario" (
    cve_p3beneficiario   NUMBER NOT NULL,
    fecha_nacimiento     DATE NOT NULL,
    cve_p3persona        NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX "PK_P3 Beneficiario" ON
    "P3 Beneficiario" (
        cve_p3beneficiario
    ASC )TABLESPACE INDX;

ALTER TABLE "P3 Beneficiario" ADD CONSTRAINT "PK_P3 Beneficiario" PRIMARY KEY ( cve_p3beneficiario );

CREATE TABLE p3branding (
    cve_p3branding     NUMBER NOT NULL,
    proposito          VARCHAR2(100) NOT NULL,
    nombre_marca       VARCHAR2(20) NOT NULL,
    logo               BLOB NOT NULL,
    color_principal    VARCHAR2(15) NOT NULL,
    color_secundario   VARCHAR2(15) NOT NULL,
    slogan             VARCHAR2(100) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3branding ON
    p3branding (
        cve_p3branding
    ASC )TABLESPACE INDX;

ALTER TABLE p3branding ADD CONSTRAINT pk_p3branding PRIMARY KEY ( cve_p3branding );

CREATE TABLE p3cliente (
    cve_p3cliente       NUMBER NOT NULL,
    fecha_nacimiento    DATE NOT NULL,
    cve_p3persona       NUMBER NOT NULL,
    cve_p3tipo_seguro   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3cliente ON
    p3cliente (
        cve_p3cliente
    ASC )TABLESPACE INDX;

ALTER TABLE p3cliente ADD CONSTRAINT pk_p3cliente PRIMARY KEY ( cve_p3cliente );

CREATE TABLE p3cliente_p3agente (
    cve_p3cliente_p3agente   NUMBER NOT NULL,
    cve_p3cliente            NUMBER NOT NULL,
    cve_p3agente             NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3cliente_p3agente ON
    p3cliente_p3agente (
        cve_p3cliente_p3agente
    ASC )TABLESPACE INDX;

ALTER TABLE p3cliente_p3agente ADD CONSTRAINT pk_p3cliente_p3agente PRIMARY KEY ( cve_p3cliente_p3agente );

CREATE TABLE p3colonia (
    cve_p3colonia      NUMBER NOT NULL,
    nombre             VARCHAR2(50) NOT NULL,
    cve_p3delegacion   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3colonia ON
    p3colonia (
        cve_p3colonia
    ASC )TABLESPACE INDX;

ALTER TABLE p3colonia ADD CONSTRAINT pk_p3colonia PRIMARY KEY ( cve_p3colonia );

CREATE TABLE p3contacto (
    cve_p3contacto      NUMBER NOT NULL,
    cve_p3aseguradora   NUMBER NOT NULL,
    cve_p3persona       NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3contacto ON
    p3contacto (
        cve_p3contacto
    ASC )TABLESPACE INDX;

ALTER TABLE p3contacto ADD CONSTRAINT pk_p3contacto PRIMARY KEY ( cve_p3contacto );

CREATE TABLE p3correo (
    cve_p3correo   NUMBER NOT NULL,
    correo         VARCHAR2(40) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3correo ON
    p3correo (
        cve_p3correo
    ASC )TABLESPACE INDX;

ALTER TABLE p3correo ADD CONSTRAINT pk_p3correo PRIMARY KEY ( cve_p3correo );

CREATE TABLE p3delegacion (
    cve_p3delegacion   NUMBER NOT NULL,
    nombre             VARCHAR2(50) NOT NULL,
    cve_p3estado       NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3delegacion ON
    p3delegacion (
        cve_p3delegacion
    ASC )TABLESPACE INDX;

ALTER TABLE p3delegacion ADD CONSTRAINT pk_p3delegacion PRIMARY KEY ( cve_p3delegacion );

CREATE TABLE p3direccion (
    cve_p3direccion   NUMBER NOT NULL,
    calle             VARCHAR2(50) NOT NULL,
    numero            NUMBER NOT NULL,
    cp                NUMBER NOT NULL,
    cve_p3colonia     NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3direccion ON
    p3direccion (
        cve_p3direccion
    ASC )TABLESPACE INDX;

ALTER TABLE p3direccion ADD CONSTRAINT pk_p3direccion PRIMARY KEY ( cve_p3direccion );

CREATE TABLE p3estado (
    cve_p3estado   NUMBER NOT NULL,
    nombre         VARCHAR2(50) NOT NULL,
    cve_p3pais     NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3estado ON
    p3estado (
        cve_p3estado
    ASC )TABLESPACE INDX;

ALTER TABLE p3estado ADD CONSTRAINT pk_p3estado PRIMARY KEY ( cve_p3estado );

CREATE TABLE p3horariotrabajo (
    cve_p3horariotrabajo   NUMBER NOT NULL,
    horainicio             DATE NOT NULL,
    horafin                DATE NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3horariotrabajo ON
    p3horariotrabajo (
        cve_p3horariotrabajo
    ASC )TABLESPACE INDX;

ALTER TABLE p3horariotrabajo ADD CONSTRAINT pk_p3horariotrabajo PRIMARY KEY ( cve_p3horariotrabajo );

CREATE TABLE p3pagina_web (
    cve_p3pagina_web   NUMBER NOT NULL,
    dominio            VARCHAR2(30) NOT NULL,
    extension          VARCHAR2(10) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3pagina_web ON
    p3pagina_web (
        cve_p3pagina_web
    ASC )TABLESPACE INDX;

ALTER TABLE p3pagina_web ADD CONSTRAINT pk_p3pagina_web PRIMARY KEY ( cve_p3pagina_web );

CREATE TABLE p3pago (
    cve_p3pagp      NUMBER NOT NULL,
    fecha           DATE NOT NULL,
    monto           NUMBER NOT NULL,
    saldo_deudor    NUMBER NOT NULL,
    cve_p3cliente   NUMBER NOT NULL,
    cve_p3seguro    NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3pago ON
    p3pago (
        cve_p3pagp
    ASC )TABLESPACE INDX;

ALTER TABLE p3pago ADD CONSTRAINT pk_p3pago PRIMARY KEY ( cve_p3pagp );

CREATE TABLE p3pais (
    cve_p3pais   NUMBER NOT NULL,
    nombre       VARCHAR2(50) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3pais ON
    p3pais (
        cve_p3pais
    ASC )TABLESPACE INDX;

ALTER TABLE p3pais ADD CONSTRAINT pk_p3pais PRIMARY KEY ( cve_p3pais );

CREATE TABLE p3persona (
    cve_p3persona     NUMBER NOT NULL,
    nombre            VARCHAR2(50) NOT NULL,
    materno           VARCHAR2(50) NOT NULL,
    paterno           VARCHAR2(50) NOT NULL,
    cve_p3direccion   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3persona ON
    p3persona (
        cve_p3persona
    ASC )TABLESPACE INDX;

ALTER TABLE p3persona ADD CONSTRAINT pk_p3persona PRIMARY KEY ( cve_p3persona );

CREATE TABLE p3persona_p3correo (
    cve_p3persona_p3correo   NUMBER NOT NULL,
    cve_p3persona            NUMBER NOT NULL,
    cve_p3correo             NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3persona_p3correo ON
    p3persona_p3correo (
        cve_p3persona_p3correo
    ASC )TABLESPACE INDX;

ALTER TABLE p3persona_p3correo ADD CONSTRAINT pk_p3persona_p3correo PRIMARY KEY ( cve_p3persona_p3correo );

CREATE TABLE p3persona_p3telefono (
    cve_p3persona_p3telefono   NUMBER NOT NULL,
    cve_p3persona              NUMBER NOT NULL,
    cve_p3telefono             NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3persona_p3telefono ON
    p3persona_p3telefono (
        cve_p3persona_p3telefono
    ASC )TABLESPACE INDX;

ALTER TABLE p3persona_p3telefono ADD CONSTRAINT pk_p3persona_p3telefono PRIMARY KEY ( cve_p3persona_p3telefono );

CREATE TABLE p3reclamacion_siniestro (
    cve_p3reclamacion_siniestro   NUMBER NOT NULL,
    fecha                         DATE NOT NULL,
    descripcion                   VARCHAR2(50) NOT NULL,
    monto                         NUMBER NOT NULL,
    cve_p3seguro                  NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3reclamacion_siniestro ON
    p3reclamacion_siniestro (
        cve_p3reclamacion_siniestro
    ASC )TABLESPACE INDX;

ALTER TABLE p3reclamacion_siniestro ADD CONSTRAINT pk_p3reclamacion_siniestro PRIMARY KEY ( cve_p3reclamacion_siniestro );

CREATE TABLE p3seguro (
    cve_p3seguro    NUMBER NOT NULL,
    total           NUMBER NOT NULL,
    prima           NUMBER NOT NULL,
    deducible       NUMBER NOT NULL,
    cve_p3cliente   NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3seguro ON
    p3seguro (
        cve_p3seguro
    ASC )TABLESPACE INDX;

ALTER TABLE p3seguro ADD CONSTRAINT pk_p3seguro PRIMARY KEY ( cve_p3seguro );

CREATE TABLE p3telefono (
    cve_p3telefono   NUMBER NOT NULL,
    lada             VARCHAR2(5) NOT NULL,
    numero           VARCHAR2(20) NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3telefono ON
    p3telefono (
        cve_p3telefono
    ASC )TABLESPACE INDX;

ALTER TABLE p3telefono ADD CONSTRAINT pk_p3telefono PRIMARY KEY ( cve_p3telefono );

CREATE TABLE p3tipo_seguro (
    cve_p3tipo_seguro   NUMBER NOT NULL,
    nombre              VARCHAR2(50) NOT NULL,
    cve_p3seguro        NUMBER NOT NULL
)TABLESPACE DATOS;

CREATE INDEX pk_p3tipo_seguro ON
    p3tipo_seguro (
        cve_p3tipo_seguro
    ASC )TABLESPACE INDX;

ALTER TABLE p3tipo_seguro ADD CONSTRAINT pk_p3tipo_seguro PRIMARY KEY ( cve_p3tipo_seguro );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3aseguradora_p3agente
    ADD CONSTRAINT fk_p3agente_p3aseguradora_p3agente FOREIGN KEY ( cve_p3agente )
        REFERENCES p3agente ( cve_p3agente );

ALTER TABLE p3cliente_p3agente
    ADD CONSTRAINT fk_p3agente_p3cliente_p3agente FOREIGN KEY ( cve_p3agente )
        REFERENCES p3agente ( cve_p3agente );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3aseguradora_p3agente
    ADD CONSTRAINT fk_p3aseguradora_p3aseguradora_p3agente FOREIGN KEY ( cve_p3aseguradora )
        REFERENCES p3aseguradora ( cve_p3aseguradora );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3aseguradora_p3cliente
    ADD CONSTRAINT fk_p3aseguradora_p3aseguradora_p3cliente FOREIGN KEY ( cve_p3aseguradora )
        REFERENCES p3aseguradora ( cve_p3aseguradora );

ALTER TABLE p3contacto
    ADD CONSTRAINT fk_p3aseguradora_p3contacto FOREIGN KEY ( cve_p3aseguradora )
        REFERENCES p3aseguradora ( cve_p3aseguradora );

ALTER TABLE p3aseguradora
    ADD CONSTRAINT fk_p3branding_p3aseguradora FOREIGN KEY ( cve_p3branding )
        REFERENCES p3branding ( cve_p3branding );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3aseguradora_p3cliente
    ADD CONSTRAINT fk_p3cliente_p3aseguradora_p3cliente FOREIGN KEY ( cve_p3cliente )
        REFERENCES p3cliente ( cve_p3cliente );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3cliente_p3agente
    ADD CONSTRAINT fk_p3cliente_p3cliente_p3agente FOREIGN KEY ( cve_p3cliente )
        REFERENCES p3cliente ( cve_p3cliente );

ALTER TABLE p3pago
    ADD CONSTRAINT fk_p3cliente_p3pago FOREIGN KEY ( cve_p3cliente )
        REFERENCES p3cliente ( cve_p3cliente );

ALTER TABLE p3seguro
    ADD CONSTRAINT fk_p3cliente_p3seguro FOREIGN KEY ( cve_p3cliente )
        REFERENCES p3cliente ( cve_p3cliente );

ALTER TABLE p3direccion
    ADD CONSTRAINT fk_p3colonia_p3direccion FOREIGN KEY ( cve_p3colonia )
        REFERENCES p3colonia ( cve_p3colonia );

ALTER TABLE p3persona_p3correo
    ADD CONSTRAINT fk_p3correo_p3persona_p3correo FOREIGN KEY ( cve_p3correo )
        REFERENCES p3correo ( cve_p3correo );

ALTER TABLE p3colonia
    ADD CONSTRAINT fk_p3delegacion_p3colonia FOREIGN KEY ( cve_p3delegacion )
        REFERENCES p3delegacion ( cve_p3delegacion );

ALTER TABLE p3aseguradora
    ADD CONSTRAINT fk_p3direccion_p3aseguradora FOREIGN KEY ( cve_p3direccion )
        REFERENCES p3direccion ( cve_p3direccion );

ALTER TABLE p3persona
    ADD CONSTRAINT fk_p3direccion_p3persona FOREIGN KEY ( cve_p3direccion )
        REFERENCES p3direccion ( cve_p3direccion );

ALTER TABLE p3delegacion
    ADD CONSTRAINT fk_p3estado_p3delegacion FOREIGN KEY ( cve_p3estado )
        REFERENCES p3estado ( cve_p3estado );

ALTER TABLE p3agente
    ADD CONSTRAINT fk_p3horariotrabajo_p3agente FOREIGN KEY ( cve_p3horariotrabajo )
        REFERENCES p3horariotrabajo ( cve_p3horariotrabajo );

ALTER TABLE p3aseguradora
    ADD CONSTRAINT fk_p3pagina_web_p3aseguradora FOREIGN KEY ( cve_p3pagina_web )
        REFERENCES p3pagina_web ( cve_p3pagina_web );

ALTER TABLE p3estado
    ADD CONSTRAINT fk_p3pais_p3estado FOREIGN KEY ( cve_p3pais )
        REFERENCES p3pais ( cve_p3pais );

ALTER TABLE p3agente
    ADD CONSTRAINT fk_p3persona_p3agente FOREIGN KEY ( cve_p3persona )
        REFERENCES p3persona ( cve_p3persona );

ALTER TABLE "P3 Beneficiario"
    ADD CONSTRAINT "FK_P3Persona_P3 Beneficiario" FOREIGN KEY ( cve_p3persona )
        REFERENCES p3persona ( cve_p3persona );

ALTER TABLE p3cliente
    ADD CONSTRAINT fk_p3persona_p3cliente FOREIGN KEY ( cve_p3persona )
        REFERENCES p3persona ( cve_p3persona );

ALTER TABLE p3contacto
    ADD CONSTRAINT fk_p3persona_p3contacto FOREIGN KEY ( cve_p3persona )
        REFERENCES p3persona ( cve_p3persona );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3persona_p3correo
    ADD CONSTRAINT fk_p3persona_p3persona_p3correo FOREIGN KEY ( cve_p3persona )
        REFERENCES p3persona ( cve_p3persona );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3persona_p3telefono
    ADD CONSTRAINT fk_p3persona_p3persona_p3telefono FOREIGN KEY ( cve_p3persona )
        REFERENCES p3persona ( cve_p3persona );

ALTER TABLE p3pago
    ADD CONSTRAINT fk_p3seguro_p3pago FOREIGN KEY ( cve_p3seguro )
        REFERENCES p3seguro ( cve_p3seguro )
            ON DELETE CASCADE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3reclamacion_siniestro
    ADD CONSTRAINT fk_p3seguro_p3reclamacion_siniestro FOREIGN KEY ( cve_p3seguro )
        REFERENCES p3seguro ( cve_p3seguro )
            ON DELETE CASCADE;

ALTER TABLE p3tipo_seguro
    ADD CONSTRAINT fk_p3seguro_p3tipo_seguro FOREIGN KEY ( cve_p3seguro )
        REFERENCES p3seguro ( cve_p3seguro )
            ON DELETE CASCADE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE p3persona_p3telefono
    ADD CONSTRAINT fk_p3telefono_p3persona_p3telefono FOREIGN KEY ( cve_p3telefono )
        REFERENCES p3telefono ( cve_p3telefono );

ALTER TABLE p3cliente
    ADD CONSTRAINT fk_p3tipo_seguro_p3cliente FOREIGN KEY ( cve_p3tipo_seguro )
        REFERENCES p3tipo_seguro ( cve_p3tipo_seguro );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            25
-- CREATE INDEX                            25
-- ALTER TABLE                             55
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
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   9
-- WARNINGS                                 0


/*Instrucciones:
Se solicita al alumno modelas los principales eventos que suceden en una
aseguradora.
Relaciones:
•	Una Aseguradora tiene muchos clientes.
•	Un cliente hace negocio con muchas aseguradoras.
•	Una Aseguradora tiene muchos agentes.
•	Un agente trabaja para varias aseguradoras.
•	Un Cliente tiene muchos seguros.
•	Un cliente tiene un agente en cada aseguradora.
•	Un agente tiene muchos clientes.
•	Un cliente paga un seguro en muchas mensualidades.
•	1 tipo de Seguro es tomado por muchos clientes.
•	1 seguro tiene muchos beneficiarios.
•	1 seguro tiene muchas reclamaciones (Cuando el cliente exige el pago del seguro)
Campos mínimos por tabla:
Aseguradora
•	Nombre del contacto.
•	Dirección.
Cliente.
•	Nombre
•	Dirección
•	Email
•	Fecha de nacimiento
•	Teléfonos
Beneficiario
•	Nombre
•	Dirección
•	Email
•	Fecha de nacimiento
•	Teléfonos

Agente
•	Nombre
•	Dirección
•	Email
•	Teléfonos
Seguro
•	Tipo de Seguro (GM –Gastos Médicos, A-Autos, V-Vida,D-Dotal)
•	Total, del Seguro
•	Prima del Seguro
•	Deducible
Pago
•	Fecha Pago
•	Monto
•	Saldo deudor
Reclamación o siniestro
•	Fecha
•	Descripción del siniestro
•	Monto del siniestro
*/
