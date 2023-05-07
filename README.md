# BIGDATA DOCKER MBA HIVE

## OBJETIVO 
O objetivo da atividade é dividido em duas partes:
  #### Primeira parte:
  * Carregar os dados no HDFS os arquivos que estão localizados no diretório: [Trabalho HIVE](https://drive.google.com/drive/folders/1OfZTSYcgcun-S7UFNVAzbcr0-PzlEc08);
  * Criar um database no HIVE com o nome AdventureWorks
  * Consultar dados sobre Pessoas e “serviços” consumidos;
  * Criar uma tabela com a visão dos tipos de serviço/Aventura contratados agregados;
  * Criar uma tabela com dados para seguimentação e analíse dos clients;
  
  #### Segunda parte:
  * Modelar uma flattened table com os KPIS que nosso grupo decidiu como essênciais para monitoramento do negócio, pensando no ponto de vista de venda/contratação.

## PROPOSTA
Decidimos então rodar em etapas (macro scripts) com objetivo de dividir ainda mais a atividade e facilidando o melhor entendimento na execução/documentação. 


## EXECUÇÃO (Como rodar a proposta)

## NOSSA IDEA 
Trabalho sobre Hive

namenode --> executa script de mover arquivos CSV para dentro do HDFS

hive-server --> executa script de criacao de tabelas

```
hive -f /mba-scripts/exemplo.hql
```

hive-server --> executa script de insercao 

teste igor
