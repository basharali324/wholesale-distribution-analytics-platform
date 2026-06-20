from faker import Faker
import pandas as pd
import numpy as np
from pathlib import Path
import random

fake = Faker("en_GB")

NUM_CUSTOMERS = 100_000

REGIONS = [
    "Scotland",
    "North England",
    "Midlands",
    "South England",
    "Wales",
    "Northern Ireland"
]

CUSTOMER_TYPES = [
    "Retail",
    "Healthcare",
    "Education",
    "Logistics",
    "Hospitality",
    "Manufacturing"
]

ACCOUNT_MANAGERS = [
    "Sarah Thompson",
    "James Wilson",
    "Michael Brown",
    "Emma Taylor",
    "David Clarke",
    "Olivia Green",
    "Daniel Evans",
    "Sophia White"
]


def generate_customer():
    return {
        "CustomerID": f"CUST-{random.randint(100000,999999)}",
        "CustomerName": fake.company(),
        "CustomerType": random.choice(CUSTOMER_TYPES),
        "Region": random.choice(REGIONS),
        "City": fake.city(),
        "Postcode": fake.postcode(),
        "AccountManager": random.choice(ACCOUNT_MANAGERS),
        "CreatedDate": fake.date_between(
            start_date="-5y",
            end_date="today"
        )
    }


customers = [
    generate_customer()
    for _ in range(NUM_CUSTOMERS)
]

df = pd.DataFrame(customers)

output_folder = Path("data/raw")
output_folder.mkdir(parents=True, exist_ok=True)

df.to_csv(
    output_folder / "customers.csv",
    index=False
)

print(
    f"{len(df):,} customers generated"
)