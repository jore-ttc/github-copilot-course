-- Ask Copilot Chat: "/explain this query"

-- Explanation 1: What is a Common Table Expression (CTE)?
-- Ask: "Explain what the 'WITH' clause does here."
WITH RegionalSales AS (
    SELECT Region, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY Region
)
SELECT Region, TotalSales
FROM RegionalSales
WHERE TotalSales > 100000;
GO

-- Explanation 2: What are Window Functions?
-- Ask: "Explain what 'ROW_NUMBER() OVER (PARTITION BY ...)' does."
SELECT
    EmployeeName,
    Department,
    Salary,
    ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Salary DESC) AS RankInDept
FROM Employees;
GO

-- Explanation 3: What is a LEFT JOIN vs. INNER JOIN?
-- Ask: "Explain the difference between the LEFT JOIN and INNER JOIN used in these two queries."
-- Query A
SELECT c.CustomerName, o.OrderID
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Query B
SELECT c.CustomerName, o.OrderID
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
GO

-- Explanation 4: What is a Subquery?
-- Ask: "Explain how the subquery in the WHERE clause works."
SELECT EmployeeName
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Location = 'New York');
GO

-- Explanation 5: What does the PIVOT operator do?
-- Ask: "Explain what this PIVOT query is doing."
SELECT 'TotalSales' AS SalesType, [2021], [2022], [2023]
FROM
(
    SELECT Amount, YEAR(OrderDate) AS OrderYear
    FROM Orders
) AS SourceTable
PIVOT
(
    SUM(Amount)
    FOR OrderYear IN ([2021], [2022], [2023])
) AS PivotTable;
GO
