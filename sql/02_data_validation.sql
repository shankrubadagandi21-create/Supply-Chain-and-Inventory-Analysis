-- step 2.Data validation
-- before analysisng business data,data analyst must check whether the data is correct. this process is called data validation

-- Q1.Find negative stock
SELECT *
FROM inventory
WHERE available_quantity <0;

-- Q2.Find invalid product values
SELECT *
FROM products
WHERE unit_cost <0 or recorder_level <0;

-- Q3.Find products without inventory
SELECT p.product_id
FROM products p 
left join inventory i ON p.product_id = i.product_id
WHERE i.product_id IS NULL;
