CREATE TABLE alunos.alunos (
	id serial4 NOT NULL,
	nome text NOT NULL,
	idade int8 NULL,
	endereco text NULL,
	deleted_at timestamp NULL,
	CONSTRAINT alunos_pkey PRIMARY KEY (id)
);

CREATE TABLE alunos.escolas (
	id serial4 NOT NULL,
	nome text NOT NULL,
	parent_id int8 NOT NULL,
	tipo text NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT escolas_pkey PRIMARY KEY (id),
	CONSTRAINT escolas_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES alunos.escolas(id)
);

CREATE TABLE alunos.turmas (
	id serial4 NOT NULL,
	nome text NOT NULL,
	id_escola int8 NOT NULL,
	status text NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT turmas_pkey PRIMARY KEY (id),
	CONSTRAINT turmas_id_escola_fkey FOREIGN KEY (id_escola) REFERENCES alunos.escolas(id)
);

CREATE TABLE alunos.matriculas (
	id serial4 NOT NULL,
	id_aluno int8 NOT NULL,
	status text NOT NULL,
	id_turma int8 NOT NULL,
	deleted_at varchar NULL,
	CONSTRAINT matriculas_pkey PRIMARY KEY (id),
	CONSTRAINT matriculas_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES alunos.alunos(id),
	CONSTRAINT matriculas_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES alunos.turmas(id)
);

INSERT INTO alunos.alunos (nome, idade, endereco)
VALUES ('Felipe Silva Bettecher', 30, 'Vitoria'),
	   ('Thais Ohnesorge Silva', 24, 'Serra'),
	   ('Jessica Montenegro', 30, 'Maceió'),
	   ('Francicleia Cardoso', 28, 'São Luis');
	   
INSERT INTO alunos.escolas (nome, parent_id, tipo)
VALUES('Brasil', 1, 'pais'),
	  ('Acre', 2, 'estado'),
	  ('Alagoas', 3, 'estado'),
	  ('Amapá', 4, 'estado'),
	  ('Amazonas', 5, 'estado'),
	  ('Bahia', 6, 'estado'),
	  ('Ceará', 7, 'estado'),
	  ('Distrito Federal', 8, 'estado'),
	  ('Espírito Santo', 9, 'estado'),
	  ('Goiás', 10, 'estado'),
	  ('Maranhão', 11, 'estado'),
	  ('Mato Grosso', 12, 'estado'),
	  ('Mato Grosso do Sul', 13, 'estado'),
	  ('Minas Gerais', 14, 'estado'),
	  ('Pará', 15, 'estado'),
	  ('Paraíba', 16, 'estado'),
	  ('Paraná', 17, 'estado'),
	  ('Pernambuco', 18, 'estado'),
	  ('Piauí', 19, 'estado'),
	  ('Rio de Janeiro', 20, 'estado'),
	  ('Rio Grande do Norte', 21, 'estado'),
	  ('Rio Grande do Sul', 22, 'estado'),
	  ('Rondônia', 23, 'estado'),
	  ('Roraima', 24, 'estado'),
	  ('Santa Catarina', 25, 'estado'),
	  ('São Paulo', 26, 'estado'),
	  ('Sergipe', 27, 'estado'),
	  ('Tocantins', 28, 'estado'),
	  ('Rio Branco', 29, 'cidade'),
	  ('Maceió', 30, 'cidade'),
	  ('Macapá', 31, 'cidade'),
	  ('Manaus', 32, 'cidade'),
	  ('Salvador', 33, 'cidade'),
	  ('Fortaleza', 34, 'cidade'),
	  ('Brasília*', 35, 'cidade'),
	  ('Vitória', 36, 'cidade'),
	  ('Goiânia', 37, 'cidade'),
	  ('São Luís', 38, 'cidade'),
	  ('Cuiabá', 39, 'cidade'),
	  ('Campo Grande', 40, 'cidade'),
	  ('Belo Horizonte', 41, 'cidade'),
	  ('Belém', 42, 'cidade'),
	  ('João Pessoa', 43, 'cidade'),
	  ('Curitiba', 44, 'cidade'),
	  ('Recife', 45, 'cidade'),
	  ('Teresina', 46, 'cidade'),
	  ('Rio de Janeiro', 47, 'cidade'),
	  ('Natal', 48, 'cidade'),
	  ('Porto Alegre', 49, 'cidade'),
	  ('Porto Velho', 50, 'cidade'),
	  ('Boa Vista', 51, 'cidade'),
	  ('Florianópolis', 52, 'cidade'),
	  ('São Paulo', 53, 'cidade'),
	  ('Aracaju', 54, 'cidade'),
	  ('Palmas', 55, 'cidade');

INSERT INTO alunos.turmas (nome, id_escola, status)
VALUES ('Alicerce', 53, 'ativo'),
	   ('Sindipetro', 36, 'ativo'),
	   ('Marista', 30, 'ativo'),
	   ('Darwin', 36, 'inativo'),
	   ('Elite', 47, 'ativo');
	   
INSERT INTO alunos.matriculas (id_aluno, status, id_turma)
VALUES (1, 'ativo', 1),
	   (2, 'ativo', 2),
	   (3, 'ativo', 3),
	   (4, 'ativo', 5);