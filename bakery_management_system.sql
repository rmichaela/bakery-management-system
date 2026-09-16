CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Position VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    SupplierID INT NOT NULL,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL UNIQUE,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

----

INSERT INTO Customers (CustomerID, CustomerName, Phone, Email) VALUES
(1, 'Maria Santos', '09171234567', 'maria@gmail.com'),
(2, 'John Cruz', '09181234567', 'john@gmail.com'),
(3, 'Angela Reyes', '09191234567', 'angela@gmail.com'),
(4, 'Mark Dela Cruz', '09201234567', 'mark@gmail.com'),
(5, 'Sofia Garcia', '09211234567', 'sofia@gmail.com');

INSERT INTO Suppliers (SupplierID, SupplierName, ContactNumber, Email) VALUES
(1, 'Fresh Harvest Supplies', '09171234501', 'freshharvest@gmail.com'),
(2, 'Golden Grain Trading', '09181234502', 'goldengrain@gmail.com'),
(3, 'Sweet Source Bakery Supply', '09191234503', 'sweetsource@gmail.com'),
(4, 'Prime Food Ingredients', '09201234504', 'primefood@gmail.com'),
(5, 'Daily Bake Suppliers', '09211234505', 'dailybake@gmail.com');

INSERT INTO Employees (EmployeeID, EmployeeName, Position, Phone) VALUES
(1, 'Anna Lopez', 'Cashier', '09171234601'),
(2, 'Brian Santos', 'Baker', '09181234602'),
(3, 'Carla Reyes', 'Manager', '09191234603'),
(4, 'Daniel Cruz', 'Cashier', '09201234604'),
(5, 'Ella Garcia', 'Baker', '09211234605');

INSERT INTO Products (ProductID, SupplierID, ProductName, Category, Price, StockQuantity) VALUES
(1, 1, 'Chocolate Cake', 'Cakes', 850.00, 10),
(2, 2, 'Butter Croissant', 'Pastry', 75.00, 25),
(3, 3, 'Blueberry Muffin', 'Pastry', 65.00, 30),
(4, 4, 'Cheese Bread', 'Bread', 55.00, 20),
(5, 5, 'Red Velvet Cake', 'Cakes', 900.00, 8);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, Status) VALUES
(1, 1, 1, '2026-09-01', 850.00, 'Completed'),
(2, 2, 2, '2026-09-02', 150.00, 'Completed'),
(3, 3, 3, '2026-09-03', 260.00, 'Completed'),
(4, 4, 4, '2026-09-04', 900.00, 'Pending'),
(5, 5, 5, '2026-09-05', 65.00, 'Completed');

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal) VALUES
(1, 1, 1, 1, 850.00),
(2, 2, 2, 2, 150.00),
(3, 3, 3, 4, 260.00),
(4, 4, 5, 1, 900.00),
(5, 5, 3, 1, 65.00);

INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 1, '2026-09-01', 850.00, 'Cash'),
(2, 2, '2026-09-02', 150.00, 'GCash'),
(3, 3, '2026-09-03', 260.00, 'Cash'),
(4, 4, '2026-09-04', 900.00, 'Credit Card'),
(5, 5, '2026-09-05', 65.00, 'GCash');

---

INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 1, '2026-09-01', 850.00, 'Cash'),
(2, 2, '2026-09-02', 150.00, 'GCash'),
(3, 3, '2026-09-03', 260.00, 'Cash'),
(4, 4, '2026-09-04', 900.00, 'Credit Card'),
(5, 5, '2026-09-05', 65.00, 'GCash');

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate, Orders.TotalAmount
FROM Orders
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

SELECT OrderDetails.OrderID, Products.ProductName, OrderDetails.Quantity, OrderDetails.Subtotal
FROM OrderDetails
JOIN Products
ON OrderDetails.ProductID = Products.ProductID;

SELECT Category, COUNT(*) AS NumberOfProducts
FROM Products
GROUP BY Category;

SELECT PaymentMethod, SUM(Amount) AS TotalPayments
FROM Payments
GROUP BY PaymentMethod;