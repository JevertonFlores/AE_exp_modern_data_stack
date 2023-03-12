# Modern Data Stack
Repositório para preparação e configuração de ambiente, além do versionamento de código de uma stack moderna de dados.


<h3>Objetivo:</h3>
Este projeto tem como objetivo a exploração de soluções modernas para o desenvolvimento de pipelines e modelagem de dados.

<h3>Ferramentas e liguagens utilizadas:</h3>

- Mongo DB como source;
- Snowflake como solução de Data Warehouse;
- Airbite como solução de integração de dados;
- dbt (data build tool) e SQL para o tratamento e modelagem dos dados;
- Docker;
- Airflow para a orquestração do pipeline.


<h3>Origens dos dados:</h3>

Primeiramente, criei uma conta no Mongo DB e logo depois configurei e subi um cluster para disponibilizar o banco de dados e seus objetos. Este banco de dados representa é onde estão armazenados os dados de origem, que serão coletados, armazenados no DW e posteriormente tratados e disponibilizados para consumo.

Link para criar a conta: <a>https://www.mongodb.com/cloud</a>

Cluster: 
<img width="947" alt="image" src="https://user-images.githubusercontent.com/36814309/224580899-b374f5f6-40f8-44fa-9b27-22bf82e31957.png">

Banco de dados e tabelas (payments e user):
<img width="953" alt="image" src="https://user-images.githubusercontent.com/36814309/224580949-4c4088f1-04f1-4cee-823b-090276f51b01.png">


<h3>Data Warehouse:</h3>
Após criada a conta no Snowflake, criei um novo database que servirá como repositório dos dados, tanto para as camadas de stage quanto para de consumo.

Link para criar a conta: <a>https://www.snowflake.com/en/</a>

Banco de dados MDS criado:
<img width="933" alt="image" src="https://user-images.githubusercontent.com/36814309/224581444-d6e68889-f975-4848-82de-13e506f96112.png">



<h3>Processo e estrutura:</h3>

Via linguagem Python, serão coletados dados contidos em arquivos .csv e também diretamente no site do IBGE, posteriormente estes dados serão armazenados em uma área de Stage, passarão por alguns tratamento e, por fim, serão disponibilizados em tabelas modeladas em um DW no banco SQLite.
- Para a criação das tabelas Dimensão foram utilizados os conceitos de SCD Tipo 1.
- Para a tabela fato, além do script de criação da tabela e carga dos dados, também foi programado a carga incremental dos dados e atualização retroativa dos registros.


