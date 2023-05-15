USE adventureworks;

-- tb_sot_clients_flat
DROP TABLE IF EXISTS tb_sot_clients_flat;

CREATE TABLE IF NOT EXISTS tb_sot_clients_flat 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sot/tb_sot_clients_flat'
AS
SELECT
	C.customerid,
	C.title,
	C.suffix,
	C.companyname,
	C.salesperson,
	C.emailaddress,
	A.addressid,
	A.addressline1,
	A.addressline2,
	A.city,
	A.postalcode
FROM
	tb_sor_customer C
LEFT OUTER JOIN
	tb_sor_customeraddress CA ON (CA.customerid = C.customerid)
LEFT OUTER JOIN
	tb_sor_address A ON (A.addressid = CA.addressid);

-- tb_sot_products_flat
DROP TABLE IF EXISTS tb_sot_products_flat;

CREATE TABLE IF NOT EXISTS tb_sot_products_flat 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sot/tb_sot_products_flat'
AS
SELECT
	P.productid,
	P.productnumber,
	P.color,
	P.standardcost,
	P.listprice,
	P.size,
	P.weight,
	P.productcategoryid,
	PC.parentproductcategoryid,
	P.productmodelid,
	P.sellstartdate,
	P.sellenddate,
	P.discontinueddate,
	PMD.culture,
	PD.description
FROM
	tb_sor_product P
LEFT OUTER JOIN
	tb_sor_productcategory PC ON (PC.productcategoryid = P.productcategoryid)
LEFT OUTER JOIN
	tb_sor_productmodeldescription PMD ON (PMD.productmodelid = P.productmodelid)	
LEFT OUTER JOIN
	tb_sor_productdescription PD ON (PD.productdescriptionid = PMD.productdescriptionid);

-- tb_sot_orders_flat
DROP TABLE IF EXISTS tb_sot_orders_flat;

CREATE TABLE IF NOT EXISTS tb_sot_orders_flat 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sot/tb_sot_orders_flat'
AS
SELECT
	C.customerid,
	C.companyname,
	C.salesperson,
	A.addressid,
	A.addressline1,
	A.addressline2,
	A.city,
	A.postalcode,
	S.salesorderid,
	S.orderdate,
	S.duedate,
	S.shipdate,
	S.status,
	S.salesordernumber,
	S.shiptoaddressid,
	S.billtoaddressid,
	S.shipmethod,
	S.subtotal,
	S.taxamt,
	S.freight,
	S.totaldue,
	SD.salesorderdetailid,
	SD.orderqty,
	SD.unitprice,
	SD.unitpricediscount,
	SD.linetotal,
	P.productid,
	P.productnumber,
	P.color,
	P.standardcost,
	P.listprice,
	P.size,
	P.weight,
	P.productcategoryid,
    PC.parentproductcategoryid,
	P.productmodelid,
	P.sellstartdate,
	P.sellenddate,
	P.discontinueddate
FROM
	tb_sor_customer C
LEFT OUTER JOIN
	tb_sor_customeraddress CA ON (CA.customerid = C.customerid)
LEFT OUTER JOIN
	tb_sor_address A ON (A.addressid = CA.addressid)
JOIN
	tb_sor_salesorderhead S ON (S.customerid = C.customerid)
LEFT OUTER JOIN
	tb_sor_salesorderdetail SD ON (SD.salesorderid = S.salesorderid)
LEFT OUTER JOIN
	tb_sor_product P ON (P.productid = SD.productid)
LEFT OUTER JOIN
	tb_sor_productcategory PC ON (PC.productcategoryid = P.productcategoryid);
