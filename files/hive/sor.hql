USE adventureworks;

DROP TABLE IF EXISTS tb_sor_address;
DROP TABLE IF EXISTS tb_sor_customer;
DROP TABLE IF EXISTS tb_sor_customeraddress;
DROP TABLE IF EXISTS tb_sor_product;
DROP TABLE IF EXISTS tb_sor_productcategory;
DROP TABLE IF EXISTS tb_sor_productdescription;
DROP TABLE IF EXISTS tb_sor_productmodel;
DROP TABLE IF EXISTS tb_sor_productmodeldescription;
DROP TABLE IF EXISTS tb_sor_salesorderdetail;
DROP TABLE IF EXISTS tb_sor_salesorderhead;

-- tb_sor_address
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_address (
  AddressID STRING,
  AddressLine1 STRING,
  AddressLine2 STRING,
  City STRING,
  PostalCode STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_address'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_customer
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_customer (
  CustomerID STRING,
  Title STRING,
  Suffix STRING,
  CompanyName STRING,
  SalesPerson STRING,
  EmailAddress STRING,
  PasswordHash STRING,
  PasswordSalt STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_customer'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_customeraddress
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_customeraddress (
  CustomerID STRING,
  AddressID STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_customeraddress'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_product
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_product (
  ProductID STRING,
  ProductNumber STRING,
  Color STRING,
  StandardCost STRING,
  ListPrice STRING,
  Size STRING,
  Weight STRING,
  ProductCategoryID STRING,
  ProductModelID STRING,
  SellStartDate STRING,
  SellEndDate STRING,
  DiscontinuedDate STRING,
  ThumbNailPhoto STRING,
  ThumbnailPhotoFileName STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_product'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_productcategory
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_productcategory (
  ProductCategoryID STRING,
  ParentProductCategoryID STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_productcategory'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_productdescription
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_productdescription (
  ProductDescriptionID STRING,
  Description STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_productdescription'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_productmodel
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_productmodel (
  ProductModelID STRING,
  CatalogDescription STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_productmodel'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_productmodeldescription
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_productmodeldescription (
  ProductModelID STRING,
  ProductDescriptionID STRING,
  Culture STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_productmodeldescription'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_salesorderdetail
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_salesorderdetail (
  SalesOrderID STRING,
  SalesOrderDetailID STRING,
  OrderQty STRING,
  ProductID STRING,
  UnitPrice STRING,
  UnitPriceDiscount STRING,
  LineTotal STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_salesorderdetail'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- tb_sor_salesorderhead
CREATE EXTERNAL TABLE IF NOT EXISTS tb_sor_salesorderhead (
  SalesOrderID STRING,
  RevisionNumber STRING,
  OrderDate STRING,
  DueDate STRING,
  ShipDate STRING,
  Status STRING,
  SalesOrderNumber STRING,
  CustomerID STRING,
  ShipToAddressID STRING,
  BillToAddressID STRING,
  ShipMethod STRING,
  CreditCardApprovalCode STRING,
  SubTotal STRING,
  TaxAmt STRING,
  Freight STRING,
  TotalDue STRING,
  Comment STRING,
  rowguid STRING,
  ModifiedDate STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION '/mba-data/sor/tb_sor_salesorderhead'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- SELECT COUNT(1) FROM tb_sor_address;
-- SELECT COUNT(1) FROM tb_sor_customer;
-- SELECT COUNT(1) FROM tb_sor_customeraddress;
-- SELECT COUNT(1) FROM tb_sor_product;
-- SELECT COUNT(1) FROM tb_sor_productcategory;
-- SELECT COUNT(1) FROM tb_sor_productdescription;
-- SELECT COUNT(1) FROM tb_sor_productmodel;
-- SELECT COUNT(1) FROM tb_sor_productmodeldescription;
-- SELECT COUNT(1) FROM tb_sor_salesorderdetail;
-- SELECT COUNT(1) FROM tb_sor_salesorderhead;