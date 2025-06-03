--2- Musica composição
CREATE DATABASE L2_02
USE L2_02
	CREATE TABLE generoPessoa(
		id_generoPessoa  INT      NOT NULL IDENTITY(1, 1),
		ds_generoPessoa  CHAR(10) NOT NULL,
		abr_generoPessoa INT      NOT NULL
		CONSTRAINT pk_genero PRIMARY KEY (id_generoPessoa)
	)
	CREATE TABLE musica(
		id_musica           INT           NOT NULL IDENTITY(1,1),
		nm_musica           VARCHAR(15)   NOT NULL,
		vlr_tempoDuracao    SMALLINT      NOT NULL,
		dt_lancamentoMusica SMALLDATETIME NOT NULL
		CONSTRAINT pk_musica PRIMARY KEY (id_musica)
	)
	CREATE TABLE artista(
		id_artista             INT           NOT NULL IDENTITY(1, 1),
		nm_artista             VARCHAR(15)   NOT NULL,
		nm_artistico           VARCHAR(15)   NOT NULL,
		dt_nascimentoArtistico SMALLDATETIME NOT NULL, 
		id_GeneroPessoaArtista INT           NOT NULL
		CONSTRAINT pk_artista             PRIMARY KEY (id_artista),
		CONSTRAINT fk_GeneroPessoaArtista FOREIGN KEY (id_GeneroPessoaArtista) REFERENCES generoPessoa(id_generoPessoa)
	)
	CREATE TABLE composicao(
		id_composicao INT NOT NULL,
		id_musica INT NOT NULL,
		id_artista INT NOT NULL, 
		CONSTRAINT pk_composicao PRIMARY KEY (id_musica, id_artista),
		CONSTRAINT fk_artistaMusica FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
		CONSTRAINT fk_musicaArtista FOREIGN KEY (id_musica) REFERENCES musica(id_musica)
	)
