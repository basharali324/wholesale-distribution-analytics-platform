import pandas as pd
from pathlib import Path

warehouses = [
    {
        "WarehouseID": "WH-001",
        "WarehouseName": "Glasgow Distribution Centre",
        "Region": "Scotland",
        "Capacity": 250000
    },
    {
        "WarehouseID": "WH-002",
        "WarehouseName": "Edinburgh Fulfilment Centre",
        "Region": "Scotland",
        "Capacity": 150000
    },
    {
        "WarehouseID": "WH-003",
        "WarehouseName": "Manchester Distribution Centre",
        "Region": "North England",
        "Capacity": 300000
    },
    {
        "WarehouseID": "WH-004",
        "WarehouseName": "Leeds Logistics Hub",
        "Region": "North England",
        "Capacity": 220000
    },
    {
        "WarehouseID": "WH-005",
        "WarehouseName": "Birmingham Distribution Centre",
        "Region": "Midlands",
        "Capacity": 350000
    },
    {
        "WarehouseID": "WH-006",
        "WarehouseName": "Coventry Fulfilment Centre",
        "Region": "Midlands",
        "Capacity": 200000
    },
    {
        "WarehouseID": "WH-007",
        "WarehouseName": "London Central Warehouse",
        "Region": "South England",
        "Capacity": 400000
    },
    {
        "WarehouseID": "WH-008",
        "WarehouseName": "Southampton Logistics Hub",
        "Region": "South England",
        "Capacity": 180000
    },
    {
        "WarehouseID": "WH-009",
        "WarehouseName": "Cardiff Distribution Centre",
        "Region": "Wales",
        "Capacity": 120000
    },
    {
        "WarehouseID": "WH-010",
        "WarehouseName": "Belfast Distribution Centre",
        "Region": "Northern Ireland",
        "Capacity": 100000
    }
]

df = pd.DataFrame(warehouses)

output_path = Path("data/raw")
output_path.mkdir(parents=True, exist_ok=True)

df.to_csv(
    output_path / "warehouses.csv",
    index=False
)

print(f"{len(df)} warehouses generated")