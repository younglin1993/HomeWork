DROP TABLE IF EXISTS product

CREATE TABLE product(
	product_id INT IDENTITY(1001,1) PRIMARY KEY,
	name NVARCHAR(20) NOT NULL,
	product_type NVARCHAR(20) NOT NULL,
	price INT NOT NULL,
	stock INT NOT NULL
)

INSERT INTO product (name, product_type, price, stock)VALUES
('Product 1', 'Type 1', 10, 50),
('Product 2', 'Type 2', 15, 20),
('Product 3', 'Type 1', 12, 30),
('Product 4', 'Type 3', 8, 40),
('Product 5', 'Type 2', 19, 15),
('Product 6', 'Type 1', 9, 25),
('Product 7', 'Type 2', 14, 35),
('Product 8', 'Type 3', 11, 10),
('Product 9', 'Type 1', 16, 20),
('Product 10', 'Type 2', 13, 30),
('Product 11', 'Type 1', 7, 45),
('Product 12', 'Type 3', 17, 15),
('Product 13', 'Type 2', 9, 25),
('Product 14', 'Type 1', 12, 35),
('Product 15', 'Type 2', 11, 20),
('Product 16', 'Type 3', 14, 30),
('Product 17', 'Type 1', 8, 40),
('Product 18', 'Type 2', 10, 15),
('Product 19', 'Type 1', 13, 25),
('Product 20', 'Type 3', 9, 35);

SELECT * FROM product