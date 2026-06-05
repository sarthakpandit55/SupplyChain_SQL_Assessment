SELECT shipment_date, delivery_date ,
delivery_date-shipment_date AS lead_time
FROM shipments;

SELECT quantity_shipped,
sum(quantity_shipped)
OVER(
 PARTITION BY  warehouse_name
 ORDER BY shipment_date
)
FROM shipments;


SELECT shipment_date, transportation_cost,
AVG(transportation_cost)
OVER (
ORDER BY shipment_date
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS moving_avg_cost
FROM shipments;



CREATE INDEX idx_supplier_id ON shipments(supplier_id);
CREATE INDEX idx_shipment_date ON shipments(shipment_date);
CREATE INDEX idx_shipment_status ON shipments(shipment_status);

EXPLAIN ANALYZE
SELECT * from shipments
WHERE supplier_id=100;

EXPLAIN ANALYZE
SELECT * from shipments
WHERE shipment_date='2026-05-18';

EXPLAIN ANALYZE
SELECT * FROM shipments
WHERE shipment_status='Cancelled';

