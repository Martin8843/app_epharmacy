ALTER TABLE addresses DROP CONSTRAINT addresses_users_fk;
ALTER TABLE order_details DROP CONSTRAINT order_details_orders_fk;
ALTER TABLE order_details DROP CONSTRAINT order_details_products_fk;
ALTER TABLE orders DROP CONSTRAINT orders_payments_fk;
ALTER TABLE orders DROP CONSTRAINT orders_users_fk;
ALTER TABLE payments DROP CONSTRAINT payments_orders_fk;
ALTER TABLE products DROP CONSTRAINT products_product_categories_fk;
ALTER TABLE stock DROP CONSTRAINT stock_products_fk;

ALTER TABLE addresses DROP CONSTRAINT address_per_user_un;
ALTER TABLE order_details DROP CONSTRAINT order_details_prod_order_un;
ALTER TABLE payments DROP CONSTRAINT chk_payments_method;
ALTER TABLE payments DROP CONSTRAINT chk_payments_status;
ALTER TABLE products DROP CONSTRAINT chk_products_name;
ALTER TABLE products DROP CONSTRAINT chk_products_price;
ALTER TABLE products DROP CONSTRAINT chk_products_exp;
ALTER TABLE products DROP CONSTRAINT chk_products_presc;
ALTER TABLE products DROP CONSTRAINT chk_products_desc;
ALTER TABLE products DROP CONSTRAINT chk_products_status;
ALTER TABLE products DROP CONSTRAINT products_name_un;
ALTER TABLE product_categories DROP CONSTRAINT chk_prod_cat_desc;
ALTER TABLE product_categories DROP CONSTRAINT pc_prod_cat_name_un;
ALTER TABLE stock DROP CONSTRAINT chk_stock_qnty;
ALTER TABLE stock DROP CONSTRAINT stock_product_un;
ALTER TABLE users DROP CONSTRAINT chk_email_format;
ALTER TABLE users DROP CONSTRAINT chk_phone_format;
ALTER TABLE users DROP CONSTRAINT chk_role;
ALTER TABLE users DROP CONSTRAINT chk_passw_length;
ALTER TABLE users DROP CONSTRAINT chk_status;
ALTER TABLE users DROP CONSTRAINT users_email_phone_pass_un;


DROP TABLE stock CASCADE CONSTRAINTS;
DROP TABLE payments CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE order_details CASCADE CONSTRAINTS;
DROP TABLE products CASCADE CONSTRAINTS;
DROP TABLE product_categories CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE addresses CASCADE CONSTRAINTS;


DROP SEQUENCE addresses_seq;
DROP SEQUENCE od_seq;
DROP SEQUENCE orders_seq;
DROP SEQUENCE payments_seq;
DROP SEQUENCE pc_seq;
DROP SEQUENCE products_seq;
DROP SEQUENCE stock_seq;
DROP SEQUENCE users_seq;




