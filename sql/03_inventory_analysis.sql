-- step 3.inventory Analysis
-- Q1.Calculate total available stock
SELECT SUM(available_quantity) as total_available_stock
FROM inventory;

-- Q2.calculate stock by warehouse
SELECT w.warehouse_name,
       SUM(i.available_quantity) as total_inventory
FROM warehouses w 
JOIN inventory i ON w.warehouse_id = i.warehouse_id
GROUP BY w.warehouse_name;

-- Q3.identifies low stock products
SELECT
       p.product_name,
       w.warehouse_name,
       i.available_quantity,
       p.recorder_level
FROM inventory i 
JOIN products p ON i.product_id = p.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE i.available_quantity < p.recorder_level
ORDER BY p.recorder_level desc;

-- Q4.calculate inventory value by category
SELECT p.category,
       SUM(i.available_quantity * p.unit_cost) as inventory_value
from inventory i 
JOIN products p ON i.product_id = p.product_id
GROUP BY p.category;
