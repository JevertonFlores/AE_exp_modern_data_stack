# Modern Data Stack
Repositório para preparação e configuração de ambiente, além do versionamento de código, utilizando uma stack moderna de dados.


<h3>Objetivo:</h3>
Este projeto tem como objetivo a exploração de soluções modernas para o desenvolvimento de pipelines e modelagem de dados.

<h3>Ferramentas e liguagens utilizadas:</h3>

- Mongo DB como source;
- Snowflake como solução de Data Warehouse;
- Airbite como solução de integração de dados;
- dbt (data build tool) e SQL para o tratamento e modelagem dos dados;
- Docker;
- Airflow para a orquestração do pipeline.


<h2>Configuração de ambiente:</h2>

<h3>Origens dos dados:</h3>

Primeiramente, criei uma conta no Mongo DB e logo depois configurei e subi um cluster para disponibilizar o banco de dados e seus objetos. Este banco de dados representa é onde estão armazenados os dados de origem, que serão coletados, armazenados no DW e posteriormente tratados e disponibilizados para consumo.

Cluster:

<img width="947" alt="image" src="https://user-images.githubusercontent.com/36814309/224580899-b374f5f6-40f8-44fa-9b27-22bf82e31957.png">

Banco de dados e tabelas (payments e user):

<img width="953" alt="image" src="https://user-images.githubusercontent.com/36814309/224580949-4c4088f1-04f1-4cee-823b-090276f51b01.png">


<h3>Data Warehouse:</h3>

Após criada a conta no Snowflake, criei um novo database que servirá como repositório dos dados, tanto para as camadas de stage quanto para de consumo.

Banco de dados MDS criado:

<img width="933" alt="image" src="https://user-images.githubusercontent.com/36814309/224581444-d6e68889-f975-4848-82de-13e506f96112.png">


<h3>Integração dos dados:</h3>

Para a integração dos dados, utilizei a ferramenta Airbyte. Após criar a conta, fiz a primeira connection do Mongo DB para o Snowflake.
A configuração é bastante simples, basta informar os parâmetros de URL do cluster, database, user e password. O único ponto de atenção, é garante que seu cluster de origem esteja devidamente configurado para que possa ser acessado.

Conexão com o Mongo DB para o Snowflake:

<img width="944" alt="image" src="https://user-images.githubusercontent.com/36814309/224584101-5ac2914a-ee62-4aac-8d86-d2a0b0225685.png">


Criação do schema STG_MDS e suas tabelas no Snowflake após rodar a primeira integração com o Airbyte:

<img width="920" alt="image" src="https://user-images.githubusercontent.com/36814309/224584810-382343f7-d627-48f2-8d27-abc91eb3916c.png">






