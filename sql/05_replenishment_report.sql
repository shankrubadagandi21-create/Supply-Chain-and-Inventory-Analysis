-- Q8 Calculate replenishment requirmnents
SELECT p.product_id,
       p.product_name,
       w.warehouse_name,
       i.available_quantity,
       p.recorder_level,
       GREATEST(
                p.recorder_level - i.available_quantity,0) as minimum_replenishment_quantity
       FROM inventory i
       JOIN products p ON i.product_id = p.product_id
       JOIN warehouses w ON i.warehouse_id = w.warehouse_id
       WHERE i.available_quantity < p.recorder_level;
       
   
