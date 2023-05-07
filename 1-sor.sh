#!/bin/bash

# TODO
# [ ] criar tabela address.csv
# [ ] criar tabela customer.csv
# [ ] criar tabela customeraddress.csv
# [ ] criar tabela product.csv
# [ ] criar tabela productcategory.csv
# [ ] criar tabela productdescription.csv
# [x] criar tabela productmodel.csv
# [ ] criar tabela productmodeldescription.csv
# [ ] criar tabela salesorderdetail.csv
# [ ] criar tabela salesorderhead.csv

# CONFIG
C1='\033[1;32m' # Color 1
C2='\033[1;36m' # Color 2
NC='\033[0m'    # No Color
alias dk-exec-nodename='docker exec -i namenode bash -c'
alias dk-exec-hive='docker exec -it hive-server bash -c '

echo -e "\n${C1}::: SOR LEVEL :::${NC}\n"

# HADOOP - mover arquivos
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

# HIVE - CREATE TABLES
dk-exec-hive 'hive -f /mba-scripts/sor.hql'
