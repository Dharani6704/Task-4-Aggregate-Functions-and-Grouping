# Task 4: Aggregate Functions and Grouping

## 🎯 Objective
Use SQL aggregate functions and grouping techniques to summarize and analyze tabular data efficiently.

## 🛠️ Tools
- PostgreSQL
- pgAdmin 4

## 🧩 Database Design

We use a simple **Sales Database** with two tables:

1. **customers**
   - `customer_id`: Primary Key
   - `name`: Customer Name
   - `city`: Customer's City

2. **orders**
   - `order_id`: Primary Key
   - `customer_id`: Foreign Key (references `customers`)
   - `order_date`: Date of Order
   - `total_amount`: Total Order Value
