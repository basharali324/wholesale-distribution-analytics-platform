import pandas as pd
import numpy as np
import random
from pathlib import Path

orders = pd.read_csv(
    "data/raw/orders.csv"
)

products = pd.read_csv(
    "data/raw/products.csv"
)

NUM_LINES = 2_000_000

order_ids = orders["OrderID"].tolist()

products_subset = products[
    [
        "ProductID",
        "UnitPrice",
        "UnitCost"
    ]
].to_dict("records")

lines = []

for i in range(1, NUM_LINES + 1):

    product = random.choice(
        products_subset
    )

    qty = random.randint(1, 25)

    discount = round(
        random.choice(
            [0,0,0,0,5,10,15]
        ),
        2
    )

    lines.append(
        {
            "OrderLineID":
                f"OL-{i:08}",

            "OrderID":
                random.choice(order_ids),

            "ProductID":
                product["ProductID"],

            "Quantity":
                qty,

            "UnitPrice":
                product["UnitPrice"],

            "UnitCost":
                product["UnitCost"],

            "DiscountPct":
                discount
        }
    )

df = pd.DataFrame(lines)

Path("data/raw").mkdir(
    parents=True,
    exist_ok=True
)

df.to_csv(
    "data/raw/order_lines.csv",
    index=False
)

print(
    f"{len(df):,} order lines generated"
)