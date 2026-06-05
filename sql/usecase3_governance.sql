CREATE OR REPLACE FUNCTION check_delivery_date()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.delivery_date < NEW.shipment_date THEN
        RAISE EXCEPTION 'Delivery date cannot be earlier than shipment date';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validate_delivery_date
BEFORE INSERT ON SHIPMENTS
FOR EACH ROW
EXECUTE FUNCTION check_delivery_date();

-- test
INSERT INTO SHIPMENTS
(supplier_id, shipment_date, delivery_date)
VALUES
(1, '2026-06-01', '2026-06-05');


CREATE TABLE shipment_audit (
    audit_id SERIAL PRIMARY KEY,
    shipment_id INT,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(shipment_id) REFERENCES SHIPMENTS(shipment_id)
);

CREATE OR REPLACE FUNCTION log_shipment_status_change()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO shipment_audit (
            shipment_id,
            old_status,
            new_status,
            modified_timestamp
        )
        VALUES (
            NEW.shipment_id,
            OLD.status,
            NEW.status,
            CURRENT_TIMESTAMP
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER shipment_status_audit
AFTER UPDATE ON shipments
FOR EACH ROW
EXECUTE FUNCTION log_shipment_status_change();

-- test
UPDATE shipments
SET status = 'Delivered'
WHERE shipment_id = 1;