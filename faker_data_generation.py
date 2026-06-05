import pandas as pd
from faker import Faker 
import random
from datetime import datetime,timedelta
fake=Faker()
supplier_data=[]

supplier_region=['NorthAmerica','Europe','Asia','MiddleEast','Africa']
supplier_type=['suppliar','distributer','wholasaler']
# supplier_data=[]
for i in range(1,501):
  supplier_data.append({
    "supplier_id":i,
    "supplier_name":fake.name(),
    "supplier_region":random.choice(supplier_region),
    "supplier_rating":round(random.uniform(1.0,5.0),2),
    "supplier_type":random.choice(supplier_type),
    "contract_value":round(random.uniform(10000.0,50000.0),2),
    "contract_date":fake.date(),
    "contact_email":fake.email()
  })

df=pd.DataFrame(supplier_data)
df.to_csv('suppliers.csv',index=False)

Shipments_data=[]
warehouse_name=['warehouse_A','warehouse_B','warehouse_C','warehouse_D','warehouse_E']
# shipment_date=
shipment_status=['Delivered','Delayed','In Transit','Cancelled']
product_category=['Electronics','Automotive','Pharma','FMCG','Industrial']



for i in range(1,10000):
  shipment_date_fake_gen=fake.date_between(start_date='-30d', end_date='today')
  delivery_date_fake_gen=shipment_date_fake_gen+timedelta(days=random.randint(1,20))


  Shipments_data.append({
    "shipment_id":i,
    "supplier_id":random.randint(1,500),
    "warehouse_name":random.choice(warehouse_name),
    "shipment_date":shipment_date_fake_gen,
    "delivery_date":delivery_date_fake_gen,
    "quantity_shipped":random.randint(1,100),
    "transportation_cost":round(random.uniform(100.0,10000.0),2),
    "shipment_status":random.choice(shipment_status),
    "product_category":random.choice(product_category)
  })

df=pd.DataFrame(Shipments_data)
df.to_csv('shipments.csv',index=False)
