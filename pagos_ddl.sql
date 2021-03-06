


-- Company :      UNAM
-- Project :      Banco
-- Author :       beatriz sanchez
-- Date Created : Monday, April 08, 2019 23:34:33
-- Target DBMS : PostgreSQL 8.0
--

-- 
-- TABLE: BANCO 
--

CREATE TABLE BANCO(
    BANCO_ID      numeric(10, 0)    NOT NULL,
    NOMBRE_BANCO  varchar(40)       NOT NULL,
    ABREVIACION   varchar(40)       NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (BANCO_ID)
)
;

-- 
-- TABLE: CURSO 
--

CREATE TABLE CURSO(
    CURSO_ID      numeric(4, 0)     NOT NULL,
    NOMBRE        varchar(40)       NOT NULL,
    PRECIO        numeric(10, 2)    NOT NULL,
    DURACION_SEMANAS      numeric(2)             NOT NULL,
    FECHA_INICIO  date              NOT NULL,
    FECHA_FIN     date              NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (CURSO_ID)
)
;

-- 
-- TABLE: CURSO_SOLICITANTE 
--

CREATE SEQUENCE SEQ_CURSO_SOLICITANTE;

CREATE TABLE CURSO_SOLICITANTE(
    CURSO_SOLICITANTE_ID   numeric(10, 0) default nextval('SEQ_CURSO_SOLICITANTE'),
    IMPORTE_TOTAL       numeric(10, 2)    NOT NULL,
    STATUS_ACTUAL       varchar(40)       NOT NULL,
    FECHA_ST_ACTUAL     date              NOT NULL,
    CURSO_ID            numeric(4, 0)     NOT NULL,
    SOLICITANTE_ID      numeric(10, 0)    NOT NULL,
    HISTORICO_CURSO_ID  numeric(10, 0)    NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (CURSO_SOLICITANTE_ID)
)
;

-- 
-- TABLE: FACTURA 
--

CREATE SEQUENCE SEQ_FACTURA;

CREATE TABLE FACTURA(
    FACTURA_ID      numeric(30, 0) default nextval('SEQ_FACTURA'),
    IMPORTE         numeric(4, 2)     NOT NULL,
    REFERENCIA_ID   numeric(10, 0)    NOT NULL,
    SOLICITANTE_ID  numeric(10, 0)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (FACTURA_ID)
)
;

-- 
-- TABLE: HISTORICO_CURSO 
--

CREATE SEQUENCE SEQ_HISTORICO_CURSO;
CREATE TABLE HISTORICO_CURSO(
    HISTORICO_CURSO_ID  numeric(10, 0) default nextval('SEQ_HISTORICO_CURSO'),
    FECHA_STATUS        date              NOT NULL,
    STATUS_COMPRA_ID    numeric(10, 0)    NOT NULL,
    CURSO_SOLICITANTE_ID numeric(10,0) 	  NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY (HISTORICO_CURSO_ID)
)
;

-- 
-- TABLE: REFERENCIA 
--

CREATE TABLE REFERENCIA(
    REFERENCIA_ID      numeric(10, 0)    NOT NULL,
    NUMERO_REFERENCIA  varchar(20)       NOT NULL,
    FECHA_VIGENCIA     date              NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (REFERENCIA_ID)
)
;

-- 
-- TABLE: SOLICITANTE 
--

CREATE SEQUENCE SEQ_SOLICITANTE;

CREATE TABLE SOLICITANTE(
    SOLICITANTE_ID    numeric(10, 0) default nextval('SEQ_SOLICITANTE'),
    USERNAME          varchar(40)       NOT NULL,
    CONTRASEÑA        varchar(20)       NOT NULL,
    DESCUENTO         numeric(40, 0)    NOT NULL,
    NUM_CUENTA        varchar(9)        NULL,
    RFC               varchar(13)       NOT NULL,
    NOMBRE            varchar(40)       NOT NULL,
    AP_PATERNO        varchar(40)       NOT NULL,
    AP_MATERNO        varchar(40)       NULL,
    FECHA_NACIMIENTO  date              NOT NULL,
    EMAIL             varchar(40)       NOT NULL,
    SEXO              varchar(10)       NOT NULL,
    TIPO_PAGO         varchar(20)       NOT NULL,
    TIPO_ALUMNO       varchar(40)       NOT NULL,
    TELEFONO     numeric(10, 0)    NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY (SOLICITANTE_ID),
    CONSTRAINT SOLICITANTE_SEXO_CHK check(SEXO in('Masculino','Femenino')),
    CONSTRAINT SOLICITANTE_TIPO_PAGO_CHK check(TIPO_PAGO in ('Transferencia','Deposito ventanilla','Presencial'))
)
;

