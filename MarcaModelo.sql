--11- MARCA MODELO
CREATE DATABASE L1_EX11
USE L1_EX11
	CREATE TABLE pais(
	id_pais INT         NOT NULL IDENTITY(1,1),
	nm_pais VARCHAR(15) NOT NULL,
	CONSTRAINT pk_pais PRIMARY KEY (id_pais)
	)

	CREATE TABLE combustivel(
	id_combustivel  INT         NOT NULL IDENTITY(1,1),
	nm_combustivel  VARCHAR(10) NOT NULL,
	abr_combustivel VARCHAR(5)  NOT NULL,
	CONSTRAINT pk_combustivel PRIMARY KEY (id_combustivel)
	)

	CREATE TABLE tipoModelo(
	id_tipoModelo INT         NOT NULL IDENTITY(1,1),
	ds_tipoModelo VARCHAR(15) NOT NULL,
	CONSTRAINT pk_tipoModelo PRIMARY KEY (id_tipoModelo)
	)
	CREATE TABLE marca(
	id_marca     INT      NOT NULL IDENTITY(1,1),
	nm_marca     CHAR(15) NOT NULL,
	abr_marca    CHAR (5) NOT NULL, 
	id_paisMarca INT   NOT NULL
	CONSTRAINT pk_marca     PRIMARY KEY (id_marca)
	CONSTRAINT fk_paisMarca FOREIGN KEY (id_paisMarca) REFERENCES pais(id_pais)
	)
	CREATE TABLE modelo(
	id_modelo                 INT         NOT NULL IDENTITY(1,1),
	nm_modelo                 VARCHAR(15) NOT NULL,
	vlr_modelo                DEC(10, 2)  NOT NULL,
	vlr_potenciaMotor         DEC(5, 2)   NOT NULL,
	id_combustivelModelo      INT         NOT NULL,
	id_tipoModeloCarro        INT         NOT NULL,
	id_marcaModelo            INT         NOT NULL,
	CONSTRAINT pk_modelo PRIMARY KEY (id_modelo),
	CONSTRAINT fk_combustivelModelo FOREIGN KEY (id_combustivelModelo) REFERENCES combustivel(id_combustivel),
	CONSTRAINT fk_tipoModeloCarro FOREIGN KEY (id_tipoModeloCarro) REFERENCES tipoModelo(id_tipoModelo),
	CONSTRAINT fk_marcaModelo FOREIGN KEY (id_marcaModelo) REFERENCES marca(id_marca)
	)
