-- Teste Pickcells
-- SQL script to create database
-- Author : Roberto Maia Filho
DROP DATABASE IF EXISTS db_pickcells;
CREATE DATABASE IF NOT EXISTS db_pickcells DEFAULT COLLATE utf8mb4_unicode_520_ci;
creditos
DROP TABLE IF EXISTS db_pickcells.tipo_curso;
CREATE TABLE db_pickcells.tipo_curso (
  id INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(15) NOT NULL,
  PRIMARY KEY (id)
  );
  
INSERT INTO db_pickcells.tipo_curso(tipo) VALUES ('Graduação');
INSERT INTO db_pickcells.tipo_curso(tipo) VALUES ('Mestrado');
INSERT INTO db_pickcells.tipo_curso(tipo) VALUES ('Doutorado');

DROP TABLE IF EXISTS db_pickcells.curso;
CREATE TABLE db_pickcells.curso (
	id INT NOT NULL AUTO_INCREMENT,
    curso VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO db_pickcells.curso(curso) VALUES ('Ciência da Computação');
INSERT INTO db_pickcells.curso(curso) VALUES ('Sistemas de Informação');
INSERT INTO db_pickcells.curso(curso) VALUES ('Engenharia de Software');
INSERT INTO db_pickcells.curso(curso) VALUES ('Inteligência Computacional');
INSERT INTO db_pickcells.curso(curso) VALUES ('Inteligência Artificial');

DROP TABLE IF EXISTS db_pickcells.disciplina;
CREATE TABLE db_pickcells.disciplina (
	id INT NOT NULL AUTO_INCREMENT,
    disciplina VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO db_pickcells.disciplina(disciplina) VALUES ('Algoritmos e Programação');
INSERT INTO db_pickcells.disciplina(disciplina) VALUES ('Matemática Computacional');
INSERT INTO db_pickcells.disciplina(disciplina) VALUES ('Estatística');
INSERT INTO db_pickcells.disciplina(disciplina) VALUES ('Empreendedorismo e Inovação');
INSERT INTO db_pickcells.disciplina(disciplina) VALUES ('Tópicos Avançados em Bancos de Dados');
INSERT INTO db_pickcells.disciplina(disciplina) VALUES ('Metodologia Científica');
INSERT INTO db_pickcells.disciplina(disciplina) VALUES ('Tópicos Avançados em Linguagens de Programação');

DROP TABLE IF EXISTS db_pickcells.creditos;
CREATE TABLE db_pickcells.creditos (
    id_tipo int NOT NULL,
	id_curso int NOT NULL,
    id_disciplina int NOT NULL,
    creditos int NOT NULL,
    obrigatorio BOOLEAN default 0,
    CONSTRAINT pk_tipo_curso_disciplina PRIMARY KEY (id_tipo, id_curso, id_disciplina),
    CONSTRAINT fk_tipo  FOREIGN KEY (id_tipo) REFERENCES db_pickcells.tipo_curso(id),
    CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES db_pickcells.curso(id),
    CONSTRAINT fk_disciplina FOREIGN KEY (id_disciplina) REFERENCES db_pickcells.disciplina(id)  
);


