

SELECT sup.supplier_name,sup.supplier_region,COUNT(shp.shipment_id) AS TotalShipments, AVG(shp.transportation_cost) AS AverageTransportationCost  FROM suppliers AS sup JOIN shipments AS shp ON sup.supplier_id= shp.supplier_id GROUP BY sup.supplier_name,sup.supplier_region ORDER BY sup.supplier_name;
SELECT  supplier_id ,quantity_shipped, DENSE_RANK() OVER(PARTITION BY supplier_id ORDER BY quantity_shipped DESC ) FROM shipments;

SELECT supplier_region,contract_value,AVG(contract_value) OVER(PARTITION BY supplier_region) AS REGIONALAVERAGECONTRACT, contract_value - AVG(contract_value) OVER(PARTITION BY supplier_region) AS RegionalAverage FROM suppliers ;
