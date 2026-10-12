import sqlite3
import pandas as pd

# Load the cleaned Superstore dataset
df = pd.read_csv("superstore_cleaned.csv", encoding="latin1")

print("Dataset loaded successfully.")
print("Rows:", len(df))
print("Columns:", len(df.columns))


# Standardise column names
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_", regex=False)
    .str.replace("-", "_", regex=False)
)

print("\nColumn names:")
print(df.columns.tolist())


# Convert dates
df["order_date"] = pd.to_datetime(
    df["order_date"],
    errors="coerce"
).dt.strftime("%Y-%m-%d")

df["ship_date"] = pd.to_datetime(
    df["ship_date"],
    errors="coerce"
).dt.strftime("%Y-%m-%d")


# Create the SQLite database
connection = sqlite3.connect("superstore_week3.db")


# Create the superstore table
df.to_sql(
    "superstore",
    connection,
    if_exists="replace",
    index=False
)


connection.close()

print("\nSQLite database created successfully!")
print("Database: superstore_week3.db")
print("Table: superstore")