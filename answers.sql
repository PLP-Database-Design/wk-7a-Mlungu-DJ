-- question 1
-- Transforming ProductDetail table into 1NF
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- question 2
-- Creating a Customer table to remove partial dependency
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Populating the Customer table
INSERT INTO Customer (CustomerID, CustomerName)
VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Emily Clark');

-- Creating a new OrderDetails table in 2NF
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    CustomerID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Populating the OrderDetails_2NF table
INSERT INTO OrderDetails_2NF (OrderID, CustomerID, Product, Quantity)
VALUES
(101, 1, 'Laptop', 2),
(101, 1, 'Mouse', 1),
(102, 2, 'Tablet', 3),
(102, 2, 'Keyboard', 1),
(102, 2, 'Mouse', 2),
(103, 3, 'Phone', 1);