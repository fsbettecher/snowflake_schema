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

<hr></hr>

![gif-turmas](https://github.com/fsbettecher/snowflake_table/assets/62480910/ea222b90-2e49-4cc7-a5f4-476239a5a748)

![git-matriculas](https://github.com/fsbettecher/snowflake_table/assets/62480910/2cc137be-45ea-4549-8f0d-c59d0ca849e7)
