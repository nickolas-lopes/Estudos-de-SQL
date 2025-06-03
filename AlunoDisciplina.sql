-- 3 Aluno Disciplina
CREATE DATABASE L2_EX03
USE L2_EX03
	CREATE TABLE curso(
	id_curso INT         NOT NULL IDENTITY(1, 1),
	nm_curso VARCHAR(20) NOT NULL
	CONSTRAINT pk_curso PRIMARY KEY (id_curso)
	)
	CREATE TABLE statusAlunoDisciplina(
	id_statusalunodisciplina INT NOT NULL IDENTITY(1,1),
	ds_statusalunodisciplina CHAR(10) NOT NULL,
	abr_statusalunodisciplina CHAR(2) NOT NULL
	CONSTRAINT pk_statusalunodisciplina PRIMARY KEY (id_statusalunodisciplina)
	)
	CREATE TABLE generoPessoa(
	id_generoPessoa INT NOT NULL IDENTITY(1,1),
	ds_generoPessoa CHAR(10) NOT NULL,
	abr_generoPessoa CHAR(1) NOT NULL
	CONSTRAINT pk_generoPessoa PRIMARY KEY (id_generoPessoa)
	)
	CREATE TABLE aluno(
	id_aluno INT  NOT NULL IDENTITY(1,1),
	dt_nascimentoAluno SMALLDATETIME NOT NULL,
	id_generoPessoaAluno INT NOT NULL,
	nr_cpfAluno BIGINT NOT NULL,
	nr_rgAluno BIGINT NOT NULL
	CONSTRAINT pk_aluno PRIMARY KEY (id_aluno),
	CONSTRAINT fk_generoPessoaAluno FOREIGN KEY (id_generoPessoaAluno) REFERENCES generoPessoa(id_generoPessoa)
	)
	CREATE TABLE disciplina(
	id_disciplina INT NOT NULL IDENTITY(1, 1),
	nm_disciplina VARCHAR(15) NOT NULL,
	sig_disciplina CHAR(5) NOT NULL,
	ds_disciplinaEmenta VARCHAR(50) NOT NULL,
	id_cursoDisciplina INT NOT NULL,
	vlr_disciplinaCargaHoraria INT NOT NULL
	CONSTRAINT pk_disciplina PRIMARY KEY (id_disciplina)
	CONSTRAINT fk_cursoDisciplina FOREIGN KEY (id_cursoDisciplina) REFERENCES curso(id_curso)
	)
	CREATE TABLE alunoDisciplina(
	id_alunoDisciplina INT NOT NULL IDENTITY(1,1),
	id_aluno INT NOT NULL,
	id_disciplina INT NOT NULL,
	vlr_p1 DECIMAL(2, 2) NOT NULL,
	vlr_p2 DECIMAL(2, 2) NOT NULL,
	vlr_p3 DECIMAL(2, 2) NOT NULL,
	vlr_atv DECIMAL (2, 2) NOT NULL,
	qtd_faltas INT NOT NULL,
	nr_semestre INT NOT NULL,
	id_statusAlunoDisciplina INT NOT NULL
	CONSTRAINT pk_alunoDisciplina PRIMARY KEY (id_alunoDisciplina, id_aluno, id_disciplina),
	CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
	CONSTRAINT fk_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
	CONSTRAINT fk_statusAlunoDisciplina FOREIGN KEY (id_statusAlunoDisciplina) REFERENCES statusalunodisciplina(id_statusalunodisciplina)
	)
