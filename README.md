# retail_sales_analysis


A portfolio project built using **MySQL, SQL, and Python** to simulate a real-world retail business database and perform business-focused analysis on sales, customers, products, payments, returns, stores, and employees.

---

## Project Overview

This project was built to simulate how retail business data is structured and analyzed in a real organization. Instead of using a flat dataset directly, I designed a relational retail database from scratch, generated synthetic data using Python, and wrote SQL queries to answer practical business questions related to revenue, product performance, customer behavior, payment trends, returns, and store operations.

The goal of the project was to practice the **end-to-end workflow of a data analyst**:

* designing a relational database schema
* generating realistic business data
* loading and managing data in MySQL
* writing analytical SQL queries
* extracting actionable business insights from transactional data

---

## Problem Statement

Retail businesses generate data across multiple areas such as customers, products, suppliers, orders, payments, returns, and store operations. This project models those business entities in a structured relational database and uses SQL to analyze key questions such as:

* How much revenue is being generated?
* Which products and categories perform best?
* Which customers spend the most?
* What are the most used payment methods?
* What is the return rate and the most common return reason?
* How are stores and employees distributed across the business?

---

## Tools & Technologies

* **MySQL** – relational database design, data storage, SQL analysis
* **SQL** – joins, aggregations, filtering, grouping, KPI analysis
* **Python** – data generation and automation
* **Faker** – synthetic retail data generation
* **Random / weighted logic** – realistic distribution of generated records

---

## Database Entities / Tables

The project includes the following core tables:

### Core transactional and business tables

* **customers** – customer demographic and membership information
* **category** – product categories
* **suppliers** – supplier master data
* **product** – product details, pricing, stock, and supplier mapping
* **orders** – order-level transaction details
* **order_items** – product-level order line items
* **payments** – payment transaction records and payment status
* **returns** – returned items, return reasons, and return amounts

### Operational extension tables

* **stores** – store details and opening date
* **employees** – employee details, salary, designation, and store assignment

---

## Project Workflow

### 1. Database Design

Designed a normalized retail schema with multiple related tables to simulate a retail business environment. Defined primary keys, foreign keys, and constraints to maintain referential integrity between customers, orders, products, payments, returns, stores, and employees.

### 2. Data Generation

Used Python and the Faker library to generate synthetic but realistic retail data for customers, suppliers, products, orders, payments, returns, stores, and employees. Applied randomization and weighted logic to mimic realistic patterns such as customer activity status and membership types.

### 3. Data Population

Inserted generated data into MySQL tables while preserving relationships between entities such as:

* customer → orders
* orders → order_items
* product → category / supplier
* payments → orders
* returns → order_items
* employees → stores

### 4. SQL Analysis

Wrote analytical SQL queries to answer business questions related to:

* sales and revenue
* product performance
* customer spending
* payment analysis
* return analysis
* supplier contribution
* store and employee analysis

---

## Business Questions Answered

### Sales & Revenue Analysis

* What is the total revenue generated from successful payments?
* What is the average order value?
* How many total orders were placed?
* What is the monthly revenue trend?

### Product & Category Analysis

* Which products are selling the most?
* Which products generate the most revenue?
* Which products are low on stock?
* Which categories contribute the highest revenue and profit?

### Customer Analysis

* Who are the top customers by total spending?
* Which membership segment contributes the most revenue?
* How many active vs inactive customers are there?
* Which customers have not placed any orders?

### Payment Analysis

* What is the payment status breakdown?
* Which payment methods are most used?
* How much revenue comes from each payment mode?
* How many payments failed or were refunded?

### Returns Analysis

* What is the overall return rate?
* What are the most common return reasons?
* Which products are returned most frequently?
* What is the total returned quantity and amount?

### Supplier / Inventory / Operations Analysis

* Which suppliers contribute the most revenue and profit?
* What is the current inventory value?
* Which stores have the most employees?
* What is the average salary by employee designation?

---

## Key SQL Analysis Areas

The project includes SQL analysis queries grouped into the following sections:

1. **Sales Overview / Core KPIs**
2. **Product Performance Analysis**
3. **Category Analysis**
4. **Customer Analytics**
5. **Order Analysis**
6. **Payment Analytics**
7. **Returns Analysis**
8. **Supplier Analysis**
9. **Inventory / Stock Analysis**
10. **Store & Employee Analysis**

These queries are stored in:

Analysis_Queries.sql

## Example Insights Generated

Examples of insights that can be extracted from this project include:

* total business revenue from successful payments
* highest-selling and highest-revenue products
* revenue and profit contribution by category
* top customers by total spend
* customer distribution by membership type
* payment mode usage and failed transaction count
* return rate and most common return reasons
* supplier contribution to sales and profit
* inventory valuation at cost and selling price
* employee distribution across stores

---

