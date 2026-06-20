from faker import Faker
import pandas as pd
import random
from pathlib import Path

fake = Faker("en_GB")

NUM_PRODUCTS = 50_000

CATEGORIES = {
    "Electronics": [
        "Laptop",
        "Monitor",
        "Keyboard",
        "Mouse",
        "Printer"
    ],
    "Office Supplies": [
        "Paper",
        "Notebook",
        "Pen",
        "Folder",
        "Envelope"
    ],
    "Industrial Equipment": [
        "Drill",
        "Compressor",
        "Generator",
        "Pump"
    ],
    "Cleaning Products": [
        "Detergent",
        "Disinfectant",
        "Wipes",
        "Soap"
    ],
    "Packaging Materials": [
        "Box",
        "Tape",
        "Pallet Wrap",
        "Bubble Wrap"
    ]
}

suppliers = pd.read_csv(
    "data/raw/suppliers.csv"
)

supplier_ids = suppliers["SupplierID"].tolist()

products = []

for i in range(1, NUM_PRODUCTS + 1):

    category = random.choice(
        list(CATEGORIES.keys())
    )

    subcategory = random.choice(
        CATEGORIES[category]
    )

    products.append(
        {
            "ProductID": f"PROD-{i:06}",
            "ProductName": f"{subcategory} {i}",
            "Category": category,
            "SubCategory": subcategory,
            "Brand": fake.company(),
            "SupplierID": random.choice(
                supplier_ids
            ),
            "UnitCost": round(
                random.uniform(2, 500),
                2
            ),
            "UnitPrice": round(
                random.uniform(5, 1000),
                2
            )
        }
    )

df = pd.DataFrame(products)

output_path = Path("data/raw")

df.to_csv(
    output_path / "products.csv",
    index=False
)

print(
    f"{len(df):,} products generated"
)