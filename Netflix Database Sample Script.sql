DROP TABLE pf_colonia CASCADE CONSTRAINTS;

DROP TABLE pf_contrato CASCADE CONSTRAINTS;

DROP TABLE pf_cuenta CASCADE CONSTRAINTS;

DROP TABLE pf_delegacion CASCADE CONSTRAINTS;

DROP TABLE pf_direccion CASCADE CONSTRAINTS;

DROP TABLE pf_email CASCADE CONSTRAINTS;

DROP TABLE pf_empresa CASCADE CONSTRAINTS;

DROP TABLE pf_encargado CASCADE CONSTRAINTS;

DROP TABLE pf_episodio CASCADE CONSTRAINTS;

DROP TABLE pf_estado CASCADE CONSTRAINTS;

DROP TABLE pf_genero CASCADE CONSTRAINTS;

DROP TABLE pf_idioma CASCADE CONSTRAINTS;

DROP TABLE pf_imagen CASCADE CONSTRAINTS;

DROP TABLE pf_informacion CASCADE CONSTRAINTS;

DROP TABLE pf_pago CASCADE CONSTRAINTS;

DROP TABLE pf_pais CASCADE CONSTRAINTS;

DROP TABLE pf_pelicula CASCADE CONSTRAINTS;

DROP TABLE pf_perfil CASCADE CONSTRAINTS;

DROP TABLE pf_persona CASCADE CONSTRAINTS;

DROP TABLE pf_plan CASCADE CONSTRAINTS;

DROP TABLE pf_preferencia CASCADE CONSTRAINTS;

DROP TABLE pf_preferencia_perfil CASCADE CONSTRAINTS;

DROP TABLE pf_productora CASCADE CONSTRAINTS;

DROP TABLE pf_productora_pelicula CASCADE CONSTRAINTS;

DROP TABLE pf_productora_serie CASCADE CONSTRAINTS;

DROP TABLE pf_region CASCADE CONSTRAINTS;

DROP TABLE pf_serie CASCADE CONSTRAINTS;

DROP TABLE pf_telefono CASCADE CONSTRAINTS;

DROP TABLE pf_temporada CASCADE CONSTRAINTS;

DROP TABLE pf_tipo_perfil CASCADE CONSTRAINTS;

DROP TABLE pf_usuario CASCADE CONSTRAINTS;

--TABLAS

