-- Example 1: Python to SQL Translation
-- Ask Copilot Chat: "Help translate this Python data processing logic to a SQL query"
-- Original Python code:
/*
def process_data(data, threshold=0.5):
    filtered = [x for x in data if x > threshold]
    if not filtered:
        return []
    min_val = min(filtered)
    max_val = max(filtered)
    normalized = [(x - min_val) / (max_val - min_val) for x in filtered]
    return normalized
*/

-- SQL version needs translation of:
-- 1. Filtering (WHERE clause)
-- 2. Normalization using window functions or subqueries
-- Assume `DataTable` has a column `value`
-- Ask Copilot Chat: "Complete this SQL translation using CTEs"
WITH FilteredData AS (
    -- ...
)
-- ...


-- Example 2: Translating messy Python code to a clean SQL CASE statement
-- Ask Copilot Chat: "Help translate and clean up this Python logic into a SQL query"
-- Original Python code:
/*
def messyCalculation(x,y,z,flag=False):
    if flag==True:
        temp=x+y
        if temp>10:
         result=temp*z
        else:
            if z!=0:
             result=temp/z
            else:
                result=temp
*/

-- Assume a table `Calculations` with columns x, y, z, flag
-- Ask Copilot Chat: "Complete this clean SQL translation using a CASE statement"
SELECT
    x, y, z, flag,
    -- ...
    AS result
FROM Calculations;


-- Example 3: Optimizing algorithms across languages
-- Ask Copilot Chat: "Help translate this procedural Python code to an efficient, set-based SQL query"
-- Original Python code:
/*
def find_duplicates(items):
    duplicates = []
    for i in range(len(items)):
        for j in range(len(items)):
            if i != j and items[i] == items[j] and items[i] not in duplicates:
                duplicates.append(items[i])
    return duplicates
*/

-- Assume a table `Items` with a column `item_value`
-- Ask Copilot Chat: "Complete this optimized SQL query to find duplicates"
SELECT item_value
FROM Items
-- ...
;