-- 
-- TABLE: STATUS_COMPRA 
--
CREATE SEQUENCE SEQ_STATUS_COMPRA;

CREATE TABLE STATUS_COMPRA(
    STATUS_COMPRA_ID  numeric(10, 0) default nextval('SEQ_STATUS_COMPRA'),
    NOMBRE            varchar(40)       NOT NULL,
    DESCRIPCION       varchar(400)      NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (STATUS_COMPRA_ID)
)
;

-- 
-- TABLE: TARJETA_CLIENTE 
--

CREATE TABLE TARJETA_CLIENTE(
    TARJETA_C_ID     numeric(10, 0)    NOT NULL,
    UCUATRO_DIGITOS  numeric(4, 0)     NOT NULL,
    BANCO_ID         numeric(10, 0)    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (TARJETA_C_ID)
)
;

-- 
-- TABLE: CURSO_SOLICITANTE 
--

ALTER TABLE CURSO_SOLICITANTE ADD CONSTRAINT RefCURSO81 
    FOREIGN KEY (CURSO_ID)
    REFERENCES CURSO(CURSO_ID)
;

ALTER TABLE CURSO_SOLICITANTE ADD CONSTRAINT RefSOLICITANTE91 
    FOREIGN KEY (SOLICITANTE_ID)
    REFERENCES SOLICITANTE(SOLICITANTE_ID)
;

ALTER TABLE CURSO_SOLICITANTE ADD CONSTRAINT RefHISTORICO_CURSO181 
    FOREIGN KEY (HISTORICO_CURSO_ID)
    REFERENCES HISTORICO_CURSO(HISTORICO_CURSO_ID)
;


-- 
-- TABLE: FACTURA 
--

ALTER TABLE FACTURA ADD CONSTRAINT RefREFERENCIA131 
    FOREIGN KEY (REFERENCIA_ID)
    REFERENCES REFERENCIA(REFERENCIA_ID)
;

ALTER TABLE FACTURA ADD CONSTRAINT RefSOLICITANTE151 
    FOREIGN KEY (SOLICITANTE_ID)
    REFERENCES SOLICITANTE(SOLICITANTE_ID)
;

-- 
-- TABLE: HISTORICO_CURSO 
--

ALTER TABLE HISTORICO_CURSO ADD CONSTRAINT RefSTATUS_COMPRA161 
    FOREIGN KEY (STATUS_COMPRA_ID)
    REFERENCES STATUS_COMPRA(STATUS_COMPRA_ID)
;

-- 
-- TABLE: SOLICITANTE 
--

ALTER TABLE SOLICITANTE ADD CONSTRAINT RefTARJETA_CLIENTE201 
    FOREIGN KEY (TARJETA_C_ID)
    REFERENCES TARJETA_CLIENTE(TARJETA_C_ID)
;


-- 
-- TABLE: TARJETA_CLIENTE 
--

ALTER TABLE TARJETA_CLIENTE ADD CONSTRAINT RefBANCO51 
    FOREIGN KEY (BANCO_ID)
    REFERENCES BANCO(BANCO_ID)
;


ALTER TABLE curso_solicitante DROP CONSTRAINT refhistorico_curso181;
ALTER TABLE curso_solicitante DROP COLUMN historico_curso_id;

ALTER TABLE public.historico_curso ADD curso_solicitante_id numeric(10) NOT NULL;
ALTER TABLE public.historico_curso ADD CONSTRAINT historico_curso_curso_solicitante_fk 
FOREIGN KEY (curso_solicitante_id) REFERENCES public.curso_solicitante(curso_solicitante_id) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE public.tarjeta_cliente ADD cliente_id numeric(10) NOT NULL;

ALTER TABLE public.tarjeta_cliente ADD CONSTRAINT tarjeta_cliente_solicitante_fk FOREIGN KEY (solicitante_id) REFERENCES public.solicitante(solicitante_id) ON DELETE SET NULL ON UPDATE CASCADE;
