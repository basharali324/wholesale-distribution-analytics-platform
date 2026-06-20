from faker import Faker
import pandas as pd
from pathlib import Path
import random

fake = Faker("en_GB")

NUM_SUPPLIERS = 300

COUNTRIES = [
    "United Kingdom",
    "Germany",
    "Netherlands",
    "France",
    "Spain",
    "Italy",
    "Poland",
    "China",
    "India",
    "Turkey"
]

SUPPLIER_TYPES = [
    "Manufacturer",
    "Distributor",
    "Importer"
]

suppliers = []

for i in range(1, NUM_SUPPLIERS + 1):
    suppliers.append(
        {
            "SupplierID": f"SUP-{i:04}",
            "SupplierName": fake.company(),
            "Country": random.choice(COUNTRIES),
            "SupplierType": random.choice(SUPPLIER_TYPES),
            "LeadTimeDays": random.randint(3, 45),
            "Rating": round(random.uniform(2.5, 5.0), 1),
            "CreatedDate": fake.date_between(
                start_date="-10y",
                end_date="today"
            )
        }
    )

df = pd.DataFrame(suppliers)

output_path = Path("data/raw")
output_path.mkdir(parents=True, exist_ok=True)

df.to_csv(
    output_path / "suppliers.csv",
    index=False
)

print(f"{len(df):,} suppliers generated")