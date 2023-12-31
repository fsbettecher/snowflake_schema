<h1 align="center">Criação de um esquema Snowflake</h1><br>
<p align="center">
<img loading="lazy" src="https://img.shields.io/badge/STATUS-FINALIZADO-badge"/>
</p>
<br>

<hr></hr>

## Índice

* [O que é um esquema snowflake?](#-o-que-é-um-esquema-snowflake)
* [Porque e quando usar um esquema snowflake?](#-porque-e-quando-usar-um-esquema-snowflake)
* [Objetivos do repositório](#objetivos-do-repositório)
* [Passo 1: Criação de tabelas primárias](#passo-1-criação-de-tabelas-primárias)
* [Passo 2: Criação de tabelas utilizando referências](#passo-2-criação-de-tabelas-utilizando-referências)
* [Passo 3: Inserção de dados nas tabelas](#passo-3-inserção-de-dados-nas-tabelas)
<hr></hr>

<h2 align="center"> O que é um esquema snowflake?</h2>

<h4 align="justify">O esquema snowflake é um modelo utilizado para estruturar bancos de dados com maior complexidade. Seu nome veio justamente do formato que um floco de neve possui, onde há um ponto central que compartilha informações com ramos secundários, que por sua vez, compartilham informações com ramos terciários e assim por diante. Seu objetivo é eliminar a redundância de informações e reduzir a quantidade de dados no banco. A hierarquia das informações e suas dimensões são preservadas no modelo de dados por meio do relacionamento de chave externa e chave primária, que será exemplificado no código.</h4><br>

<h2 align="center"> Porque e quando usar um esquema snowflake?</h2>

<h4 align="justify">Existem alguns modelos de esquemas mais utilizados para banco de dados:</h4>

* Snowflake ou floco de neve
* Star ou estrela
* Fact Constellation ou constelação de fatos (ou modelo hibrido)

<h4 align="justify">No modelo floco de neve, como explicado acima, há diferentes níveis de dimensões e hierarquias. A fim de evitar criação de muitos dados repetidos em uma tabela ou criar tabelas muito extensas, o modelo floco de neve permite a criação de tabelas de dimensões que podem armazenar informações chave e se ligam às tabelas de fatos através de chaves primárias e chaves externas.<br>
<br>
Sua estruturação traz complexidade ao banco e permite a inserção de mais informações em suas tabelas, uma vez que elas não precisam estar na mesma tabela, mas se comunicam através de chaves específicas. Então, caso haja muitas variáveis necessárias para serem armazenadas, um esquema do modelo snowflake possui maior eficiência. A consulta de informações se torna mais organizada e a visualização dos dados é facilitada.<br>
<br>
Um dos pontos negativos sobre esse modelo é a quantidade de joins utilizados nas consultas. Justamente por possuir informações separadas em diferentes tabelas, a consulta de informações só será completa utilizando joins. Nesse ponto, a eficiência de consultas em modelos snowflake é consideravelmente menor que o modelo estrela. Além disso, sua complexidade requer tempo de estruturação, estudos e planejamento maiores que um modelo mais simples.</h4><br>

<h2 align="center">Objetivos do repositório</h2>

* Trazer informações sobre o esquema snowflake ou floco de neve;
* Criar queries que possibilitam a criação tabelas no modelo;
* Inserir dados com hierarquias como exemplo e visualização das tabelas

<br></br>

Todos os códigos utilizados no README estão disponíveis no arquivo `queries_sql.sql`

<hr></hr><br>

<h2>Passo 1: Criação de tabelas primárias</h2><br>

• A criação das tabelas devem ser feitas inicialmente por tabelas que não possuem chaves extrangeiras ou que possuem chaves extrangeiras em que as referências são chaves da própria tabela, uma vez que elas precisarão ser herdadas e, portanto, ja terem sido criadas anteriormente.

<br>

• Utilizando o código abaixo, é possível criar a tabela `alunos` dentro do esquema `public`

```
CREATE TABLE public.alunos (
	id serial4 NOT NULL,
	nome text NOT NULL,
	idade int8 NULL,
	endereco text NULL,
	deleted_at timestamp NULL,
	CONSTRAINT alunos_pkey PRIMARY KEY (id)
);
```

```
CREATE TABLE public.escolas (
	id serial4 NOT NULL,
	nome text NOT NULL,
	parent_id int8 NOT NULL,
	tipo text NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT escolas_pkey PRIMARY KEY (id),
	CONSTRAINT escolas_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.escolas(id)
);
```

<br>

• É possível reparar que a tabela `escolas` possui `public.escolas(id)` como chave extrangeira da chave `parent_id` dentro da própria tabela.

<br>

<h2>Passo 2: Criação de tabelas utilizando referências</h2><br>

• Após a criação das tabelas `alunos` e `escolas`, é possível utilizar chaves primárias delas como referências em outras tabelas.
Os códigos abaixo trazem exemplos de como referenciar chaves primárias de outras tabelas

```
CREATE TABLE public.turmas (
	id serial4 NOT NULL,
	nome text NOT NULL,
	id_escola int8 NOT NULL,
	status text NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT turmas_pkey PRIMARY KEY (id),
	CONSTRAINT turmas_id_escola_fkey FOREIGN KEY (id_escola) REFERENCES public.escolas(id)
);
```

```
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
```

<br>

• Nos códigos acima, as chaves `public.escolas(id)`, `public.alunos(id)` e `public.turmas(id)` se tornaram referências para as tabelas `turmas` e `matriculas`. Dessa forma, as tabelas agora possuem ligação e se comunicam através das chaves herdadas.

• Finalizando as criações das tabelas, é possível visualizar como cada tabela se comunica:

<div align="center">
<strong>Tabela public.alunos</strong>
  
![table alunos](https://github.com/fsbettecher/snowflake_schema/assets/62480910/3b258f49-6170-4803-87f6-06ec4816720a)

</div><br>

<div align="center">
<strong>Tabela public.escolas</strong>
  
![table escolas](https://github.com/fsbettecher/snowflake_schema/assets/62480910/a0c06b8b-3cd8-4d1a-a63b-ca6f3c06c946)

</div><br>

<div align="center">
<strong>Tabela public.turmas</strong>
  
![table turmas](https://github.com/fsbettecher/snowflake_schema/assets/62480910/33563663-9090-47dc-8afc-dad19712874a)

</div><br>

<div align="center">
<strong>Tabela public.matriculas</strong>
  
![table matriculas](https://github.com/fsbettecher/snowflake_schema/assets/62480910/98eae979-7f4b-492c-b9f9-0448a4ac2d83)

</div><br>

<h2>Passo 3: Inserção de dados nas tabelas</h2><br>

• Por fim, para entender como funcionam as chaves primárias e extrangeiras e a ideia de hierarquia, o código abaixo insere valores nas tabelas criadas, para que seja possível visualizar o comportamento das tabelas com dados relacionados.

```
INSERT INTO public.alunos (nome, idade, endereco)
VALUES ('Felipe Silva Bettecher', 30, 'Vitoria'),
       ('Thais Ohnesorge Silva', 24, 'Serra'),
       ('Jessica Montenegro', 30, 'Maceió'),
       ('Francicleia Cardoso', 28, 'São Luis');
```

```
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
```

```
INSERT INTO public.turmas (nome, id_escola, status)
VALUES ('Alicerce', 53, 'ativo'),
       ('Sindipetro', 36, 'ativo'),
       ('Marista', 30, 'ativo'),
       ('Darwin', 36, 'inativo'),
       ('Elite', 47, 'ativo');
```

```
INSERT INTO public.matriculas (id_aluno, status, id_turma)
VALUES (1, 'ativo', 1),
       (2, 'ativo', 2),
       (3, 'ativo', 3),
       (4, 'ativo', 5);
```

<br>

• Os dados da tabela `public.escolas` possuem relação entre si. Dessa forma, o `parent_id` do maior valor é -1, pois ele ocupa a maior hierarquia da tabela.
Todos os estados presentes na tabela tem como referência o `parent_id` da linha 'Brasil', ou seja, de `id` = 1. Já as cidades, possuem o `id` dos estados como referência para o `parent_id` delas.

<br>

• Através do DBeaver, é possível visualizar o que cada código significa. Como a referência dos valores são ids, a sessão de visualização ao lado da tela mostra a referência da outra tabela do id selecionado na tabela atual:
![gif-turmas](https://github.com/fsbettecher/snowflake_table/assets/62480910/ea222b90-2e49-4cc7-a5f4-476239a5a748)

<br>

• Ao clicar no ícone ao lado do id, é possível navegar até a tabela em que a chave foi herdada:
![git-matriculas](https://github.com/fsbettecher/snowflake_table/assets/62480910/2cc137be-45ea-4549-8f0d-c59d0ca849e7)