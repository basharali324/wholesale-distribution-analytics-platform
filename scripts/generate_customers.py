from faker import Faker
import pandas as pd
from pathlib import Path
import random

# Reproducible dataset
random.seed(42)
fake = Faker("en_GB")
Faker.seed(42)

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


def generate_customer(customer_num):
    return {
        "CustomerID": f"CUST-{customer_num:06d}",
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
    generate_customer(i)
    for i in range(1, NUM_CUSTOMERS + 1)
]

df = pd.DataFrame(customers)

# Data Quality Checks
assert len(df) == NUM_CUSTOMERS, \
    f"Expected {NUM_CUSTOMERS:,} customers but found {len(df):,}"

assert df["CustomerID"].is_unique, \
    "Duplicate Customer IDs detected"

output_folder = Path("data/raw")
output_folder.mkdir(
    parents=True,
    exist_ok=True
)

df.to_csv(
    output_folder / "customers.csv",
    index=False
)

print("=" * 50)
print(f"Customers Generated : {len(df):,}")
print(f"Unique Customer IDs : {df['CustomerID'].nunique():,}")
print("Customer Generation Successful")
print("=" * 50)