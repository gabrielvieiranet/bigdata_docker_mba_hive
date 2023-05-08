# BIGDATA DOCKER MBA HIVE

## OBJETIVO 
O objetivo da atividade é dividido em duas partes:
  #### Primeira parte:
  * Carregar os dados no HDFS os arquivos que estão localizados no diretório: [Trabalho HIVE](https://drive.google.com/drive/folders/1OfZTSYcgcun-S7UFNVAzbcr0-PzlEc08);
  * Criar um database no HIVE com o nome AdventureWorks;
  * Consultar dados sobre Pessoas e “serviços” consumidos;
  * Criar uma tabela com a visão dos tipos de serviço/Aventura contratados agregados;
  * Criar uma tabela com dados para seguimentação e analíse dos clientes;
  
  #### Segunda parte:
  * Modelar uma flattened table com os KPIS que nosso grupo decidiu como essênciais para monitoramento do negócio, pensando no ponto de vista de venda/contratação.

## PROPOSTA
Decidimos então rodar em etapas (macro scripts) com objetivo de dividir ainda mais a atividade e facilidando o melhor entendimento na execução/documentação da atividade. 

O processo é divido em 4 scripts: 
```shell
0-setup.sh
1-sor.sh
2-sot.sh
3-spec.sh
```


## EXECUÇÃO (Como rodar a proposta)
Vamos executar o primeiro script __0-setup.sh__, no qual sua funcionalidade é: 
  * Cria a estrutura de diretórios no HDFS 
    ```shell 
    dk-exec-namenode 'hadoop fs -mkdir -p /mba-data/sor'     # raw data
    dk-exec-namenode 'hadoop fs -mkdir -p /mba-data/sot'     # treated data
    dk-exec-namenode 'hadoop fs -mkdir -p /mba-data/spec'    # visions
    ```
  * Copiar os arquivos CSV para dentro do diretório local no NAMENODE
    ```shell 
    dk-exec-namenode 'rm -rf /mba-data'
    docker cp ./files/hadoop namenode:/mba-data
    ```
  * Copiar os arquivos CSV do NAMENODE para os diretórios criados no HDFS
    ```shell 
    dk-exec-namenode 'hadoop fs -put -p /mba-data/* /mba-data/sor'
    ```
  * Criar o database AventureWorks
    ```shell 
    dk-exec-hive 'hive -f /mba-scripts/setup.hql'
    ```

Em seguida, vamos executar o script __1-sor.sh__:

  * HADOOP - mover os arquivos:
    ```shell 
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_address'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_customer'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_customeraddress'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_product'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_productcategory'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_productdescription'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_productmodel'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_productmodeldescription'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_salesorderdetail'
    dk-exec-nodename 'hadoop fs -mkdir -p /mba-data/sor/tb_sor_salesorderhead'

    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/address.csv /mba-data/sor/tb_sor_address/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/customer.csv /mba-data/sor/tb_sor_customer/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/customeraddress.csv /mba-data/sor/tb_sor_customeraddress/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/product.csv /mba-data/sor/tb_sor_product/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/productcategory.csv /mba-data/sor/tb_sor_productcategory/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/productdescription.csv /mba-data/sor/tb_sor_productdescription/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/productmodel.csv /mba-data/sor/tb_sor_productmodel/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/productmodeldescription.csv /mba-data/sor/tb_sor_productmodeldescription/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/salesorderdetail.csv /mba-data/sor/tb_sor_salesorderdetail/000000_0'
    dk-exec-nodename 'hadoop fs -mv /mba-data/sor/salesorderhead.csv /mba-data/sor/tb_sor_salesorderhead/000000_0'
    ```

  * HIVE - Criar as tabelas dos arquivos exportados para o HDFS no database
    ```shell
    dk-exec-hive 'hive -f /mba-scripts/sor.hql'
    ```
    
Próximo passo, vamos executar o script __2-sot.sh__ no qual executamos a parte 2 da atividade. Criamos uma flattened table com os KPIS que entendemos como essênciais para o negócio:

  * Vamos criar o flattened table:
    ```shell
    dk-exec-hive 'hive -f /mba-scripts/sot.hql'
    ```
    
E finalizando, vamos trazer uma consulta com a relação de pessoas e serviços. Também será criado duas novas tabelas:
  * Uma tabela com a visão dos tipos de serviço/Aventura contratados agregados.
  * Uma tabela com dados para seguimentação e analíse dos clientes.
  
Evidência da consulta relacionando pessoas com os serviços consumidos:
![imagem relacionada a pessoas e serviços](/files/consulta-pessoas-servicos.jpeg)

