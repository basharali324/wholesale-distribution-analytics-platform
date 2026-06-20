import pandas as pd
import numpy as np
import random
from pathlib import Path

NUM_ORDERS = 500_000

customers = pd.read_csv(
    "data/raw/customers.csv"
)

warehouses = pd.read_csv(
    "data/raw/warehouses.csv"
)

customer_ids = customers["CustomerID"].tolist()

warehouse_ids = warehouses[
    "WarehouseID"
].tolist()

statuses = [
    "Delivered",
    "Shipped",
    "Approved",
    "Pending",
    "Cancelled"
]

weights = [
    0.80,
    0.10,
    0.05,
    0.03,
    0.02
]

orders = []

dates = pd.date_range(
    start="2022-01-01",
    end="2025-12-31"
)

for i in range(1, NUM_ORDERS + 1):

    order_date = np.random.choice(dates)

    orders.append(
        {
            "OrderID": f"ORD-{i:07}",
            "CustomerID": random.choice(
                customer_ids
            ),
            "WarehouseID": random.choice(
                warehouse_ids
            ),
            "OrderDate": order_date,
            "OrderStatus": random.choices(
                statuses,
                weights=weights
            )[0]
        }
    )

df = pd.DataFrame(orders)

Path("data/raw").mkdir(
    parents=True,
    exist_ok=True
)

df.to_csv(
    "data/raw/orders.csv",
    index=False
)

print(
    f"{len(df):,} orders generated"
)