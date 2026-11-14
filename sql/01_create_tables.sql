-- CREATE DATABASE TABLES

CREATE DATABASE inventory_analysis;
USE inventory_analysis;

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
unit_cost DECIMAL(10,2),
recorder_level INT 
);



CREATE TABLE warehouses (
warehouse_id INT PRIMARY KEY,
warehouse_name VARCHAR(100),
city VARCHAR (50)
);


CREATE TABLE suppliers (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(100),
supplier_city VARCHAR(50)
);

CREATE TABLE invantory (
inventory_id INT PRIMARY KEY, 
product_id INT,
warehouse_id INT,
available_quantity INT,

FOREIGN KEY (product_id) REFERENCES products (product_id),
FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

CREATE TABLE purchase_orders(
purchase_order_id INT PRIMARY KEY,
supplier_id INT,
product_id INT,
warehouse_id INT,
order_date DATE,
expected_date DATE,
received_date DATE,
quantity INT,

FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id),
FOREIGN KEY (product_id) REFERENCES products (product_id),
FOREIGN KEY (warehouse_id) REFERENCES warehouses (warehouse_id)
);
