CREATE OR REPLACE TRIGGER trg_update_product_status
AFTER UPDATE ON stock
FOR EACH ROW
BEGIN
    MERGE INTO products p
    USING (SELECT :NEW.product_id AS product_id, :NEW.quantity AS stock_qnty FROM dual) s
    ON (p.product_id = s.product_id)
    WHEN MATCHED THEN
    UPDATE SET p.avail_status = 
        CASE 
             WHEN s.stock_qnty >= 100 THEN 'Available'
             WHEN s.stock_qnty = 0 THEN 'Out of Stock'
             WHEN s.stock_qnty < 100 THEN 'Limited Stock'
        END;
END trg_update_product_status;


/*
UPDATE order_details
SET ord_qnty = ord_qnty + 20
WHERE product_id = 16
AND order_id=180;
*\