CREATE TABLE pf_colonia (
    cve_colonia      INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    cve_delegacion   INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX colonia__indx ON
    pf_colonia (
        cve_colonia
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_colonia ADD CONSTRAINT colonia_ck_1 CHECK ( cve_colonia > 0 );

ALTER TABLE pf_colonia ADD CONSTRAINT colonia_ck_2 CHECK ( cve_delegacion > 0 );

ALTER TABLE pf_colonia ADD CONSTRAINT pk_colonia_1 PRIMARY KEY ( cve_colonia );

CREATE TABLE pf_contrato (
    cve_contrato     INTEGER NOT NULL,
    fechacontrato    DATE NOT NULL,
    cve_empresa      INTEGER NOT NULL,
    cve_productora   INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX contrato__indx ON
    pf_contrato (
        cve_contrato
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX contrato__indxv1 ON
    pf_contrato (
        fechacontrato
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_contrato ADD CONSTRAINT contrato_ck_1 CHECK ( cve_contrato > 0 );

ALTER TABLE pf_contrato ADD CONSTRAINT contrato_ck_2 CHECK ( cve_empresa > 0 );

ALTER TABLE pf_contrato ADD CONSTRAINT contrato_ck_3 CHECK ( cve_productora > 0 );

ALTER TABLE pf_contrato ADD CONSTRAINT pk_contrato PRIMARY KEY ( cve_contrato );

CREATE TABLE pf_cuenta (
    cve_cuenta    INTEGER NOT NULL,
    contraseña    VARCHAR2(50 CHAR) NOT NULL,
    cve_usuario   INTEGER NOT NULL,
    cve_region    INTEGER NOT NULL,
    cve_plan      INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX cuenta__indx ON
    pf_cuenta (
        cve_cuenta
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_cuenta ADD CONSTRAINT cuenta_ck_1 CHECK ( cve_cuenta > 0 );

ALTER TABLE pf_cuenta ADD CONSTRAINT cuenta_ck_2 CHECK ( cve_usuario > 0 );

ALTER TABLE pf_cuenta ADD CONSTRAINT cuenta_ck_3 CHECK ( cve_region > 0 );

ALTER TABLE pf_cuenta ADD CONSTRAINT cuenta_ck_4 CHECK ( cve_plan > 0 );

ALTER TABLE pf_cuenta ADD CONSTRAINT pk_cuenta PRIMARY KEY ( cve_cuenta );

CREATE TABLE pf_delegacion (
    cve_delegacion   INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    cve_estado       INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX delegacion__indx ON
    pf_delegacion (
        cve_delegacion
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_delegacion ADD CONSTRAINT delegacion_ck_1 CHECK ( cve_delegacion > 0 );

ALTER TABLE pf_delegacion ADD CONSTRAINT delegacion_ck_2 CHECK ( cve_estado > 0 );

ALTER TABLE pf_delegacion ADD CONSTRAINT pk_delegacion_1 PRIMARY KEY ( cve_delegacion );

CREATE TABLE pf_direccion (
    cve_direccion   INTEGER NOT NULL,
    calle           VARCHAR2(50 CHAR) NOT NULL,
    cp              INTEGER NOT NULL,
    numero          INTEGER NOT NULL,
    cve_colonia     INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX direccion__indx ON
    pf_direccion (
        cve_direccion
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_direccion ADD CONSTRAINT direccion_ck_1 CHECK ( cve_direccion > 0 );

ALTER TABLE pf_direccion ADD CONSTRAINT direccion_ck_2 CHECK ( cp > 0 );

ALTER TABLE pf_direccion ADD CONSTRAINT direccion_ck_3 CHECK ( numero > 0 );

ALTER TABLE pf_direccion ADD CONSTRAINT direccion_ck_4 CHECK ( cve_colonia > 0 );

ALTER TABLE pf_direccion ADD CONSTRAINT pk_direccion PRIMARY KEY ( cve_direccion );

CREATE TABLE pf_email (
    cve_email     INTEGER NOT NULL,
    descripcion   VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX email__indx ON
    pf_email (
        cve_email
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_email ADD CONSTRAINT pf_email_ck_1 CHECK ( cve_email > 0 );

ALTER TABLE pf_email ADD CONSTRAINT pk_email_1 PRIMARY KEY ( cve_email );

CREATE TABLE pf_empresa (
    cve_empresa     INTEGER NOT NULL,
    descripcion     VARCHAR2(50 CHAR) NOT NULL,
    cve_direccion   INTEGER NOT NULL,
    cve_email       INTEGER NOT NULL,
    cve_telefono    INTEGER NOT NULL,
    cve_encargado   INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX empresa__indx ON
    pf_empresa (
        cve_empresa
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_empresa ADD CONSTRAINT empresa_ck_1 CHECK ( cve_empresa > 0 );

ALTER TABLE pf_empresa ADD CONSTRAINT empresa_ck_2 CHECK ( cve_direccion > 0 );

ALTER TABLE pf_empresa ADD CONSTRAINT empresa_ck_3 CHECK ( cve_telefono > 0 );

ALTER TABLE pf_empresa ADD CONSTRAINT empresa_ck_4 CHECK ( cve_encargado > 0 );

ALTER TABLE pf_empresa ADD CONSTRAINT pf_empresa_ck_5 CHECK ( cve_email > 0 );

ALTER TABLE pf_empresa ADD CONSTRAINT pk_empresa_1 PRIMARY KEY ( cve_empresa );

CREATE TABLE pf_encargado (
    cve_encargado   INTEGER NOT NULL,
    cve_persona     INTEGER NOT NULL,
    cve_telefono    INTEGER NOT NULL,
    cve_email       INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX encargado__indx ON
    pf_encargado (
        cve_encargado
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_encargado ADD CONSTRAINT encargado_ck_1 CHECK ( cve_encargado > 0 );

ALTER TABLE pf_encargado ADD CONSTRAINT encargado_ck_2 CHECK ( cve_persona > 0 );

ALTER TABLE pf_encargado ADD CONSTRAINT encargado_ck_3 CHECK ( cve_telefono > 0 );

ALTER TABLE pf_encargado ADD CONSTRAINT encargado_ck_4 CHECK ( cve_email > 0 );

ALTER TABLE pf_encargado ADD CONSTRAINT pk_encargado PRIMARY KEY ( cve_encargado );

CREATE TABLE pf_episodio (
    cve_episodio      INTEGER NOT NULL,
    cve_temporada     INTEGER NOT NULL,
    cve_imagen        INTEGER NOT NULL,
    cve_informacion   INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX episodio__indx ON
    pf_episodio (
        cve_episodio
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_episodio ADD CONSTRAINT episodio_ck_1 CHECK ( cve_episodio > 0 );

ALTER TABLE pf_episodio ADD CONSTRAINT episodio_ck_2 CHECK ( cve_temporada > 0 );

ALTER TABLE pf_episodio ADD CONSTRAINT episodio_ck_3 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_episodio ADD CONSTRAINT episodio_ck_4 CHECK ( cve_informacion > 0 );

ALTER TABLE pf_episodio ADD CONSTRAINT pk_episodio PRIMARY KEY ( cve_episodio );

CREATE TABLE pf_estado (
    cve_estado    INTEGER NOT NULL,
    descripcion   VARCHAR2(50 CHAR) NOT NULL,
    cve_pais      INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX estado__indx ON
    pf_estado (
        cve_estado
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_estado ADD CONSTRAINT estado_ck_1 CHECK ( cve_estado > 0 );

ALTER TABLE pf_estado ADD CONSTRAINT estado_ck_2 CHECK ( cve_pais > 0 );

ALTER TABLE pf_estado ADD CONSTRAINT pk_estado_1 PRIMARY KEY ( cve_estado );

CREATE TABLE pf_genero (
    cve_genero    INTEGER NOT NULL,
    descripcion   VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX genero__indx ON
    pf_genero (
        cve_genero
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_genero ADD CONSTRAINT genero_ck_1 CHECK ( cve_genero > 0 );

ALTER TABLE pf_genero ADD CONSTRAINT pk_genero PRIMARY KEY ( cve_genero );

CREATE TABLE pf_idioma (
    cve_idioma    INTEGER NOT NULL,
    descripcion   VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX idioma__indx ON
    pf_idioma (
        cve_idioma
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_idioma ADD CONSTRAINT idioma_ck_1 CHECK ( cve_idioma > 0 );

ALTER TABLE pf_idioma ADD CONSTRAINT pk_idioma PRIMARY KEY ( cve_idioma );

ALTER TABLE pf_imagen DROP COLUMN descripcion;

CREATE TABLE pf_imagen (
    cve_imagen    INTEGER NOT NULL,
    descripcion   BLOB NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX imagen__indx ON
    pf_imagen (
        cve_imagen
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_imagen ADD CONSTRAINT imagen_ck_1 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_imagen ADD CONSTRAINT pk_imagen PRIMARY KEY ( cve_imagen );

CREATE TABLE pf_informacion (
    cve_informacion   INTEGER NOT NULL,
    nombre            VARCHAR2(50 CHAR) NOT NULL,
    fechasalida       DATE NOT NULL,
    rating            NUMBER NOT NULL,
    duracion          NUMBER NOT NULL,
    cve_genero        INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX informacion__indx ON
    pf_informacion (
        cve_informacion
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX informacion__indxv1 ON
    pf_informacion (
        fechasalida
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_informacion ADD CONSTRAINT informacion_ck_1 CHECK ( cve_informacion > 0 );

ALTER TABLE pf_informacion ADD CONSTRAINT informacion_ck_2 CHECK ( rating > 0 );

ALTER TABLE pf_informacion ADD CONSTRAINT informacion_ck_3 CHECK ( duracion > 0 );

ALTER TABLE pf_informacion ADD CONSTRAINT informacion_ck_4 CHECK ( cve_genero > 0 );

ALTER TABLE pf_informacion ADD CONSTRAINT pk_informacion PRIMARY KEY ( cve_informacion );

CREATE TABLE pf_pago (
    cve_pago      INTEGER NOT NULL,
    fechapago     DATE NOT NULL,
    monto         NUMBER NOT NULL,
    cve_plan      INTEGER NOT NULL,
    cve_usuario   INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pago__indx ON
    pf_pago (
        cve_pago
    ASC )
        TABLESPACE indx LOGGING;

CREATE INDEX pago__indxv1 ON
    pf_pago (
        fechapago
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_pago ADD CONSTRAINT pf_pago_ck_1 CHECK ( cve_pago > 0 );

ALTER TABLE pf_pago ADD CONSTRAINT pf_pago_ck_2 CHECK ( monto > 0 );

ALTER TABLE pf_pago ADD CONSTRAINT pf_pago_ck_3 CHECK ( cve_plan > 0 );

ALTER TABLE pf_pago ADD CONSTRAINT pf_pago_ck_4 CHECK ( cve_usuario > 0 );

ALTER TABLE pf_pago ADD CONSTRAINT pk_pago_1 PRIMARY KEY ( cve_pago );

CREATE TABLE pf_pais (
    cve_pais      INTEGER NOT NULL,
    descripcion   VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pais__indx ON
    pf_pais (
        cve_pais
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_pais ADD CONSTRAINT pais_ck_1 CHECK ( cve_pais > 0 );

ALTER TABLE pf_pais ADD CONSTRAINT pk_pais_1 PRIMARY KEY ( cve_pais );

CREATE TABLE pf_pelicula (
    cve_pelicula      INTEGER NOT NULL,
    cve_informacion   INTEGER NOT NULL,
    cve_imagen        INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX pelicula__indx ON
    pf_pelicula (
        cve_pelicula
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_pelicula ADD CONSTRAINT pelicula_ck_1 CHECK ( cve_pelicula > 0 );

ALTER TABLE pf_pelicula ADD CONSTRAINT pelicula_ck_2 CHECK ( cve_informacion > 0 );

ALTER TABLE pf_pelicula ADD CONSTRAINT pelicula_ck_3 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_pelicula ADD CONSTRAINT pk_pelicula PRIMARY KEY ( cve_pelicula );

CREATE TABLE pf_perfil (
    cve_perfil        INTEGER NOT NULL,
    descripcion       VARCHAR2(50 CHAR) NOT NULL,
    cve_tipo_perfil   INTEGER NOT NULL,
    cve_imagen        INTEGER NOT NULL,
    cve_cuenta        INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX perfil__indx ON
    pf_perfil (
        cve_perfil
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_perfil ADD CONSTRAINT pf_perfil_ck_1 CHECK ( cve_perfil > 0 );

ALTER TABLE pf_perfil ADD CONSTRAINT pf_perfil_ck_2 CHECK ( cve_tipo_perfil > 0 );

ALTER TABLE pf_perfil ADD CONSTRAINT pf_perfil_ck_3 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_perfil ADD CONSTRAINT pf_perfil_ck_4 CHECK ( cve_cuenta > 0 );

ALTER TABLE pf_perfil ADD CONSTRAINT pk_perfil PRIMARY KEY ( cve_perfil );

CREATE TABLE pf_persona (
    cve_persona       INTEGER NOT NULL,
    nombre            VARCHAR2(50 CHAR) NOT NULL,
    apellidopaterno   VARCHAR2(50 CHAR) NOT NULL,
    apellidomaterno   VARCHAR2(50 CHAR) NOT NULL,
    edad              INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX persona__indx ON
    pf_persona (
        cve_persona
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_persona ADD CONSTRAINT pf_persona_ck_1 CHECK ( cve_persona > 0 );

ALTER TABLE pf_persona ADD CONSTRAINT pf_persona_ck_2 CHECK ( edad > 0 );

ALTER TABLE pf_persona ADD CONSTRAINT pk_persona_1 PRIMARY KEY ( cve_persona );

CREATE TABLE pf_plan (
    cve_plan      INTEGER NOT NULL,
    descripcion   VARCHAR2(50 CHAR) NOT NULL,
    calidad       VARCHAR2(50 CHAR) NOT NULL,
    cve_empresa   INTEGER NOT NULL,
    costo         NUMBER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX plan__indx ON
    pf_plan (
        cve_plan
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_plan ADD CONSTRAINT pf_plan_ck_1 CHECK ( cve_plan > 0 );

ALTER TABLE pf_plan ADD CONSTRAINT pf_plan_ck_2 CHECK ( cve_empresa > 0 );

ALTER TABLE pf_plan ADD CONSTRAINT pf_plan_ck_3 CHECK ( costo > 0 );

ALTER TABLE pf_plan ADD CONSTRAINT pk_plan PRIMARY KEY ( cve_plan );

CREATE TABLE pf_preferencia (
    cve_preferencia   INTEGER NOT NULL,
    descripcion       VARCHAR2(50 CHAR) NOT NULL,
    cve_genero        INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX preferencia__indx ON
    pf_preferencia (
        cve_preferencia
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_preferencia ADD CONSTRAINT preferencia_ck_1 CHECK ( cve_preferencia > 0 );

ALTER TABLE pf_preferencia ADD CONSTRAINT preferencia_ck_2 CHECK ( cve_genero > 0 );

ALTER TABLE pf_preferencia ADD CONSTRAINT pk_preferencia PRIMARY KEY ( cve_preferencia );

CREATE TABLE pf_preferencia_perfil (
    cve_preferencia_perfil   INTEGER NOT NULL,
    cve_perfil               INTEGER NOT NULL,
    cve_preferencia          INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX preferencia_perfil__indx ON
    pf_preferencia_perfil (
        cve_preferencia_perfil
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_preferencia_perfil ADD CONSTRAINT preferencia_perfil_ck_1 CHECK ( cve_preferencia_perfil > 0 );

ALTER TABLE pf_preferencia_perfil ADD CONSTRAINT preferencia_perfil_ck_2 CHECK ( cve_perfil > 0 );

ALTER TABLE pf_preferencia_perfil ADD CONSTRAINT preferencia_perfil_ck_3 CHECK ( cve_preferencia > 0 );

ALTER TABLE pf_preferencia_perfil ADD CONSTRAINT pk_preferencia_perfil PRIMARY KEY ( cve_preferencia_perfil );

CREATE TABLE pf_productora (
    cve_productora   INTEGER NOT NULL,
    descripcion      VARCHAR2(50 CHAR) NOT NULL,
    cve_direccion    INTEGER NOT NULL,
    cve_empresa      INTEGER
)
TABLESPACE datos LOGGING;

CREATE INDEX productora__indx ON
    pf_productora (
        cve_productora
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_productora ADD CONSTRAINT productora_ck_1 CHECK ( cve_productora > 0 );

ALTER TABLE pf_productora ADD CONSTRAINT productora_ck_2 CHECK ( cve_direccion > 0 );

ALTER TABLE pf_productora ADD CONSTRAINT productora_ck_3 CHECK ( cve_empresa > 0 );

ALTER TABLE pf_productora ADD CONSTRAINT pk_productora PRIMARY KEY ( cve_productora );

CREATE TABLE pf_productora_pelicula (
    cve_productora_pelicula   INTEGER NOT NULL,
    cve_productora            INTEGER NOT NULL,
    cve_pelicula              INTEGER NOT NULL,
    vigencia                  DATE NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX productora_pelicula__indx ON
    pf_productora_pelicula (
        cve_productora_pelicula
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_productora_pelicula ADD CONSTRAINT productora_pelicula_ck_1 CHECK ( cve_productora_pelicula > 0 );

ALTER TABLE pf_productora_pelicula ADD CONSTRAINT productora_pelicula_ck_2 CHECK ( cve_productora > 0 );

ALTER TABLE pf_productora_pelicula ADD CONSTRAINT productora_pelicula_ck_3 CHECK ( cve_pelicula > 0 );

ALTER TABLE pf_productora_pelicula ADD CONSTRAINT pk_productora_pelicula PRIMARY KEY ( cve_productora_pelicula );

CREATE TABLE pf_productora_serie (
    cve_productora_serie   INTEGER NOT NULL,
    cve_productora         INTEGER NOT NULL,
    cve_serie              INTEGER NOT NULL,
    vigencia               DATE NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX productora_serie__indx ON
    pf_productora_serie (
        cve_productora_serie
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_productora_serie ADD CONSTRAINT productora_serie_ck_1 CHECK ( cve_productora_serie > 0 );

ALTER TABLE pf_productora_serie ADD CONSTRAINT productora_serie_ck_2 CHECK ( cve_productora > 0 );

ALTER TABLE pf_productora_serie ADD CONSTRAINT productora_serie_ck_3 CHECK ( cve_serie > 0 );

ALTER TABLE pf_productora_serie ADD CONSTRAINT pk_productora_serie PRIMARY KEY ( cve_productora_serie );

CREATE TABLE pf_region (
    cve_region   INTEGER NOT NULL,
    cve_pais     INTEGER NOT NULL,
    cve_idioma   INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX region__indx ON
    pf_region (
        cve_region
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_region ADD CONSTRAINT region_ck_1 CHECK ( cve_region > 0 );

ALTER TABLE pf_region ADD CONSTRAINT region_ck_2 CHECK ( cve_pais > 0 );

ALTER TABLE pf_region ADD CONSTRAINT region_ck_3 CHECK ( cve_idioma > 0 );

ALTER TABLE pf_region ADD CONSTRAINT pk_region PRIMARY KEY ( cve_region );

CREATE TABLE pf_serie (
    cve_serie         INTEGER NOT NULL,
    cve_informacion   INTEGER NOT NULL,
    cve_imagen        INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX serie__indx ON
    pf_serie (
        cve_serie
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_serie ADD CONSTRAINT serie_ck_1 CHECK ( cve_serie > 0 );

ALTER TABLE pf_serie ADD CONSTRAINT serie_ck_2 CHECK ( cve_informacion > 0 );

ALTER TABLE pf_serie ADD CONSTRAINT serie_ck_3 CHECK ( cve_imagen > 0 );

ALTER TABLE pf_serie ADD CONSTRAINT pk_serie PRIMARY KEY ( cve_serie );

CREATE TABLE pf_telefono (
    cve_telefono   INTEGER NOT NULL,
    descripcion    INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX telefono__indx ON
    pf_telefono (
        cve_telefono
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_telefono ADD CONSTRAINT telefono_ck_1 CHECK ( cve_telefono > 0 );

ALTER TABLE pf_telefono ADD CONSTRAINT telefono_ck_2 CHECK ( descripcion > 0 );

ALTER TABLE pf_telefono ADD CONSTRAINT pk_telefono_1 PRIMARY KEY ( cve_telefono );

CREATE TABLE pf_temporada (
    cve_temporada   INTEGER NOT NULL,
    descripcion     VARCHAR2(50 CHAR) NOT NULL,
    episodios       INTEGER NOT NULL,
    cve_serie       INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX temporada__indx ON
    pf_temporada (
        cve_temporada
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_temporada ADD CONSTRAINT temporada_ck_1 CHECK ( cve_temporada > 0 );

ALTER TABLE pf_temporada ADD CONSTRAINT temporada_ck_2 CHECK ( episodios > 0 );

ALTER TABLE pf_temporada ADD CONSTRAINT temporada_ck_3 CHECK ( cve_serie > 0 );

ALTER TABLE pf_temporada ADD CONSTRAINT pk_temporada PRIMARY KEY ( cve_temporada );

CREATE TABLE pf_tipo_perfil (
    cve_tipo_perfil   INTEGER NOT NULL,
    descripcion       VARCHAR2(50 CHAR) NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX tipo_perfil__indx ON
    pf_tipo_perfil (
        cve_tipo_perfil
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_tipo_perfil ADD CONSTRAINT tipo_perfil_ck_1 CHECK ( cve_tipo_perfil > 0 );

ALTER TABLE pf_tipo_perfil ADD CONSTRAINT pk_tipo_perfil PRIMARY KEY ( cve_tipo_perfil );

CREATE TABLE pf_usuario (
    cve_usuario    INTEGER NOT NULL,
    cve_persona    INTEGER NOT NULL,
    cve_email      INTEGER NOT NULL,
    cve_telefono   INTEGER NOT NULL
)
TABLESPACE datos LOGGING;

CREATE INDEX usuario__indx ON
    pf_usuario (
        cve_usuario
    ASC )
        TABLESPACE indx LOGGING;

ALTER TABLE pf_usuario ADD CONSTRAINT pf_usuario_ck_1 CHECK ( cve_usuario > 0 );

ALTER TABLE pf_usuario ADD CONSTRAINT pf_usuario_ck_2 CHECK ( cve_persona > 0 );

ALTER TABLE pf_usuario ADD CONSTRAINT pf_usuario_ck_3 CHECK ( cve_email > 0 );

ALTER TABLE pf_usuario ADD CONSTRAINT pf_usuario_ck_4 CHECK ( cve_telefono > 0 );

ALTER TABLE pf_usuario ADD CONSTRAINT pk_usuario PRIMARY KEY ( cve_usuario );

ALTER TABLE pf_direccion
    ADD CONSTRAINT fk_colonia_direccion_1 FOREIGN KEY ( cve_colonia )
        REFERENCES pf_colonia ( cve_colonia )
    NOT DEFERRABLE;

ALTER TABLE pf_perfil
    ADD CONSTRAINT fk_cuenta_perfil FOREIGN KEY ( cve_cuenta )
        REFERENCES pf_cuenta ( cve_cuenta )
    NOT DEFERRABLE;

ALTER TABLE pf_colonia
    ADD CONSTRAINT fk_delegacion_colonia_1 FOREIGN KEY ( cve_delegacion )
        REFERENCES pf_delegacion ( cve_delegacion )
    NOT DEFERRABLE;

ALTER TABLE pf_empresa
    ADD CONSTRAINT fk_direccion_empresa FOREIGN KEY ( cve_direccion )
        REFERENCES pf_direccion ( cve_direccion )
    NOT DEFERRABLE;

ALTER TABLE pf_productora
    ADD CONSTRAINT fk_direccion_productora FOREIGN KEY ( cve_direccion )
        REFERENCES pf_direccion ( cve_direccion )
    NOT DEFERRABLE;

ALTER TABLE pf_empresa
    ADD CONSTRAINT fk_email_empresa FOREIGN KEY ( cve_email )
        REFERENCES pf_email ( cve_email )
    NOT DEFERRABLE;

ALTER TABLE pf_encargado
    ADD CONSTRAINT fk_email_encargado FOREIGN KEY ( cve_email )
        REFERENCES pf_email ( cve_email )
    NOT DEFERRABLE;

ALTER TABLE pf_usuario
    ADD CONSTRAINT fk_email_usuario FOREIGN KEY ( cve_email )
        REFERENCES pf_email ( cve_email )
    NOT DEFERRABLE;

ALTER TABLE pf_contrato
    ADD CONSTRAINT fk_empresa_contrato FOREIGN KEY ( cve_empresa )
        REFERENCES pf_empresa ( cve_empresa )
    NOT DEFERRABLE;

ALTER TABLE pf_plan
    ADD CONSTRAINT fk_empresa_plan FOREIGN KEY ( cve_empresa )
        REFERENCES pf_empresa ( cve_empresa )
    NOT DEFERRABLE;

ALTER TABLE pf_productora
    ADD CONSTRAINT fk_empresa_productora FOREIGN KEY ( cve_empresa )
        REFERENCES pf_empresa ( cve_empresa )
    NOT DEFERRABLE;

ALTER TABLE pf_empresa
    ADD CONSTRAINT fk_encargado_empresa FOREIGN KEY ( cve_encargado )
        REFERENCES pf_encargado ( cve_encargado )
    NOT DEFERRABLE;

ALTER TABLE pf_delegacion
    ADD CONSTRAINT fk_estado_delegacion_1 FOREIGN KEY ( cve_estado )
        REFERENCES pf_estado ( cve_estado )
    NOT DEFERRABLE;

ALTER TABLE pf_informacion
    ADD CONSTRAINT fk_genero_informacion FOREIGN KEY ( cve_genero )
        REFERENCES pf_genero ( cve_genero )
    NOT DEFERRABLE;

ALTER TABLE pf_preferencia
    ADD CONSTRAINT fk_genero_preferencia FOREIGN KEY ( cve_genero )
        REFERENCES pf_genero ( cve_genero )
    NOT DEFERRABLE;

ALTER TABLE pf_region
    ADD CONSTRAINT fk_idioma_region FOREIGN KEY ( cve_idioma )
        REFERENCES pf_idioma ( cve_idioma )
    NOT DEFERRABLE;

ALTER TABLE pf_episodio
    ADD CONSTRAINT fk_imagen_episodio FOREIGN KEY ( cve_imagen )
        REFERENCES pf_imagen ( cve_imagen )
    NOT DEFERRABLE;

ALTER TABLE pf_pelicula
    ADD CONSTRAINT fk_imagen_pelicula FOREIGN KEY ( cve_imagen )
        REFERENCES pf_imagen ( cve_imagen )
    NOT DEFERRABLE;

ALTER TABLE pf_perfil
    ADD CONSTRAINT fk_imagen_perfil FOREIGN KEY ( cve_imagen )
        REFERENCES pf_imagen ( cve_imagen )
    NOT DEFERRABLE;

ALTER TABLE pf_serie
    ADD CONSTRAINT fk_imagen_serie FOREIGN KEY ( cve_imagen )
        REFERENCES pf_imagen ( cve_imagen )
    NOT DEFERRABLE;

ALTER TABLE pf_episodio
    ADD CONSTRAINT fk_informacion_episodio FOREIGN KEY ( cve_informacion )
        REFERENCES pf_informacion ( cve_informacion )
    NOT DEFERRABLE;

ALTER TABLE pf_pelicula
    ADD CONSTRAINT fk_informacion_pelicula FOREIGN KEY ( cve_informacion )
        REFERENCES pf_informacion ( cve_informacion )
    NOT DEFERRABLE;

ALTER TABLE pf_serie
    ADD CONSTRAINT fk_informacion_serie FOREIGN KEY ( cve_informacion )
        REFERENCES pf_informacion ( cve_informacion )
    NOT DEFERRABLE;

ALTER TABLE pf_estado
    ADD CONSTRAINT fk_pais_estado_1 FOREIGN KEY ( cve_pais )
        REFERENCES pf_pais ( cve_pais )
    NOT DEFERRABLE;

ALTER TABLE pf_region
    ADD CONSTRAINT fk_pais_region FOREIGN KEY ( cve_pais )
        REFERENCES pf_pais ( cve_pais )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE pf_productora_pelicula
    ADD CONSTRAINT fk_pelicula_productora_pelicula FOREIGN KEY ( cve_pelicula )
        REFERENCES pf_pelicula ( cve_pelicula )
    NOT DEFERRABLE;

ALTER TABLE pf_preferencia_perfil
    ADD CONSTRAINT fk_perfil_preferencia_perfil FOREIGN KEY ( cve_perfil )
        REFERENCES pf_perfil ( cve_perfil )
    NOT DEFERRABLE;

ALTER TABLE pf_encargado
    ADD CONSTRAINT fk_persona_encargado FOREIGN KEY ( cve_persona )
        REFERENCES pf_persona ( cve_persona )
    NOT DEFERRABLE;

ALTER TABLE pf_usuario
    ADD CONSTRAINT fk_persona_usuario FOREIGN KEY ( cve_persona )
        REFERENCES pf_persona ( cve_persona )
    NOT DEFERRABLE;

ALTER TABLE pf_cuenta
    ADD CONSTRAINT fk_plan_cuenta FOREIGN KEY ( cve_plan )
        REFERENCES pf_plan ( cve_plan )
    NOT DEFERRABLE;

ALTER TABLE pf_pago
    ADD CONSTRAINT fk_plan_pago FOREIGN KEY ( cve_plan )
        REFERENCES pf_plan ( cve_plan )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE pf_preferencia_perfil
    ADD CONSTRAINT fk_preferencia_preferencia_perfil FOREIGN KEY ( cve_preferencia )
        REFERENCES pf_preferencia ( cve_preferencia )
    NOT DEFERRABLE;

ALTER TABLE pf_contrato
    ADD CONSTRAINT fk_productora_contrato FOREIGN KEY ( cve_productora )
        REFERENCES pf_productora ( cve_productora )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE pf_productora_pelicula
    ADD CONSTRAINT fk_productora_productora_pelicula FOREIGN KEY ( cve_productora )
        REFERENCES pf_productora ( cve_productora )
    NOT DEFERRABLE;

ALTER TABLE pf_productora_serie
    ADD CONSTRAINT fk_productora_productora_serie FOREIGN KEY ( cve_productora )
        REFERENCES pf_productora ( cve_productora )
    NOT DEFERRABLE;

ALTER TABLE pf_cuenta
    ADD CONSTRAINT fk_region_cuenta FOREIGN KEY ( cve_region )
        REFERENCES pf_region ( cve_region )
    NOT DEFERRABLE;

ALTER TABLE pf_productora_serie
    ADD CONSTRAINT fk_serie_productora_serie FOREIGN KEY ( cve_serie )
        REFERENCES pf_serie ( cve_serie )
    NOT DEFERRABLE;

ALTER TABLE pf_temporada
    ADD CONSTRAINT fk_serie_temporada FOREIGN KEY ( cve_serie )
        REFERENCES pf_serie ( cve_serie )
    NOT DEFERRABLE;

ALTER TABLE pf_empresa
    ADD CONSTRAINT fk_telefono_empresa FOREIGN KEY ( cve_telefono )
        REFERENCES pf_telefono ( cve_telefono )
    NOT DEFERRABLE;

ALTER TABLE pf_encargado
    ADD CONSTRAINT fk_telefono_encargado FOREIGN KEY ( cve_telefono )
        REFERENCES pf_telefono ( cve_telefono )
    NOT DEFERRABLE;

ALTER TABLE pf_usuario
    ADD CONSTRAINT fk_telefono_usuario FOREIGN KEY ( cve_telefono )
        REFERENCES pf_telefono ( cve_telefono )
    NOT DEFERRABLE;

ALTER TABLE pf_episodio
    ADD CONSTRAINT fk_temporada_episodio FOREIGN KEY ( cve_temporada )
        REFERENCES pf_temporada ( cve_temporada )
    NOT DEFERRABLE;

ALTER TABLE pf_perfil
    ADD CONSTRAINT fk_tipo_perfil_perfil FOREIGN KEY ( cve_tipo_perfil )
        REFERENCES pf_tipo_perfil ( cve_tipo_perfil )
    NOT DEFERRABLE;

ALTER TABLE pf_cuenta
    ADD CONSTRAINT fk_usuario_cuenta FOREIGN KEY ( cve_usuario )
        REFERENCES pf_usuario ( cve_usuario )
    NOT DEFERRABLE;

ALTER TABLE pf_pago
    ADD CONSTRAINT fk_usuario_pago FOREIGN KEY ( cve_usuario )
        REFERENCES pf_usuario ( cve_usuario )
    NOT DEFERRABLE;

