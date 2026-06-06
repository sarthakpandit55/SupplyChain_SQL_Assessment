CREATE TABLE suppliers(
	supplier_id SERIAL PRIMARY KEY,
	supplier_name VARCHAR(50) CHECK( LENGTH(supplier_name) > 2) NOT NULL,
	supplier_region VARCHAR(50) NOT NULL,
	supplier_rating DECIMAL(3,2) CHECK(supplier_rating BETWEEN 1.0 AND 5.0) NOT NULL,
	supplier_type VARCHAR(50) CHECK(supplier_type IN ('Supplier','Distributor','Manufacturer','Wholesaler')) NOT NULL,
	contract_value DECIMAL(7,2) CHECK(contract_value > 10000) NOT NULL ,
	onboarding_date DATE  DEFAULT CURRENT_DATE,
	contact_email VARCHAR(50) NOT NULL
)


COPY suppliers(supplier_id,supplier_name,supplier_region,supplier_rating,supplier_type,contract_value,onboarding_date,contact_email)
FROM 'C:/PostgreSQL_data/suppliers.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM suppliers

CREATE TABLE shipments(
	shipment_id SERIAL PRIMARY KEY,
	supplier_id INT NOT NULL,
	warehouse_name VARCHAR(50) CHECK(warehouse_name IN('Warehouse_A','Warehouse_B','Warehouse_C','Warehouse_D','Warehouse_E')) NOT NULL,
	shipment_date DATE DEFAULT CURRENT_DATE,
	delivery_date DATE DEFAULT CURRENT_DATE,
	quantity_shipped INT CHECK(quantity_shipped > 0) NOT NULL,
	transportation_cost DECIMAL(7,2) CHECK(transportation_cost > 0) NOT NULL,
	shipment_status VARCHAR(30) CHECK(shipment_status IN ('Delivered','Delayed','In Transit','Cancelled')) DEFAULT 'In Transit',
	product_category VARCHAR(30) CHECK(product_category IN ('Electronics','Automotive','Pharma','FMCG','Industrial')) NOT NULL,

	FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id)
	
)

COPY shipments(shipment_id,supplier_id,warehouse_name,shipment_date,delivery_date,quantity_shipped,transportation_cost,shipment_status,product_category)
FROM 'C:/PostgreSQL_data/shipments.csv'
DELIMITER ','
CSV HEADER


