#!/bin/bash

# CONFIG
C1='\033[1;32m' # Color 1
C2='\033[1;36m' # Color 2
NC='\033[0m'    # No Color
alias dk-exec-namenode='docker exec -it namenode bash -c '
alias dk-exec-hive='docker exec -it hive-server bash -c '

echo -e "\n${C1}::: SPEC LEVEL :::${NC}\n"

# HIVE - CREATE TABLES
dk-exec-hive 'hive -f /mba-scripts/spec.hql'