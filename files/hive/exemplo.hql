create database if not exists AdventureWorks;
use AdventureWorks;
create external table if not exists employee (
  eid int,
  ename string,
  age int,
  jobtype string,
  storeid int,
  storelocation string,
  salary bigint,
  yrsofexp int
)
row format delimited
fields terminated by ','
stored as textfile location '/user/hive/warehouse/employee';