create DATABASE ECMS ;
use ECMS;
show tables;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(250) NOT NULL,
    Address varchar(50),
    phone_number int8
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    SKU VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id int,
    foreign key(category_id) references category (category_id)
);

CREATE table CART 
(CART_ID INT primary KEY auto_increment,
quantity int,
price int,
customer_id int,
product_id int,
category_id int,
foreign key (customer_id) references CUSTOMER (customer_id),
foreign key (product_id) references Product (product_id)
);

CREATE TABLE Shipment (
    shipment_id INT PRIMARY KEY AUTO_INCREMENT,
    shipment_date DATE NOT NULL,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    zip_code VARCHAR(20),
    customer_id int,
    foreign key(customer_id) references customer (customer_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    customer_id int,
	foreign key(customer_id) references customer (customer_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    customer_id int,
    payment_id int,
    shipment_id int,
    product_id int,
    foreign key (customer_id) references customer (customer_id),
	foreign key (payment_id) references payment (payment_id),
	foreign key (shipment_id) references shipment (shipment_id),
    foreign key (product_id) references product (product_id)
);

CREATE TABLE Order_Item (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    product_id int,
    order_id int,
    foreign key(product_id) references product (product_id),
    foreign key(order_id) references orders (order_id)
);

CREATE TABLE WISHLIST (
WISHLIST_ID INT primary KEY auto_increment,
customer_id int,
product_id int,
foreign key(product_id) references product (product_id),
foreign key(customer_id) references customer (customer_id)
);

-- To view all those tables we have created
show tables;

-- Insert 20 records into the Customer table
INSERT INTO Customer (first_name, last_name, email, password, Address, phone_number)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'hashed_password1', '123 Main St, India', 1234567890),
    ('Alice', 'Smith', 'alice.smith@example.com', 'hashed_password2', '456 Elm St, India', 9876543210),
    ('Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password3', '789 Oak St, India', 5551234567),
    ('Emily', 'Davis', 'emily.davis@example.com', 'hashed_password4', '101 Pine St, India', 1112223333),
    ('Michael', 'Brown', 'michael.brown@example.com', 'hashed_password5', '202 Maple St, India', 4445556666),
    ('Sarah', 'Wilson', 'sarah.wilson@example.com', 'hashed_password6', '303 Birch St, India', 7778889999),
    ('David', 'Lee', 'david.lee@example.com', 'hashed_password7', '404 Cedar St, India', 9998887777),
    ('Linda', 'Miller', 'linda.miller@example.com', 'hashed_password8', '505 Redwood St, India', 1231231234),
    ('Robert', 'Garcia', 'robert.garcia@example.com', 'hashed_password9', '606 Sequoia St, India', 3213214321),
    ('Karen', 'Martinez', 'karen.martinez@example.com', 'hashed_password10', '707 Walnut St, India', 2345678901),
    ('James', 'Wilson', 'james.wilson@example.com', 'hashed_password11', '808 Oak St, India', 5555555555),
    ('Jennifer', 'Davis', 'jennifer.davis@example.com', 'hashed_password12', '909 Pine St, India', 9999999999),
    ('William', 'Anderson', 'william.anderson@example.com', 'hashed_password13', '101 Cedar St, India', 7777777777),
    ('Nancy', 'White', 'nancy.white@example.com', 'hashed_password14', '202 Birch St, India', 8888888888),
    ('Elizabeth', 'Brown', 'elizabeth.brown@example.com', 'hashed_password15', '303 Elm St, India', 6666666666),
    ('Daniel', 'Clark', 'daniel.clark@example.com', 'hashed_password16', '404 Redwood St, India', 1111111111),
    ('Patricia', 'Wilson', 'patricia.wilson@example.com', 'hashed_password17', '505 Maple St, India', 4444444444),
    ('John', 'Thomas', 'john.thomas@example.com', 'hashed_password18', '606 Sequoia St, India', 8888888888),
    ('Lisa', 'Lee', 'lisa.lee@example.com', 'hashed_password19', '707 Walnut St, India', 9999999999),
    ('Charles', 'White', 'charles.white@example.com', 'hashed_password20', '808 Oak St, India', 7777777777);

-- Insert 20 records into the Category table
INSERT INTO Category (name)
VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home Appliances'),
    ('Books'),
    ('Toys'),
    ('Furniture'),
    ('Beauty'),
    ('Sports'),
    ('Jewelry'),
    ('Food'),
    ('Shoes'),
    ('Health'),
    ('Music'),
    ('Garden'),
    ('Tools'),
    ('Pet Supplies'),
    ('Automotive'),
    ('Baby'),
    ('Travel'),
    ('Office');

-- Insert 20 records into the Product table
INSERT INTO Product (SKU, description, price, stock, category_id)
VALUES
    ('SKU001', 'Smartphone', 499.99, 50, 1),
    ('SKU002', 'T-Shirt', 19.99, 100, 2),
    ('SKU003', 'Refrigerator', 799.99, 25, 3),
    ('SKU004', 'Novel', 9.99, 200, 4),
    ('SKU005', 'Toy Car', 29.99, 75, 5),
    ('SKU006', 'Sofa', 699.99, 10, 6),
    ('SKU007', 'Skincare Kit', 39.99, 150, 7),
    ('SKU008', 'Basketball', 12.99, 50, 8),
    ('SKU009', 'Necklace', 249.99, 30, 9),
    ('SKU010', 'Chocolate', 5.99, 500, 10),
    ('SKU011', 'Running Shoes', 89.99, 60, 11),
    ('SKU012', 'Vitamins', 14.99, 100, 12),
    ('SKU013', 'Headphones', 59.99, 80, 1),
    ('SKU014', 'Garden Hose', 19.99, 150, 14),
    ('SKU015', 'Tool Set', 49.99, 40, 15),
    ('SKU016', 'Pet Food', 29.99, 200, 16),
    ('SKU017', 'Car Oil', 12.99, 100, 17),
    ('SKU018', 'Baby Diapers', 19.99, 300, 18),
    ('SKU019', 'Luggage', 79.99, 50, 19),
    ('SKU020', 'Office Chair', 99.99, 30, 20);

-- Insert 20 records into the Cart table
INSERT INTO CART (quantity, price, customer_id, product_id, category_id)
VALUES
    (2, 999.98, 1, 1, 1),
    (3, 59.97, 2, 5, 5),
    (1, 29.99, 3, 7, 7),
    (2, 39.98, 4, 2, 2),
    (1, 19.99, 5, 10, 10),
    (4, 199.96, 6, 9, 9),
    (2, 1399.98, 7, 6, 6),
    (1, 9.99, 8, 4, 4),
    (3, 89.97, 9, 3, 3),
    (2, 59.98, 10, 8, 8),
    (1, 14.99, 11, 12, 12),
    (2, 179.97, 12, 13, 1),
    (3, 179.97, 13, 1, 1),
    (4, 199.96, 14, 14, 14),
    (1, 49.99, 15, 15, 15),
    (2, 59.98, 16, 16, 16),
    (1, 12.99, 17, 17, 17),
    (3, 59.97, 18, 18, 18),
    (2, 159.98, 19, 19, 19),
    (1, 99.99, 20, 20, 20);

-- Insert 20 records into the Shipment table with Indian addresses
INSERT INTO Shipment (shipment_date, address, city, state, country, zip_code, customer_id)
VALUES
    ('2023-08-15', '123 Main St', 'Anytown', 'CA', 'India', '12345', 1),
    ('2023-08-16', '456 Elm St', 'Smallville', 'NY', 'India', '54321', 2),
    ('2023-08-17', '789 Oak St', 'Metroville', 'CA', 'India', '98765', 3),
    ('2023-08-18', '101 Pine St', 'Bigtown', 'TX', 'India', '67890', 4),
    ('2023-08-19', '202 Maple St', 'Townsville', 'IL', 'India', '54321', 5),
    ('2023-08-20', '303 Birch St', 'New City', 'NJ', 'India', '23456', 6),
    ('2023-08-21', '404 Cedar St', 'Springfield', 'OH', 'India', '34567', 7),
    ('2023-08-22', '505 Redwood St', 'Coastalville', 'CA', 'India', '45678', 8),
    ('2023-08-23', '606 Sequoia St', 'Hometown', 'WA', 'India', '56789', 9),
    ('2023-08-24', '707 Walnut St', 'River City', 'MI', 'India', '67890', 10),
    ('2023-08-15', '123 Main St', 'Anytown', 'CA', 'India', '12345', 11),
    ('2023-08-16', '456 Elm St', 'Smallville', 'NY', 'India', '54321', 12),
    ('2023-08-17', '789 Oak St', 'Metroville', 'CA', 'India', '98765', 13),
    ('2023-08-18', '101 Pine St', 'Bigtown', 'TX', 'India', '67890', 14),
    ('2023-08-19', '202 Maple St', 'Townsville', 'IL', 'India', '54321', 15),
    ('2023-08-20', '303 Birch St', 'New City', 'NJ', 'India', '23456', 16),
    ('2023-08-21', '404 Cedar St', 'Springfield', 'OH', 'India', '34567', 17),
    ('2023-08-22', '505 Redwood St', 'Coastalville', 'CA', 'India', '45678', 18),
    ('2023-08-23', '606 Sequoia St', 'Hometown', 'WA', 'India', '56789', 19),
    ('2023-08-24', '707 Walnut St', 'River City', 'MI', 'India', '67890', 20);

-- Insert 20 records into the Payment table
INSERT INTO Payment (payment_date, payment_method, amount, customer_id)
VALUES
    ('2023-08-15', 'Credit Card', 999.98, 1),
    ('2023-08-16', 'PayPal', 59.97, 2),
    ('2023-08-17', 'Debit Card', 29.99, 3),
    ('2023-08-18', 'Credit Card', 39.98, 4),
    ('2023-08-19', 'PayPal', 19.99, 5),
    ('2023-08-20', 'Debit Card', 199.96, 6),
    ('2023-08-21', 'Credit Card', 1399.98, 7),
    ('2023-08-22', 'PayPal', 9.99, 8),
    ('2023-08-23', 'Debit Card', 89.97, 9),
    ('2023-08-24', 'Credit Card', 59.98, 10),
    ('2023-08-15', 'PayPal', 14.99, 11),
    ('2023-08-16', 'Credit Card', 179.97, 12),
    ('2023-08-17', 'Debit Card', 179.97, 13),
    ('2023-08-18', 'Credit Card', 199.96, 14),
    ('2023-08-19', 'PayPal', 49.99, 15),
    ('2023-08-20', 'Debit Card', 59.98, 16),
    ('2023-08-21', 'Credit Card', 12.99, 17),
    ('2023-08-22', 'PayPal', 59.97, 18),
    ('2023-08-23', 'Credit Card', 159.98, 19),
    ('2023-08-24', 'Debit Card', 99.99, 20);

-- Insert 20 records into the Orders table
INSERT INTO Orders (order_date, total_price, customer_id, payment_id, shipment_id)
VALUES
    ('2023-08-15', 999.98, 1, 1, 1),
    ('2023-08-16', 59.97, 2, 2, 2),
    ('2023-08-17', 29.99, 3, 3, 3),
    ('2023-08-18', 39.98, 4, 4, 4),
    ('2023-08-19', 19.99, 5, 5, 5),
    ('2023-08-20', 199.96, 6, 6, 6),
    ('2023-08-21', 1399.98, 7, 7, 7),
    ('2023-08-22', 9.99, 8, 8, 8),
    ('2023-08-23', 89.97, 9, 9, 9),
    ('2023-08-24', 59.98, 10, 10, 10),
    ('2023-08-15', 14.99, 11, 11, 11),
    ('2023-08-16', 179.97, 12, 12, 12),
    ('2023-08-17', 179.97, 13, 13, 13),
    ('2023-08-18', 199.96, 14, 14, 14),
    ('2023-08-19', 49.99, 15, 15, 15),
    ('2023-08-20', 59.98, 16, 16, 16),
    ('2023-08-21', 12.99, 17, 17, 17),
    ('2023-08-22', 59.97, 18, 18, 18),
    ('2023-08-23', 159.98, 19, 19, 19),
    ('2023-08-24', 99.99, 20, 20, 20);

-- Insert 20 records into the Order_Item table
INSERT INTO Order_Item (quantity, price, product_id, order_id)
VALUES
    (2, 499.98, 1, 1),
    (3, 59.97, 5, 2),
    (1, 29.99, 7, 3),
    (2, 39.98, 2, 4),
    (1, 19.99, 10, 5),
    (4, 199.96, 9, 6),
    (2, 699.98, 6, 7),
    (1, 9.99, 4, 8),
    (3, 89.97, 3, 9),
    (2, 59.98, 8, 10),
    (1, 14.99, 12, 11),
    (2, 179.97, 13, 12),
    (3, 179.97, 1, 13),
    (4, 199.96, 14, 14),
    (1, 49.99, 15, 15),
    (2, 59.98, 16, 16),
    (1, 12.99, 17, 17),
    (3, 59.97, 18, 18),
    (2, 159.98, 19, 19),
    (1, 99.99, 20, 20);

-- Insert 20 records into the Wishlist table
INSERT INTO Wishlist (customer_id, product_id)
VALUES
    (1, 3),
    (2, 5),
    (3, 7),
    (4, 2),
    (5, 10),
    (6, 9),
    (7, 6),
    (8, 4),
    (9, 1),
    (10, 8),
    (11, 12),
    (12, 13),
    (13, 1),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20);

