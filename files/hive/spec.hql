USE adventureworks;

-- tb_spec_orders_by_salesperson
DROP TABLE IF EXISTS tb_spec_orders_by_salesperson;

CREATE TABLE IF NOT EXISTS tb_spec_orders_by_salesperson
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/spec/tb_spec_orders_by_salesperson'
AS
SELECT
	salesperson,
	SUM(totaldue) total_valor,
	COUNT(1) total_vendas
FROM
(
	SELECT DISTINCT salesperson, salesorderid, totaldue
    FROM tb_sot_orders_flat
) AUX
GROUP BY
	salesperson;


-- tb_spec_orders_by_customer
DROP TABLE IF EXISTS tb_spec_orders_by_customer;

CREATE TABLE IF NOT EXISTS tb_spec_orders_by_customer
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/spec/tb_spec_orders_by_customer'
AS
SELECT
	customerid,
	SUM(totaldue) total_valor,
	COUNT(1) total_vendas
FROM
(
	SELECT distinct customerid, salesorderid, totaldue from tb_sot_orders_flat
) AUX
GROUP BY
	customerid
ORDER BY
	total_valor DESC

-- tb_spec_orders_by_product
DROP TABLE IF EXISTS tb_spec_orders_by_product;

CREATE TABLE IF NOT EXISTS tb_spec_orders_by_product
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/spec/tb_spec_orders_by_product'
AS
SELECT
	productid,
	SUM(totaldue) total_valor,
	COUNT(1) total_vendas
FROM
(
	SELECT distinct productid, salesorderid, totaldue from tb_sot_orders_flat
) AUX
GROUP BY
	productid
ORDER BY
	total_valor DESC    