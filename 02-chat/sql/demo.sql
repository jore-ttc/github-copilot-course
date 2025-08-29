-- Use Copilot Chat to document this function
-- T-SQL Syntax
CREATE FUNCTION dbo.ComplexFunction(@a INT, @b INT, @c INT)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;
    IF @a > 10
    BEGIN
        IF @b < 5
            SET @result = @a * @b - @c;
        ELSE
            SET @result = @a / @b + @c;
    END
    ELSE
    BEGIN
        IF @c = 0
            SET @result = @a + @b;
        ELSE
            SET @result = @a - @b * @c;
    END
    RETURN @result;
END;
GO

-- Use Copilot Chat to refactor this query
-- Assume a table named 'DataTable' with columns 'type' (VARCHAR) and 'value' (INT)
-- Ask Copilot: "Refactor this query to be more readable and efficient"
SELECT
    CASE
        WHEN type = 'A' AND value > 100 THEN value * 0.8
        WHEN type = 'B' AND value < 50 THEN value * 1.2
        ELSE NULL
    END AS processed_value
FROM DataTable
WHERE (type = 'A' AND value > 100) OR (type = 'B' AND value < 50);
GO


-- Use Copilot Chat to explain this query
-- Ask Copilot: "Explain what this SQL query does, especially the PIVOT operator"
-- Assume a table 'Sales' with columns: 'Year', 'Quarter', 'Amount'
SELECT Year, Q1, Q2, Q3, Q4
FROM
(
  SELECT Year, Quarter, Amount
  FROM Sales
) AS SourceTable
PIVOT
(
  SUM(Amount)
  FOR Quarter IN (Q1, Q2, Q3, Q4)
) AS PivotTable;
GO
