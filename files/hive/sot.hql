USE adventureworks;

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
	tb_sor_product P ON (P.productid = SD.productid);