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