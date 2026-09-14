CREATE DATABASE product_category_db;

USE product_category_db;

CREATE TABLE category(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE product(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY(category_id) REFERENCES category(category_id)
);

INSERT INTO category(category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Shoes');

INSERT INTO product(product_name,price,category_id) VALUES
('Laptop',55000,1),
('Mobile Phone',25000,1),
('Headphones',2500,1),
('Keyboard',1500,1),
('Mouse',800,1),
('Monitor',12000,1),
('Smart Watch',5000,1),
('T-Shirt',800,2),
('Jeans',1800,2),
('Jacket',3000,2),
('Shirt',1200,2),
('Java Programming',600,3),
('Python Basics',500,3),
('Data Structures',750,3),
('Running Shoes',2500,4),
('Sports Shoes',3500,4),
('Formal Shoes',2800,4);

SELECT * FROM category;

SELECT * FROM product;

SELECT p.product_id,p.product_name,p.price,c.category_name
FROM product p
JOIN category c
ON p.category_id=c.category_id;

SELECT c.category_name,COUNT(p.product_id) AS product_count
FROM category c
LEFT JOIN product p
ON c.category_id=p.category_id
GROUP BY c.category_id,c.category_name;

SELECT c.category_name,p.product_name,p.price
FROM category c
JOIN product p
ON c.category_id=p.category_id
WHERE p.price=(
    SELECT MAX(p2.price)
    FROM product p2
    WHERE p2.category_id=p.category_id
);

SELECT c.category_name,COUNT(p.product_id) AS product_count
FROM category c
JOIN product p
ON c.category_id=p.category_id
GROUP BY c.category_id,c.category_name
HAVING COUNT(p.product_id)>5;

SELECT c.category_name,AVG(p.price) AS average_price
FROM category c
JOIN product p
ON c.category_id=p.category_id
GROUP BY c.category_id,c.category_name;

INSERT INTO product(product_name,price,category_id)
VALUES('Tablet',18000,1);

SELECT * FROM product
WHERE product_id=18;

UPDATE product
SET price=20000
WHERE product_id=18;

SELECT * FROM product
WHERE product_id=18;

DELETE FROM product
WHERE product_id=18;

SELECT * FROM product;