import pandas as pd
import random
from pathlib import Path

random.seed(42)

# ----------------------------------
# LOAD ORDERS
# ----------------------------------

orders = pd.read_csv(
    "data/raw/orders.csv"
)

orders["OrderDate"] = pd.to_datetime(
    orders["OrderDate"]
)

records = []

# ----------------------------------
# GENERATE LIFECYCLE EVENTS
# ----------------------------------

for _, order in orders.iterrows():

    order_date = order["OrderDate"]
    status = order["OrderStatus"]

    approval_date = None
    pick_date = None
    ship_date = None
    delivery_date = None

    if status == "Cancelled":

        approval_date = (
            order_date +
            pd.Timedelta(
                days=random.randint(0, 2)
            )
        )

    elif status == "Pending":

        approval_date = (
            order_date +
            pd.Timedelta(
                days=random.randint(0, 2)
            )
        )

    else:

        approval_date = (
            order_date +
            pd.Timedelta(
                days=random.randint(0, 2)
            )
        )

        pick_date = (
            approval_date +
            pd.Timedelta(
                days=random.randint(0, 2)
            )
        )

        ship_date = (
            pick_date +
            pd.Timedelta(
                days=random.randint(1, 4)
            )
        )

        if status == "Delivered":

            delivery_date = (
                ship_date +
                pd.Timedelta(
                    days=random.randint(1, 7)
                )
            )

    records.append(
        {
            "OrderID":
                order["OrderID"],

            "CustomerID":
                order["CustomerID"],

            "WarehouseID":
                order["WarehouseID"],

            "OrderDate":
                order_date.date(),

            "ApprovalDate":
                approval_date.date()
                if approval_date is not None
                else None,

            "PickDate":
                pick_date.date()
                if pick_date is not None
                else None,

            "ShipDate":
                ship_date.date()
                if ship_date is not None
                else None,

            "DeliveryDate":
                delivery_date.date()
                if delivery_date is not None
                else None,

            "OrderStatus":
                status
        }
    )

# ----------------------------------
# SAVE
# ----------------------------------

df = pd.DataFrame(records)

Path(
    "data/raw"
).mkdir(
    parents=True,
    exist_ok=True
)

df.to_csv(
    "data/raw/order_lifecycle.csv",
    index=False
)

# ----------------------------------
# VALIDATION
# ----------------------------------

assert len(df) == len(orders)

assert (
    df["OrderID"].nunique()
    ==
    len(df)
)

print("=" * 60)
print(
    f"Order Lifecycle Rows: "
    f"{len(df):,}"
)
print(
    f"Unique Orders: "
    f"{df['OrderID'].nunique():,}"
)
print(
    f"Date Range: "
    f"{df['OrderDate'].min()} "
    f"to "
    f"{df['OrderDate'].max()}"
)
print("=" * 60)