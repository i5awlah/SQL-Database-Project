# SQL-Database-Project Notes: 

1- Create table order_products should be after Create table products
becouse I added forign key constraint in CREATE statment.


2- Before delete row from products table, you should run this code:

ALTER TABLE order_products

DROP FOREIGN KEY `order_products_ibfk_2`;


ALTER TABLE order_products

ADD CONSTRAINT `order_products_ibfk_2`

  FOREIGN KEY (product_id)
  
  REFERENCES products (id)
  
  ON DELETE CASCADE;
