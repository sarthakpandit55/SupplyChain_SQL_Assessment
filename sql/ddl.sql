CREATE TABLE suppliers(
  supplier_id serial PRIMARY KEY,
  supplier_name VARCHAR(70) not null,
  supplier_region VARCHAR(70) not null,
  supplier_rating DECIMAL ,
  supplier_type VARCHAR(70) not null,
  contract_value DECIMAL not null,
  onboarding_date DATE ,
  contact_email VARCHAR not null 
);


CREATE TABLE shipments(
shipment_id serial PRIMARY KEY,
supplier_id int not null,
FOREIGN KEY(supplier_id)
           REFERENCES suppliers(supplier_id),
warehouse_name VARCHAR(50) not null,
shipment_date date DEFAULT current_date,
delivery_date date DEFAULT current_date,
quantity_shipped INT not null,
transportation_cost DECIMAL not null,
shipment_status VARCHAR(50) not null,
product_category VARCHAR(50) not null
);


