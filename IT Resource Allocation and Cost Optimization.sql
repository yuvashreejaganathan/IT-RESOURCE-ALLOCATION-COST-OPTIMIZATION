--List employees who are working on multiple projects
SELECT e.EmployeeID, e.EmployeeName, COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
HAVING COUNT(ep.ProjectID) > 1



-- Find the top 5 projects with maximum employee allocation
SELECT p.ProjectName, COUNT(ep.EmployeeID) AS EmployeeCount
FROM Projects p
JOIN Employee_Project ep ON p.ProjectID = ep.ProjectID
GROUP BY p.ProjectName
ORDER BY EmployeeCount DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


--Find employees with missing salary info 
SELECT EmployeeID, EmployeeName, Department, Role
FROM Employees
WHERE Salary IS NULL;

--Calculate average hours worked per project

SELECT p.ProjectName, AVG(ep.HoursWorked) AS AvgHours
FROM Projects p
JOIN Employee_Project ep ON p.ProjectID = ep.ProjectID
WHERE ep.HoursWorked IS NOT NULL
GROUP BY p.ProjectName;

--List employees who exited but still linked to projects
SELECT e.EmployeeName, p.ProjectName, e.ExitDate
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON p.ProjectID = ep.ProjectID
WHERE e.ExitDate IS NOT NULL AND p.EndDate IS NULL

--Month-over-Month new employee hires
SELECT FORMAT(JoinDate, 'yyyy-MM') AS Month, COUNT(*) AS Hires
FROM Employees
GROUP BY FORMAT(JoinDate, 'yyyy-MM')
ORDER BY Month;

--Highest paid employee(s) per department
SELECT Department, EmployeeName, Salary
FROM Employees e1
WHERE Salary = (
    SELECT MAX(Salary) 
    FROM Employees e2 
    WHERE e1.Department = e2.Department)

--Find underutilized employees (<50 hrs total)

SELECT e.EmployeeID, e.EmployeeName, SUM(ISNULL(ep.HoursWorked,0)) AS TotalHours
FROM Employees e
LEFT JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
HAVING SUM(ISNULL(ep.HoursWorked,0)) < 50;


--Project duration analysis (in days)
SELECT ProjectName, 
       DATEDIFF(DAY, StartDate, ISNULL(EndDate, GETDATE())) AS DurationDays
FROM Projects;




--Cost allocation per project (salary-based)
SELECT p.ProjectName, SUM(e.Salary * (ep.HoursWorked/160.0)) AS EstimatedCost
FROM Projects p
JOIN Employee_Project ep ON p.ProjectID = ep.ProjectID
JOIN Employees e ON e.EmployeeID = ep.EmployeeID
WHERE e.Salary IS NOT NULL AND ep.HoursWorked IS NOT NULL
GROUP BY p.ProjectName;

--List all employees and their allocated projects
SELECT e.EmployeeName, p.ProjectName, ep.HoursWorked, ep.RoleInProject
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID;

--Find total salary expense per department
SELECT Department, SUM(Salary) AS Total_Salary_Expense
FROM Employees
GROUP BY Department
ORDER BY Total_Salary_Expense DESC;

--Count how many employees are working in each project
SELECT p.ProjectName, COUNT(ep.EmployeeID) AS NoOfEmployees
FROM Projects p
JOIN Employee_Project ep ON p.ProjectID = ep.ProjectID
GROUP BY p.ProjectName
ORDER BY NoOfEmployees DESC;

--Average hours worked per employee in all projects
SELECT e.EmployeeName, AVG(ep.HoursWorked) AS Avg_Hours
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeName;

--Find the Total project cost including Budget + Allocated salaries 
SELECT p.ProjectName,
       p.Budget,
       SUM(e.Salary * (ep.HoursWorked/160.0)) AS Salary_Cost,
       p.Budget + SUM(e.Salary * (ep.HoursWorked/160.0)) AS Total_Cost
FROM Projects p
JOIN Employee_Project ep ON p.ProjectID = ep.ProjectID
JOIN Employees e ON e.EmployeeID = ep.EmployeeID
GROUP BY p.ProjectName, p.Budget;

--Find top 3 highest paid employees
SELECT TOP 3 EmployeeName, Salary
FROM Employees
ORDER BY Salary DESC;

-- Department-wise average salary
SELECT Department, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department
ORDER BY Avg_Salary DESC;

-- Employees who left 
SELECT EmployeeName, Department, Role, ExitDate
FROM Employees
WHERE ExitDate IS NOT NULL;

-- Find total hours contributed by each department to projects
SELECT e.Department, SUM(ep.HoursWorked) AS Total_Hours
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.Department
ORDER BY Total_Hours DESC;

-- 12. Find employees with no project allocation
SELECT e.EmployeeName, e.Department
FROM Employees e
LEFT JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.EmployeeID IS NULL;


