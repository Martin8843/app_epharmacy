CREATE OR REPLACE TRIGGER trg_after_dml_products
AFTER INSERT OR UPDATE OR DELETE ON products
REFERENCING NEW as nowy OLD AS stary
FOR EACH ROW
BEGIN
    log_event(
        p_log_type     => CASE  WHEN INSERTING THEN 'INSERT'
                                WHEN UPDATING THEN  'UPDATE'
                                WHEN DELETING THEN  'DELETE'
                           END,
        p_log_details  => CASE  WHEN INSERTING THEN 'Nowy produkt o id: '||:nowy.product_id||' zostal dodany'
                                WHEN UPDATING THEN  'Produkt o id: '||:nowy.product_id||' zostal zaktualizowany'
                                WHEN DELETING THEN  'Produkt o id: '||:stary.product_id||' zostal usunięty'
                           END,
        --p_created_by   => USER,
        p_product_id => CASE    WHEN INSERTING THEN :nowy.product_id
                                WHEN UPDATING THEN :nowy.product_id
                                WHEN DELETING THEN :stary.product_id
                           END
    );
EXCEPTION
        WHEN OTHERS THEN
            log_event(
                p_log_type     => 'ERROR',
                p_log_details  => 'Błąd podczas próby logowania zmian w tabeli products: ' || SQLERRM);
            -- Przerwanie wykonania operacji w przypadku błędu
            RAISE;
END trg_after_dml_products;
/