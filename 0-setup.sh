#!/bin/bash

# CONFIG
C1='\033[1;32m' # Color 1
C2='\033[1;36m' # Color 2
NC='\033[0m'    # No Color
alias dk-exec-namenode='docker exec -it namenode bash -c '
alias dk-exec-hive='docker exec -it hive-server bash -c '

echo -e "\n${C1}::: SETUP :::${NC}\n"

# HDFS - Destroi estrutura de diretorios
dk-exec-namenode 'hadoop fs -rm -R /mba-data'

# HDFS - Cria estrutura de diretorios
dk-exec-namenode 'hadoop fs -mkdir -p /mba-data/sor'     # raw data
dk-exec-namenode 'hadoop fs -mkdir -p /mba-data/sot'     # treated data
dk-exec-namenode 'hadoop fs -mkdir -p /mba-data/spec'    # visions

# NAMENODE - Copia arquivos CSV para diretorio local
dk-exec-namenode 'rm -rf /mba-data'
docker cp ./files/hadoop namenode:/mba-data

# HDFS - Copia arquivos CSV
dk-exec-namenode 'hadoop fs -put -p /mba-data/* /mba-data/sor'

# HIVE - DROP e CREATE Database AventureWorks
dk-exec-hive 'hive -f /mba-scripts/setup.hql'