-- To Display all records from tables
select * from customer;
select * from cart;
select * from product;
select * from orders;
select * from payment;
select * from order_item;
select * from wishlist;
select * from shipment;
select * from category;

-- Question: What is the total number of customers in the database?
SELECT COUNT(*) AS Total_customers FROM Customer;

-- Count of customer city wise
SELECT city, COUNT(*) AS customer_count FROM shipment GROUP BY city;

-- Question: What is the average price of products in each category?
SELECT c.name AS category, AVG(p.price) AS avg_price FROM Product p
JOIN Category c ON p.category_id = c.category_id GROUP BY c.name;

-- Question: Which products have the highest stock levels?
SELECT SKU, description, stock FROM Product ORDER BY stock DESC LIMIT 5;

-- Question: What is the total revenue generated from cart items?
SELECT SUM(price) AS total_revenue FROM CART;

-- Question: Which customers have the largest average cart value?
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, AVG(ca.price) AS avg_cart_value
FROM Customer c JOIN CART ca ON c.customer_id = ca.customer_id GROUP BY c.customer_id
ORDER BY avg_cart_value DESC LIMIT 5;

-- Question: What is the average delivery time for shipments?
SELECT AVG(DATEDIFF(shipment_date, order_date)) AS avg_delivery_time FROM Orders o
JOIN Shipment s ON o.shipment_id = s.shipment_id;

