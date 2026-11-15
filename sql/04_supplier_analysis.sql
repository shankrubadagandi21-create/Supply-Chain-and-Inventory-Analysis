-- Q5 calculate supplier  delivery delay
SELECT s.supplier_name,
       AVG( 
           DATEDIFF( 
                     po.received_date,
                     po.expected_date
                   )
              ) AS average_delay_date
FROM purchase_orders po 
JOIN suppliers s ON po.supplier_id = s.supplier_id
WHERE po.received_date IS NOT NULL
GROUP BY s.supplier_name;

-- Q6.calculate on time delivery percentage
SELECT s.supplier_name,
       COUNT(*) as received_orders,
       SUM(
       CASE
           WHEN po.received_date <=po.expected_date THEN 1
           ELSE 0
           END
       ) as on_time_orders,
      ROUND(
            100.0*SUM(
              CASE
                  WHEN po.received_date <= po.expected_date THEN 1 
                  ELSE 0
                  END
               ) /COUNT(*),2
       ) as on_time_percentage
FROM purchase_orders po
JOIN suppliers s ON po.supplier_id = s.supplier_id
WHERE po.received_date IS NOT NULL
GROUP BY s.supplier_name;
                  
-- Q7.Rank suppliers
WITH supplier_performance as (
SELECT supplier_id,
       COUNT(*) as total_orders,
       AVG(
            DATEDIFF(received_date, expected_date)
            ) as average_delay
FROM purchase_orders po
WHERE po.received_date IS NOT NULL
GROUP BY supplier_id
)
SELECT supplier_id,
       total_orders,
       average_delay,
       RANK() OVER (ORDER BY average_delay) as ranl_num
FROM supplier_performance;
