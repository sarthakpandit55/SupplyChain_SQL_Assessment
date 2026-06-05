CREATE TABLE SUPPLIERS(
	supplier_id INT PRIMARY KEY,
	supplier_name VARCHAR(50) NOT NULL,
	supplier_region VARCHAR(50) CHECK(supplier_region IN ('North America', 'Europe', 'Asia', 'Middle East', 'Africa')) NOT NULL,
	supplier_rating DECIMAL CHECK(supplier_rating BETWEEN 1 AND 5) NOT NULL,
	supplier_type VARCHAR(50) CHECK(supplier_type IN ('Supplier', 'Distributor', 'Manufacturer', 'Wholesaler')),
	contract_value DECIMAL CHECK(contract_value >= 10000),
	onboarding_date DATE NOT NULL,
	contact_email VARCHAR(70) NOT NULL
);



COPY SUPPLIERS(supplier_id, supplier_name, supplier_region, supplier_rating, supplier_type, contract_value, onboarding_date, contact_email)
FROM 'C:\suppliers_data.csv'
DELIMITER ','
HEADER CSV

SELECT * FROM SUPPLIERS;


CREATE TABLE SHIPMENTS(
	shipment_id INT PRIMARY KEY,
	supplier_id INT NOT NULL,
	warehouse_name VARCHAR(50) CHECK(warehouse_name IN ('Ware House A', 'Ware House B', 'Ware House C', 'Ware House D', 'Ware House E')),
	shipment_date DATE NOT NULL,
	delivery_date DATE NOT NULL,
	quantity_shipped INT CHECK(quantity_shipped BETWEEN 1 AND 100) NOT NULL,
	transportation_cost DECIMAL CHECK(transportation_cost BETWEEN 100.0 AND 10000.0) NOT NULL,
	shipment_status VARCHAR CHECK(shipment_status IN ('Delivered', 'Delayed', 'In Transit', 'Cancelled')) NOT NULL,
	product_category VARCHAR CHECK(product_category IN ('Electronics','Automotive', 'Pharma', 'FMCG', 'Industrial')) NOT NULL,

	FOREIGN KEY(supplier_id) REFERENCES SUPPLIERS(supplier_id)
);

COPY SHIPMENTS(shipment_id, supplier_id, warehouse_name, shipment_date, delivery_date, quantity_shipped, transportation_cost, shipment_status, product_category)
FROM 'C:\shipment_data.csv'
DELIMITER ','
HEADER CSV

SELECT * FROM SHIPMENTS;
