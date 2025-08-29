-- Ask Copilot Chat: "/fix this query" or "what is wrong with this query?"

-- Bug 1: Incorrect JOIN condition
-- This query is supposed to find employees and their departments, but it uses the wrong columns to join.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.EmployeeID = d.DepartmentID; -- Should be e.DepartmentID = d.DepartmentID

-- Bug 2: Incorrect aggregate function
-- This query tries to find the highest salary, but it uses AVG instead of MAX.
SELECT AVG(Salary)
FROM Employees;

-- Bug 3: Forgetting to handle NULLs
-- This query calculates total sales, but it will return NULL if any 'Amount' is NULL, instead of treating it as 0.
SELECT SUM(Amount)
FROM Sales;
-- Correct version might use: SUM(ISNULL(Amount, 0))

-- Bug 4: Incorrect filtering logic in WHERE clause
-- This query is supposed to find orders from 2023, but the date logic is wrong.
SELECT OrderID, OrderDate
FROM Orders
WHERE YEAR(OrderDate) = '2023'; -- In many SQL dialects, YEAR() is correct, but this can fail or be inefficient.
-- A better way is: WHERE OrderDate >= '2023-01-01' AND OrderDate < '2024-01-01'

-- Bug 5: Division by zero
-- This query calculates the average item price from total revenue and quantity, but doesn't handle cases where quantity is zero.
SELECT TotalRevenue / TotalQuantity
FROM DailyStats;
-- A safer version would use NULLIF: TotalRevenue / NULLIF(TotalQuantity, 0)
