CREATE TABLE public.alunos (
	id serial4 NOT NULL,
	nome text NOT NULL,
	idade int8 NULL,
	endereco text NULL,
	deleted_at timestamp NULL,
	CONSTRAINT alunos_pkey PRIMARY KEY (id)
);

CREATE TABLE public.escolas (
	id serial4 NOT NULL,
	nome text NOT NULL,
	parent_id int8 NOT NULL,
	tipo text NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT escolas_pkey PRIMARY KEY (id),
	CONSTRAINT escolas_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.escolas(id)
);

CREATE TABLE public.turmas (
	id serial4 NOT NULL,
	nome text NOT NULL,
	id_escola int8 NOT NULL,
	status text NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT turmas_pkey PRIMARY KEY (id),
	CONSTRAINT turmas_id_escola_fkey FOREIGN KEY (id_escola) REFERENCES public.escolas(id)
);

CREATE TABLE public.matriculas (
	id serial4 NOT NULL,
	id_aluno int8 NOT NULL,
	status text NOT NULL,
	id_turma int8 NOT NULL,
	deleted_at varchar NULL,
	CONSTRAINT matriculas_pkey PRIMARY KEY (id),
	CONSTRAINT matriculas_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.alunos(id),
	CONSTRAINT matriculas_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turmas(id)
);

INSERT INTO public.alunos (nome, idade, endereco)
VALUES ('Felipe Silva Bettecher', 30, 'Vitoria'),
	   ('Thais Ohnesorge Silva', 24, 'Serra'),
	   ('Jessica Montenegro', null, 'Maceió'),
	   ('Francicleia Cardoso', null, 'São Luis');
	   
INSERT INTO public.escolas (nome, parent_id, tipo)
VALUES('Brasil', -1, 'pais'),
      ('Acre', 1, 'estado'),
      ('Alagoas', 1, 'estado'),
      ('Amapá', 1, 'estado'),
      ('Amazonas', 1, 'estado'),
      ('Bahia', 1, 'estado'),
      ('Ceará', 1, 'estado'),
      ('Distrito Federal', 1, 'estado'),
      ('Espírito Santo', 1, 'estado'),
      ('Goiás', 1, 'estado'),
      ('Maranhão', 1, 'estado'),
      ('Mato Grosso', 1, 'estado'),
      ('Mato Grosso do Sul', 1, 'estado'),
      ('Minas Gerais', 1, 'estado'),
      ('Pará', 1, 'estado'),
      ('Paraíba', 1, 'estado'),
      ('Paraná', 1, 'estado'),
      ('Pernambuco', 1, 'estado'),
      ('Piauí', 1, 'estado'),
      ('Rio de Janeiro', 1, 'estado'),
      ('Rio Grande do Norte', 1, 'estado'),
      ('Rio Grande do Sul', 1, 'estado'),
      ('Rondônia', 1, 'estado'),
      ('Roraima', 1, 'estado'),
      ('Santa Catarina', 1, 'estado'),
      ('São Paulo', 1, 'estado'),
      ('Sergipe', 1, 'estado'),
      ('Tocantins', 1, 'estado'),
      ('Rio Branco', 2, 'cidade'),
      ('Maceió', 3, 'cidade'),
      ('Macapá', 4, 'cidade'),
      ('Manaus', 5, 'cidade'),
      ('Salvador', 6, 'cidade'),
      ('Fortaleza', 7, 'cidade'),
      ('Brasília*', 8, 'cidade'),
      ('Vitória', 9, 'cidade'),
      ('Goiânia', 10, 'cidade'),
      ('São Luís', 11, 'cidade'),
      ('Cuiabá', 12, 'cidade'),
      ('Campo Grande', 13, 'cidade'),
      ('Belo Horizonte', 14, 'cidade'),
      ('Belém', 15, 'cidade'),
      ('João Pessoa', 16, 'cidade'),
      ('Curitiba', 17, 'cidade'),
      ('Recife', 18, 'cidade'),
      ('Teresina', 19, 'cidade'),
      ('Rio de Janeiro', 20, 'cidade'),
      ('Natal', 21, 'cidade'),
      ('Porto Alegre', 22, 'cidade'),
      ('Porto Velho', 23, 'cidade'),
      ('Boa Vista', 24, 'cidade'),
      ('Florianópolis', 25, 'cidade'),
      ('São Paulo', 26, 'cidade'),
      ('Aracaju', 27, 'cidade'),
      ('Palmas', 28, 'cidade');

INSERT INTO public.turmas (nome, id_escola, status)
VALUES ('Alicerce', 53, 'ativo'),
	   ('Sindipetro', 36, 'ativo'),
	   ('Marista', 30, 'ativo'),
	   ('Darwin', 36, 'inativo'),
	   ('Elite', 47, 'ativo');
	   
INSERT INTO public.matriculas (id_aluno, status, id_turma)
VALUES (1, 'ativo', 1),
	   (2, 'ativo', 2),
	   (3, 'ativo', 3),
	   (4, 'ativo', 5);