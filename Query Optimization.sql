-- Project: Query Optimization
-- Problem: Slow query due to missing indexes and inefficient joins
-- Goal: Optimize query to reduce execution time

-- BEFORE Optimization (Slow query)
SELECT e.EmployeeID, e.Name, d.DepartmentName, s.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.Salary > 50000
ORDER BY e.Name;

-- AFTER Optimization
-- Step 1: Create indexes to speed up joins and filter
CREATE NONCLUSTERED INDEX IDX_Employees_DepartmentID ON Employees(DepartmentID);
CREATE NONCLUSTERED INDEX IDX_Salaries_EmployeeID_Salary ON Salaries(EmployeeID, Salary);

-- Step 2: Rewrite query (if necessary) remains the same here, indexes do the heavy lifting
SELECT e.EmployeeID, e.Name, d.DepartmentName, s.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.Salary > 50000
ORDER BY e.Name;