-- Question: Which state has the highest number of shipments?
SELECT state, COUNT(*) AS shipment_count
FROM Shipment
GROUP BY state
ORDER BY shipment_count DESC
LIMIT 1;

-- Retrieve all products in a specific category (e.g., Electronics):
SELECT * FROM Product WHERE category_id = (SELECT category_id FROM Category WHERE name = 'Electronics');


-- Question: What are the top three payment methods used by customers?
SELECT payment_method, COUNT(*) AS usage_count
FROM Payment
GROUP BY payment_method
ORDER BY usage_count DESC
LIMIT 3;

-- Question: What is the average order value (total price) for each customer?
SELECT customer_id, AVG(total_price) AS avg_order_value FROM Orders GROUP BY customer_id;

-- Question: Is there any correlation between order quantity and order total price?
SELECT quantity, AVG(price) AS avg_total_price FROM Order_Item GROUP BY quantity ORDER BY quantity;

-- Question: Which products are most frequently added to customers' wishlists?
SELECT product_id, COUNT(*) AS wishlist_count FROM Wishlist GROUP BY product_id ORDER BY wishlist_count DESC LIMIT 5;

-- Question: How many customers have at least one product in their wishlist?
SELECT COUNT(DISTINCT customer_id) AS customers_with_wishlist FROM Wishlist;


-- Question: Are there any patterns in customer behavior, such as frequent buyers or one-time shoppers?
SELECT customer_id, COUNT(order_id) AS order_count FROM Orders GROUP BY customer_id
ORDER BY order_count DESC LIMIT 5;

-- Question: List all products in stock with their quantities:
SELECT SKU, description, stock
FROM Product
WHERE stock > 0;

-- Question: Retrieve a list of orders placed by a specific customer along with the order date, total price, and shipment status.
SELECT o.order_id, o.order_date, o.total_price, s.shipment_date, 
CASE 
WHEN s.shipment_id IS NULL THEN 'Not Shipped' 
ELSE 'Shipped' END AS shipment_status 
FROM Orders o
LEFT JOIN Shipment s ON o.shipment_id = s.shipment_id WHERE o.customer_id = 1;

-- Question: Retrieve the products in a specific customer's wishlist.
SELECT w.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, p.product_id, p.description, p.price
FROM Wishlist w INNER JOIN Product p ON w.product_id = p.product_id
INNER JOIN Customer c ON w.customer_id = c.customer_id
WHERE w.customer_id = 1;



