-- object: documento_programa | type: SCHEMA --
-- DROP SCHEMA IF EXISTS documento_programa CASCADE;
CREATE SCHEMA documento_programa;
-- ddl-end --

SET search_path TO pg_catalog,public,documento_programa;
-- ddl-end --

-- object: documento_programa.documento_programa | type: TABLE --
-- DROP TABLE IF EXISTS documento_programa.documento_programa CASCADE;
CREATE TABLE documento_programa.documento_programa (
	id serial NOT NULL,
	programa_id integer NOT NULL DEFAULT 0,
	tipo_documento_programa_id integer NOT NULL,
	periodo_id integer NOT NULL DEFAULT 0,
	numero_orden numeric(5,2),
	activo boolean NOT NULL DEFAULT false,
	fecha_modificacion timestamp NOT NULL,
	fecha_creacion timestamp NOT NULL,
	CONSTRAINT pk_documento_programa PRIMARY KEY (id)

);
-- ddl-end --

-- object: documento_programa.soporte_documento_programa | type: TABLE --
-- DROP TABLE IF EXISTS documento_programa.soporte_documento_programa CASCADE;
CREATE TABLE documento_programa.soporte_documento_programa (
	id serial NOT NULL,
	persona_id integer NOT NULL DEFAULT 0,
	documento_id integer NOT NULL DEFAULT 0,
	fecha_modificacion timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	fecha_creacion timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	documento_programa_id integer NOT NULL,
	CONSTRAINT pk_soporte_documento_programa PRIMARY KEY (id)

);
-- ddl-end --

-- object: documento_programa.tipo_documento_programa | type: TABLE --
-- DROP TABLE IF EXISTS documento_programa.tipo_documento_programa CASCADE;
CREATE TABLE documento_programa.tipo_documento_programa (
	id serial NOT NULL,
	nombre character varying(50) NOT NULL,
	descripcion character varying(250),
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL DEFAULT false,
	numero_orden numeric(5,2),
	tamano numeric(5),
	extension character varying(20),
	fecha_modificacion timestamp NOT NULL,
	fecha_creacion timestamp NOT NULL,
	CONSTRAINT pk_tipo_documento_programa PRIMARY KEY (id)

);
-- ddl-end --

-- object: fk_soporte_documento_programa_documento_programa | type: CONSTRAINT --
-- ALTER TABLE documento_programa.soporte_documento_programa DROP CONSTRAINT IF EXISTS fk_soporte_documento_programa_documento_programa CASCADE;
ALTER TABLE documento_programa.soporte_documento_programa ADD CONSTRAINT fk_soporte_documento_programa_documento_programa FOREIGN KEY (documento_programa_id)
REFERENCES documento_programa.documento_programa (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_documento_programa_tipo_documento_programa | type: CONSTRAINT --
-- ALTER TABLE documento_programa.documento_programa DROP CONSTRAINT IF EXISTS fk_documento_programa_tipo_documento_programa CASCADE;
ALTER TABLE documento_programa.documento_programa ADD CONSTRAINT fk_documento_programa_tipo_documento_programa FOREIGN KEY (tipo_documento_programa_id)
REFERENCES documento_programa.tipo_documento_programa (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --
