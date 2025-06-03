--6-FUNCIONARIO DEPARTAMENTO
CREATE DATABASE L1_EX06

USE L1_EX06
	CREATE TABLE genero(
	id_genero  INT      NOT NULL IDENTITY(1, 1),
	ds_genero  CHAR(10) NOT NULL,
	abr_genero CHAR(1)  NOT NULL
	CONSTRAINT pk_genero PRIMARY KEY (id_genero)
	)

	CREATE TABLE orgaoEmissorRG(
	id_orgaoEmissorRG  INT      NOT NULL IDENTITY(1, 1),
	ds_orgaoEmissorRG  CHAR(10) NOT NULL,
	abr_orgaoEmissorRG CHAR(1)  NOT NULL
	CONSTRAINT pk_orgaoEmissorRG PRIMARY KEY (id_orgaoEmissorRG)
	)
 
CREATE TABLE funcionario(
	id_funcionario               INT           NOT NULL IDENTITY(1,1),
	dt_nascFuncionario           SMALLDATETIME NOT NULL, 
	id_generoFuncionario         INT           NOT NULL,
	dt_RGEmissaoFuncionario      SMALLDATETIME NOT NULL,
	id_orgaoEmissorRGFuncionario INT           NOT NULL,
	nr_RGFuncionario             SMALLINT      NOT NULL,
	id_departamentoFuncionario   INT           NOT NULL,
	nr_CPF BIGINT                              NOT NULL
	CONSTRAINT pk_funcionario              PRIMARY KEY (id_funcionario)
	CONSTRAINT fk_generoFuncionario        FOREIGN KEY (id_generoFuncionario) REFERENCES genero(id_genero),
	CONSTRAINT fk_orgaoEmissoRGFuncionario FOREIGN KEY (id_orgaoEmissorRGFuncionario) REFERENCES orgaoEmissorRG(id_orgaoEmissorRG)
)

	CREATE TABLE departamento(
	id_departamento       INT         NOT NULL IDENTITY(1, 1),
	nm_departamento       VARCHAR(15) NOT NULL,
	abr_departamento      CHAR(6)     NOT NULL,
	id_funcionarioGerente INT         NOT NULL
	CONSTRAINT pk_departamento       PRIMARY KEY (id_departamento)
	CONSTRAINT fk_funcionarioGerente FOREIGN KEY (id_funcionarioGerente) REFERENCES funcionario(id_funcionario)
	)

