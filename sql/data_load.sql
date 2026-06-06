COPY suppliers(supplier_id,supplier_name,supplier_region,supplier_rating,supplier_type,contract_value,onboarding_date,contact_email)
FROM 'C:/PostgreSQL_data/suppliers.csv'
DELIMITER ','
CSV HEADER


COPY shipments(shipment_id,supplier_id,warehouse_name,shipment_date,delivery_date,quantity_shipped,transportation_cost,shipment_status,product_category)
FROM 'C:/PostgreSQL_data/shipments.csv'
DELIMITER ','
CSV HEADER