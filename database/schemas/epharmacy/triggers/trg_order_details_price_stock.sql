CREATE OR REPLACE TRIGGER trg_order_details_price_stock
 
FOR INSERT OR UPDATE OR DELETE ON order_details
COMPOUND TRIGGER

    -- Aktualizacja ceny całkowitej w tabeli order_details
    BEFORE EACH ROW IS
    BEGIN
        -- Obliczamy cenę całkowitą przed zapisaniem rekordu
        :NEW.total_price := :NEW.ord_qnty * :NEW.unit_price;
    END BEFORE EACH ROW;

    -- Aktualizacja ilości produktów w tabeli stock
    AFTER EACH ROW IS
    BEGIN
    MERGE INTO stock s
    USING (SELECT :NEW.product_id as product_id,
                    :NEW.ord_qnty as new_qnty,
                    :OLD.product_id as old_product_id,
                    :OLD.ord_qnty as old_qnty
          FROM dual) od
    ON (s.product_id=od.product_id) 
    WHEN MATCHED THEN  
    UPDATE 
    SET s.quantity = s.quantity + (nvl(old_qnty, 0) - nvl(new_qnty, 0));
    END AFTER EACH ROW;
       
END trg_order_details_price_stock;
/


--UPDATE order_details
--SET ord_qnty = ord_qnty + 20
--WHERE product_id = 21
--AND order_id=170;



