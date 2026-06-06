from faker import Faker
import pandas as pd
import random
from datetime import timedelta

fake = Faker()

suppliers_data = []
shipment_data = []

for i in range(500):
    suppliers_data.append({
        'supplier_id' : i + 1,
        'supplier_name' : fake.name(),
        'supplier_region' : random.choice(['North America', 'Europe', 'Asia', 'Middle East', 'Africa']),
        'supplier_rating' : round(random.uniform(1.0, 5.0)),
        'supplier_type' : random.choice(['Supplier', 'Distributor', 'Manufacturer', 'Wholesaler']),
        'contract_value' : round(random.uniform(10000, 50000),2),
        'onboarding_date' : fake.date(),
        'contact_email' : fake.email()
    })

df = pd.DataFrame(suppliers_data)

df.to_csv('suppliers_data.csv', index=False)

for j in range(10000):
    shipment_date = fake.date_between(start_date='-30d', end_date='today')
    delivery_date = shipment_date + timedelta(days = random.randint(1,10))
    shipment_data.append({
        'shipment_id' : j + 1,
        'supplier_id' : random.randint(1, 500),
        'warehouse_name' : random.choice(['Ware House A', 'Ware House B', 'Ware House C', 'Ware House D', 'Ware House E']),
        'shipment_date' : shipment_date,
        'delivery_date' : delivery_date,
        'quantity_shipped' : random.randint(1, 100),
        'transportation_cost' :  round(random.uniform(100.0, 10000.0)),
        'shipment_status' : random.choice(['Delivered', 'Delayed', 'In Transit', 'Cancelled']),
        'product_category' : random.choice(['Electronics', 'Automotive', 'Pharma', 'FMCG', 'Industrial'])
    })

de = pd.DataFrame(shipment_data)
de.to_csv('shipment_data.csv', index=False)


print("Data Generated Successfully.")
