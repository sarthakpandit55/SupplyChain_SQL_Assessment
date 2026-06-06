from faker import Faker
import pandas as pd
import random
from datetime import timedelta

fake= Faker()

# suppliers_data=[]
# suppliers=['Supplier','Distributor','Manufacturer','Wholesaler']

# for i in range(500):
#     suppliers_data.append({
#         "supplier_id":i+1,
#         "supplier_name":fake.name(),
#         "supplier_region": random.choice(['North America','Europe','Asia','Middle East','Africa']),
#         "supplier_rating": round(random.uniform(1.0,5.0),2),
#         "supplier_type": random.choice(suppliers),
#         "contract_value":round(random.uniform(10000,50000),2),
#         "onboarding_date":fake.date(),
#         "contact_email":fake.email()
#     })

# df= pd.DataFrame(suppliers_data)
# df.to_csv('suppliers.csv',index=False)


shipments_data=[]
warehouse_name=['Warehouse_A','Warehouse_B','Warehouse_C','Warehouse_D','Warehouse_E']
shipment_status=['Delivered','Delayed','In Transit','Cancelled']
product_category=['Electronics','Automotive','Pharma','FMCG','Industrial']
for i in range(10000):
    shipment_date = fake.date_between(start_date='-30d', end_date='today')
    delivery_date = shipment_date + timedelta(days=random.randint(1,20))

    shipments_data.append({
        "shipment_id": i+1,
        "supplier_id": random.randint(1,500),
        "warehouse_name": random.choice(warehouse_name),
        "shipment_date": shipment_date,
        "delivery_date": delivery_date,
        "quantity_shipped":random.randint(1,100),
        "transportation_cost": round(random.uniform(100.0,10000.0),2),
        "shipment_status": random.choice(shipment_status),
        "product_category": random.choice(product_category)
    })

df= pd.DataFrame(shipments_data)
df.to_csv('shipments.csv', index=False)
