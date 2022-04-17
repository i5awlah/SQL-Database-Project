-- Create database named " store ".
CREATE DATABASE store;
USE store;

-- Create table countries.
/* 
Add unique constraint to column " name ".
Add not null constraint to column " continent_name ".
*/
CREATE TABLE countries(
code INT PRIMARY KEY,
name VARCHAR(20) UNIQUE,
continent_name VARCHAR(20) NOT NULL
);

-- Create table users.
/*
Add unique constraint to column " email ".
Add check constraint to column " gender " between 'm' or 'f'.
*/
CREATE TABLE users(
id INT PRIMARY KEY,
full_name VARCHAR(20),
email VARCHAR(20) UNIQUE,
gender CHAR(1) CHECK (gender = 'm' OR gender = 'f'),
date_of_birth VARCHAR(15),
created_at DATETIME DEFAULT NOW(),
country_code INT,
FOREIGN KEY (country_code) REFERENCES countries(code)
);
-- Create table orders.
/*
Add check constraint to column " status " between 'start' or 'finish'.
*/
CREATE TABLE orders(
id INT PRIMARY KEY,
user_id INT,
status VARCHAR(6) CHECK (status = 'start' OR status = 'finish'),
created_at DATETIME DEFAULT NOW(),
FOREIGN KEY (user_id) REFERENCES users(id)
);
-- Create table order_products.
/*
Add default value to column " quantity " value 0.
*/
CREATE TABLE order_products(
order_id INT,
product_id INT,
quantity INT DEFAULT 0,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);
-- Create table products.
/*
Add default value to column " price " value 0.
Add not null constraint to column " name ".
Add check constraint to column " status " between 'valid' or 'expired'.
*/
CREATE TABLE products(
id INT PRIMARY KEY,
name VARCHAR(10) NOT NULL,
price INT DEFAULT 0,
status VARCHAR(10) CHECK (status = 'valid' OR status = 'expired'),
created_at DATETIME DEFAULT NOW()
);

-- Add new row to the countries table.
INSERT INTO countries VALUES (101, "Saudi Arabia", "Asia");

-- Add new row to the users table.
INSERT INTO users (id, full_name, email, gender, date_of_birth, country_code)
VALUES (1, "Khawlah alrashed", "khawlah@gmail.com", 'f', "1996-04-28", 101);

-- Add new row to the orders table.
INSERT INTO orders(id, user_id, status)
VALUES (201, 1, 'start');

-- Add new row to the products table.
INSERT INTO products (id, name, status)
VALUES (301, 'Choclate','valid');

-- Add new row to the order_products table.
INSERT INTO order_products (order_id, product_id)
VALUES (201, 301);

-- Update row from countries table.
UPDATE countries
SET continent_name = "asia"
WHERE code = 101;

-- Delete row from products table.
DELETE FROM products
WHERE ID = 302;
