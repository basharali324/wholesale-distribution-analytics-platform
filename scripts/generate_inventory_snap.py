import pandas as pd
import random
from pathlib import Path

# ----------------------------------
# CONFIG
# ----------------------------------

random.seed(42)

PRODUCT_SAMPLE_SIZE = 10000
SNAPSHOT_DAYS = 30

# ----------------------------------
# LOAD MASTER DATA
# ----------------------------------

products = pd.read_csv(
    "data/raw/products.csv"
)

warehouses = pd.read_csv(
    "data/raw/warehouses.csv"
)

orders = pd.read_csv(
    "data/raw/orders.csv"
)

# ----------------------------------
# ALIGN TO SALES DATA
# ----------------------------------

orders["OrderDate"] = pd.to_datetime(
    orders["OrderDate"]
)

latest_order_date = orders[
    "OrderDate"
].max()

start_date = (
    latest_order_date
    - pd.Timedelta(days=SNAPSHOT_DAYS - 1)
)

snapshot_dates = pd.date_range(
    start=start_date,
    end=latest_order_date
)

print(
    f"Generating inventory from "
    f"{start_date.date()} "
    f"to "
    f"{latest_order_date.date()}"
)

# ----------------------------------
# DEVELOPMENT SIZE CONTROL
# ----------------------------------

products = products.head(
    PRODUCT_SAMPLE_SIZE
)

# ----------------------------------
# GENERATE SNAPSHOTS
# ----------------------------------

records = []

for _, product in products.iterrows():

    product_id = product["ProductID"]
    unit_cost = product["UnitCost"]

    for _, warehouse in warehouses.iterrows():

        warehouse_id = warehouse["WarehouseID"]

        # starting inventory level
        current_stock = random.randint(
            200,
            1000
        )

        for snapshot_date in snapshot_dates:

            # simulate daily movement
            movement = random.randint(
                -50,
                50
            )

            current_stock = max(
                0,
                current_stock + movement
            )

            reserved_qty = min(
                current_stock,
                random.randint(
                    0,
                    max(
                        0,
                        int(current_stock * 0.20)
                    )
                )
            )

            available_qty = (
                current_stock
                - reserved_qty
            )           

            available_qty = (
                current_stock
                - reserved_qty
            )

            inventory_value = round(
                current_stock
                * unit_cost,
                2
            )

            records.append(
                {
                    "SnapshotDate":
                        snapshot_date.date(),

                    "ProductID":
                        product_id,

                    "WarehouseID":
                        warehouse_id,

                    "OnHandQty":
                        current_stock,

                    "ReservedQty":
                        reserved_qty,

                    "AvailableQty":
                        available_qty,

                    "InventoryValue":
                        inventory_value
                }
            )

# ----------------------------------
# SAVE OUTPUT
# ----------------------------------

df = pd.DataFrame(records)

output_folder = Path(
    "data/raw"
)

output_folder.mkdir(
    parents=True,
    exist_ok=True
)

output_file = (
    output_folder
    / "inventory_snapshot.csv"
)

df.to_csv(
    output_file,
    index=False
)

# ----------------------------------
# VALIDATION
# ----------------------------------

assert (
    df["ReservedQty"]
    <=
    df["OnHandQty"]
).all()



assert (
    df["AvailableQty"]
    <=
    df["OnHandQty"]
).all()

assert (
    df["AvailableQty"]
    >= 0
).all()

print("=" * 60)
print(
    f"Inventory Snapshot Rows: "
    f"{len(df):,}"
)
print(
    f"Products Used: "
    f"{df['ProductID'].nunique():,}"
)
print(
    f"Warehouses Used: "
    f"{df['WarehouseID'].nunique():,}"
)
print(
    f"Date Range: "
    f"{df['SnapshotDate'].min()} "
    f"to "
    f"{df['SnapshotDate'].max()}"
)
print("=" * 60)